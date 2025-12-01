# User Threading Library - Design Document

**Platform**: xv6 user space  
**Architecture**: x86 32-bit  
**Language**: C + x86 Assembly

---

## What This Is

A complete threading library running entirely in xv6 user space. No kernel modifications needed. Threads share the same process address space but have independent stacks and execution contexts.

## Core Components

### Thread Control Block (TCB)

```c
typedef struct thread {
    int tid;
    thread_state_t state;
    void *stack;
    thread_context_t context;
    void *(*start_routine)(void*);
    void *arg;
    void *retval;
    struct thread *join_waiter;
    void *sleep_chan;
} thread_t;
```

Fields explained:
- `tid`: Thread ID (0-63), index into global thread table
  - 0 is valid (unlike PIDs which start at 1)
  - Doubles as array index - no conversion needed
  - TID 0 is typically the main thread
- `state`: T_UNUSED, T_RUNNABLE, T_RUNNING, T_SLEEPING, or T_ZOMBIE
- `stack`: Points to malloc'd 4KB stack
- `context`: Saved CPU registers (see below)
- `start_routine`: Thread function pointer
- `arg`: Argument passed to thread function
- `retval`: Return value from thread function
- `join_waiter`: Pointer to thread waiting in join()
  - Direct pointer, not TID - saves a lookup
  - NULL if no one is waiting
- `sleep_chan`: Sleep channel for synchronization
  - Just a void* - typically address of lock/cond var
  - Threads sleeping on same channel wake up together

### CPU Context

```c
typedef struct {
    uint eax, ebx, ecx, edx;
    uint esi, edi;
    uint ebp;
    uint esp;
    uint eip;
} thread_context_t;
```

These are the x86 registers we save/restore during context switch.

### Global State

```c
static thread_t threads[MAX_THREADS];    // Thread table (64 slots)
static int current_tid = 0;              // Currently running thread
```

No locks needed because we're cooperative - only one thread runs at a time until it yields.

**Why 64 threads?** 
- Small enough to keep memory usage reasonable (64 * sizeof(thread_t) ≈ 4KB)
- Big enough for typical test programs
- Power of 2 makes array indexing clean
- xv6 has limited heap space (~4MB total), can't afford thousands of thread slots

---

## Thread Creation

### thread_create()

1. Find unused slot in thread table (state == T_UNUSED)
2. Allocate 4KB stack with malloc()
3. Set up initial stack frame
4. Initialize context (esp, eip)
5. Set state to T_RUNNABLE
6. Return thread ID

**Why 4KB stack?**
- xv6 uses 4KB pages - natural alignment
- Same size as xv6 kernel stacks
- Enough for typical function calls (100-200 stack frames depending on local variables)
- Not too wasteful - 64 threads × 4KB = 256KB total
- No guard pages in xv6 user space, so overflow silently corrupts heap (bad but simple)

Stack setup for new thread:

```
High address
+------------------+
|     unused       |  <- stack + 4096
+------------------+
|  thread_entry    |  <- esp points here (stack grows down)
+------------------+
|     unused       |
+------------------+
Low address <- stack (malloc returns this address)
```

**Why stack grows downward (high → low):**
- x86 calling convention: `push` decrements esp, `pop` increments esp
- Historical reasons: original x86 chips did it this way
- Keeps code compatible with x86 standard

**Why esp = stack + 4096 - sizeof(void*):**
- `stack + 4096` is one byte past the allocated region
- Subtract `sizeof(void*)` to leave room for return address
- First `push` will write at `stack + 4092`

The `esp` register points to `thread_entry`, which is a wrapper function that:
1. Calls the user's thread function
2. Captures the return value
3. Calls thread_exit()

Initial register setup:
```c
t->context.esp = (uint)(t->stack + STACK_SIZE - sizeof(void*));
t->context.eip = (uint)thread_entry;
```

---

## Context Switching

### thread_switch() - Assembly Implementation

File: `uthreads_switch.S`

```asm
.globl thread_switch
thread_switch:
    movl 4(%esp), %eax      # eax = &old->context
    movl 8(%esp), %edx      # edx = &new->context
    
    # Save old context
    movl %ebx, 4(%eax)
    movl %ecx, 8(%eax)
    movl %esi, 16(%eax)
    movl %edi, 20(%eax)
    movl %ebp, 24(%eax)
    movl %esp, 28(%eax)
    movl (%esp), %ecx       # Return address
    movl %ecx, 32(%eax)
    
    # Load new context
    movl 4(%edx), %ebx
    movl 8(%edx), %ecx
    movl 16(%edx), %esi
    movl 20(%edx), %edi
    movl 24(%edx), %ebp
    movl 28(%edx), %esp     # Switch stack
    movl 32(%edx), %eax
    movl %eax, (%esp)       # Set return address
    
    ret
```

**Register offsets explained:**
- EAX at offset 0 (not saved - scratch register)
- EBX at offset 4 (4 bytes per register)
- ECX at offset 8
- EDX at offset 12 (not explicitly saved in our code - another scratch register)
- ESI at offset 16
- EDI at offset 20
- EBP at offset 24
- ESP at offset 28
- EIP at offset 32

These match the layout of `thread_context_t` struct. C compiler guarantees struct fields are laid out in order with proper alignment.

Why we don't save EAX: It's caller-saved in x86 calling convention - the caller expects it to be clobbered. We use it as scratch register here.

The `ret` instruction pops the return address from the (now new) stack and jumps there. For new threads, this jumps to `thread_entry`. For existing threads, it returns to where they called yield.

---

## Scheduling

### thread_schedule() - Round Robin

```c
void thread_schedule(void) {
    thread_t *old = &threads[current_tid];
    
    if (old->state == T_RUNNING)
        old->state = T_RUNNABLE;
    
    int next = (current_tid + 1) % MAX_THREADS;
    for (int i = 0; i < MAX_THREADS; i++) {
        if (threads[next].state == T_RUNNABLE) {
            current_tid = next;
            threads[next].state = T_RUNNING;
            thread_switch(&old->context, &threads[next].context);
            return;
        }
        next = (next + 1) % MAX_THREADS;
    }
}
```

Starts searching from `current_tid + 1` to give everyone a turn. If no runnable thread found, stays on current thread.

### thread_yield()

Just calls `thread_schedule()`. Dead simple.

---

## Thread Lifecycle

### thread_exit()

```c
void thread_exit(void *retval) {
    threads[current_tid].retval = retval;
    threads[current_tid].state = T_ZOMBIE;
    
    if (threads[current_tid].join_waiter) {
        threads[current_tid].join_waiter->state = T_RUNNABLE;
    }
    
    thread_schedule();  // Never returns
}
```

Thread becomes zombie, wakes up any waiter, then schedules another thread. The zombie stays in the table until someone joins it.

### thread_join()

```c
void *thread_join(int tid) {
    while (threads[tid].state != T_ZOMBIE) {
        threads[current_tid].join_waiter = &threads[tid];
        threads[current_tid].state = T_SLEEPING;
        thread_schedule();
    }
    
    void *retval = threads[tid].retval;
    threads[tid].state = T_UNUSED;
    free(threads[tid].stack);
    
    return retval;
}
```

If target not zombie yet, sleep and wait. When woken up (by target's exit), collect return value and free resources.

---

## Synchronization Primitives

### Sleep/Wakeup

Base mechanism for all synchronization:

```c
void thread_sleep(void *chan) {
    threads[current_tid].sleep_chan = chan;
    threads[current_tid].state = T_SLEEPING;
    thread_schedule();
}

void thread_wakeup(void *chan) {
    for (int i = 0; i < MAX_THREADS; i++) {
        if (threads[i].state == T_SLEEPING && 
            threads[i].sleep_chan == chan) {
            threads[i].state = T_RUNNABLE;
        }
    }
}
```

The channel is just a void pointer - typically the address of the lock/condition variable. Threads sleeping on the same channel get woken up together.

### Mutex

```c
typedef struct {
    int locked;
    int owner;
    void *wait_chan;
} mutex_t;
```

```c
void mutex_lock(mutex_t *m) {
    while (m->locked) {
        thread_sleep(m->wait_chan);
    }
    m->locked = 1;
    m->owner = thread_self();
}

void mutex_unlock(mutex_t *m) {
    m->locked = 0;
    m->owner = -1;
    thread_wakeup(m->wait_chan);
}
```

Not perfect - there's a small window between checking `locked` and setting it where another thread could slip in. But we're cooperative, so this only matters if you yield inside the critical section (don't do that).

`mutex_trylock()` just checks without sleeping:

```c
int mutex_trylock(mutex_t *m) {
    if (m->locked)
        return 0;
    m->locked = 1;
    m->owner = thread_self();
    return 1;
}
```

### Condition Variable

```c
typedef struct {
    void *wait_chan;
} cond_t;
```

```c
void cond_wait(cond_t *c, mutex_t *m) {
    m->locked = 0;
    m->owner = -1;
    thread_wakeup(m->wait_chan);  // Wake up waiting mutex threads
    
    thread_sleep(c->wait_chan);
    
    mutex_lock(m);  // Reacquire on wakeup
}

void cond_signal(cond_t *c) {
    thread_wakeup(c->wait_chan);
}

void cond_broadcast(cond_t *c) {
    thread_wakeup(c->wait_chan);  // Wakes all
}
```

Standard Mesa semantics: wake up, reacquire lock, recheck condition in a while loop.

### Channel

Go-style buffered channel:

```c
typedef struct {
    void **buffer;
    int capacity;
    int count;
    int read_idx;
    int write_idx;
    int is_closed;
    mutex_t lock;
    cond_t not_empty;
    cond_t not_full;
} channel_t;
```

Circular buffer protected by mutex. Two condition variables:
- `not_empty`: Receivers wait on this when buffer is empty
- `not_full`: Senders wait on this when buffer is full

```c
int channel_send(channel_t *ch, void *data) {
    mutex_lock(&ch->lock);
    
    while (ch->count == ch->capacity && !ch->is_closed) {
        cond_wait(&ch->not_full, &ch->lock);
    }
    
    if (ch->is_closed) {
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    ch->buffer[ch->write_idx] = data;
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    ch->count++;
    
    cond_signal(&ch->not_empty);
    mutex_unlock(&ch->lock);
    return 0;
}
```

Receive is symmetric. When channel is closed, waiting threads get woken up and return -1.

**Channel capacity choices:**
- Capacity 1: Rendezvous channel - sender blocks until receiver ready
- Capacity 3-5: Typical for tests - small enough to trigger blocking, big enough to buffer
- Large capacity (>10): Rarely blocks but wastes memory (capacity × sizeof(void*) bytes)
- Our test code uses capacity 3-5 to exercise the blocking/wakeup code paths

---

## Design Constants and Trade-offs

### MAX_THREADS = 64

**Memory cost:**
```
Thread table: 64 × 64 bytes = 4KB
Stacks: 64 × 4KB = 256KB
Total: 260KB
```

**Why not more?**
- xv6 user heap is ~4MB total
- With 64 threads, we use ~6% for threading overhead
- 256 threads would use ~1MB (25% overhead)
- Most test programs need <10 threads

**Why not less?**
- 32 threads feels restrictive
- 64 is round number (6 bits for TID)
- Array-based design makes unused slots cheap (just zeroed memory)

### STACK_SIZE = 4096 (4KB)

**Typical usage:**
- Function call: ~16-32 bytes per frame (saved EBP, return address, args)
- With 4KB, can nest ~100-200 function calls
- Fibonacci(30) recursion depth: 30 frames, uses ~1KB

**Why not 2KB?**
- Too easy to overflow with modest recursion
- Some programs use large local arrays

**Why not 8KB?**
- Doubles memory overhead (512KB for 64 threads)
- Most threads don't need it
- xv6 kernel itself uses 4KB stacks

**Fun fact:** Linux default thread stack is 8MB. We can't afford that luxury in xv6's tiny address space.

### Context offsets (4, 8, 16, 20...)

**These come from sizeof(uint) = 4 bytes:**
```c
struct {
    uint eax;      // offset 0
    uint ebx;      // offset 4 = 0 + sizeof(uint)
    uint ecx;      // offset 8 = 4 + sizeof(uint)
    uint edx;      // offset 12
    uint esi;      // offset 16
    uint edi;      // offset 20
    uint ebp;      // offset 24
    uint esp;      // offset 28
    uint eip;      // offset 32
};
```

Not arbitrary - C struct layout is guaranteed by the compiler. Assembly code relies on this.

### Sleep/wakeup vs. spinlocks

**Why sleep/wakeup:**
- No busy waiting - blocked thread doesn't consume CPU
- Cooperative scheduler makes this safe

**If we used spinlocks:**
```c
while (locked) ;  // Infinite loop if thread holding lock never yields
```

This would deadlock immediately because we're not preemptive.

---

## Limitations

**Cooperative scheduling only**: Threads must call `thread_yield()` or a blocking operation. No preemption. An infinite loop will hang everything.

**No atomic operations**: The mutex implementation has a theoretical race condition. In practice it works because we're cooperative.

**Fixed stack size**: 4KB per thread. No overflow detection. Stack smashing will corrupt heap.
- Deep recursion (>100-200 levels) will overflow
- Large local arrays (>3KB) will overflow
- No stack canaries or guard pages to detect overflow

**Maximum 64 threads**: Hard limit from array size. Could be increased but wastes memory.
- Each thread_t is ~64 bytes
- 64 threads = 4KB for thread table
- 64 × 4KB stacks = 256KB total stack memory
- xv6 user heap is only ~4MB, so this is significant
- Going to 256 threads would eat 1MB just for stacks

**Single process**: All threads share the same xv6 process. If one thread exits the process, all threads die.
- xv6 has no concept of thread-local storage
- All threads see same file descriptors, memory, etc.
- `exit()` kills the whole process, not just one thread

---

## File Organization

```
src/
├── uthreads.h          - All type definitions and API declarations
├── uthreads.c          - Thread management (create/exit/join/schedule)
├── uthreads_switch.S   - x86 assembly context switch
└── uthreads_sync.c     - Mutex, condition variable, channel

tests/
└── uthreads_test.c     - all test

examples/
├── producer_consumer.c - Producer-consumer using channels
└── reader_writer.c     - Reader-writer lock using mutex+cond
```

---

## Why User Space?

Could have modified xv6 kernel to support kernel threads. Chose user space because:

1. **Learning value**: Implementing context switch in assembly teaches low-level details
2. **Portability**: Works on any xv6 without kernel changes
3. **Simplicity**: No privilege level switching, page table management, or interrupt handling
4. **Realistic**: Modern threading libraries (pthreads, goroutines) also do user-space scheduling

Trade-off: Can't use timer interrupts for preemption. Must rely on cooperation.

---

## Build Integration

Added to xv6's Makefile:

```makefile
ULIB = ulib.o usys.o printf.o umalloc.o \
       user_threading_library_core/src/uthreads.o \
       user_threading_library_core/src/uthreads_sync.o \
       user_threading_library_core/src/uthreads_switch.o

UPROGS = \
    _uthreads_test \
    _producer_consumer \
    _reader_writer
```

The threading library objects get linked into every user program. Programs that don't use threads just carry some dead code.

---

## Testing Strategy

**All test** (`uthreads_test.c`): Include all test for uthreads

**Producer-consumer** (`producer_consumer.c`): Multiple producers and consumers sharing a channel. Verifies synchronization works.
- 3 producers × 10 items = 30 items total
- 2 consumers (receive all 30 items)
- Channel capacity 5 (forces blocking)
- Numbers chosen to ensure blocking happens multiple times

**Reader-writer** (`reader_writer.c`): Custom reader-writer lock built from mutex and condition variables. Tests complex synchronization patterns.
- 5 readers × 3 reads each
- 2 writers × 3 writes each
- Final value should be exactly 6 (2 writers × 3 writes)
- More readers than writers to test write-priority logic

Run in xv6:
```bash
$ uthreads_test
```

---

## References

- xv6 source code - MIT PDOS
- Thread switching code inspired by xv6's process scheduler
- Channel implementation based on Go runtime (simplified)


