# User Threading Library - Design Document

**Platform**: xv6 user space  
**Architecture**: x86 32-bit  
**Language**: C + x86 Assembly

## What This Is

A threading library running entirely in xv6 user space. 

## Data Structures

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

**Context offsets (4, 8, 16, 20...):**

These come from sizeof(uint) = 4 bytes:
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

### Global Thread State

```c
static thread_t threads[MAX_THREADS];    // Thread table (64 slots)
static thread_t *current_thread = 0;     // Currently running thread
```

No locks needed because we're cooperative - only one thread runs at a time until it yields.

**Why 64 threads?** 
- Small enough to keep memory usage reasonable (64 * sizeof(thread_t) ≈ 4KB)
- Big enough for typical test programs
- Power of 2 makes array indexing clean
- xv6 has limited heap space (~4MB total), can't afford thousands of thread slots

### Mutex

```c
typedef struct {
    int locked;
    int owner;
    void *wait_chan;
} mutex_t;
```

- `locked`: 1 if locked, 0 if free
- `owner`: TID of thread holding the lock (-1 if unlocked)
- `wait_chan`: Sleep channel for threads waiting on this mutex

### Condition Variable

```c
typedef struct {
    void *wait_chan;
} cond_t;
```

- `wait_chan`: Sleep channel for threads waiting on this condition
- Minimal structure - all logic in operations

### Channel

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

Go-style buffered channel:
- `buffer`: Circular buffer of void pointers
- `capacity`: Maximum number of items
- `count`: Current number of items
- `read_idx`: Next position to read from
- `write_idx`: Next position to write to
- `is_closed`: Flag indicating channel is closed
- `lock`: Mutex protecting the channel
- `not_empty`: Condition variable for receivers (wait when empty)
- `not_full`: Condition variable for senders (wait when full)

**Channel capacity choices:**
- Capacity 1: Rendezvous channel - sender blocks until receiver ready
- Capacity 3-5: Typical for tests - small enough to trigger blocking, big enough to buffer
- Large capacity (>10): Rarely blocks but wastes memory (capacity × sizeof(void*) bytes)
- Our test code uses capacity 3-5 to exercise the blocking/wakeup code paths

### File State Structure

```c
typedef struct {
    mutex_t m;
    cond_t cond_read;
    cond_t cond_write;
    int readable;
    int writable;
    int fd;
} file_state_t;
```

**One state per file descriptor:**
- `m`: Mutex protecting this file descriptor's operations
- `cond_read`: Condition variable for threads waiting to read
- `cond_write`: Condition variable for threads waiting to write
- `readable`: Flag indicating if file has data available
- `writable`: Flag indicating if file can accept writes
- `fd`: File descriptor number (for validation)

**Why per-FD state?**
- Different files have different I/O characteristics
- Allows concurrent I/O on different files
- Each FD needs its own wait queue

**Why two condition variables?**
- Readers and writers wait for different conditions
- Reader waits for data availability (EOF → wait for write)
- Writer waits for space availability (full → wait for read/space)
- Separate channels allow precise wakeup (signal readers when write happens, signal writers when read happens)

### Global File State Table

```c
static file_state_t file_states[MAX_FDS];
static int file_states_initialized = 0;
```

**MAX_FDS = 64:**
- Matches xv6's NOFILE limit (typically 16, but we support up to 64)
- Array-based lookup: O(1) access by FD
- Lazy initialization: Only allocate when first file is opened
- Unused slots just sit there (cheap - just zeroed memory)

**Why not hash table or linked list?**
- FDs are small integers (0-63), array indexing is fastest
- No dynamic allocation needed
- Simple bounds checking: `if (fd < 0 || fd >= MAX_FDS)`

## Functionality Design

### Thread Creation

#### thread_create()

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

### Context Switching

#### thread_switch() - Assembly Implementation

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

The `ret` instruction pops the return address from the (now new) stack and jumps there. For new threads, this jumps to `thread_entry`. For existing threads, it returns to where they called yield.

### Scheduling

#### thread_schedule() - Round Robin

```c
void thread_schedule(void) {
    thread_t *old_thread, *new_thread;
    int start, i, idx;
    
    old_thread = current_thread;
    new_thread = 0;
    
    start = (current_thread->tid + 1) % MAX_THREADS;
    for (i = 0; i < MAX_THREADS; i++) {
        idx = (start + i) % MAX_THREADS;
        if (threads[idx].state == T_RUNNABLE) {
            new_thread = &threads[idx];
            break;
        }
    }
    
    if (!new_thread) {
        if (current_thread->state == T_RUNNING) {
            return;
        }
        exit();
    }
    
    if (new_thread == old_thread) {
        if (old_thread->state == T_RUNNABLE) {
            old_thread->state = T_RUNNING;
        }
        return;
    }
    
    if (old_thread->state == T_RUNNING) {
        old_thread->state = T_RUNNABLE;
    }
    new_thread->state = T_RUNNING;
    current_thread = new_thread;
    
    thread_switch(&old_thread->context, &new_thread->context);
}
```

Starts searching from `current_tid + 1` to give everyone a turn. If no runnable thread found, stays on current thread.

#### thread_yield()

Just calls `thread_schedule()`. Dead simple.

### Thread Lifecycle

#### thread_exit()

```c
void thread_exit(void *retval) {
    current_thread->retval = retval;
    current_thread->state = T_ZOMBIE;
    
    if (current_thread->join_waiter) {
        current_thread->join_waiter->state = T_RUNNABLE;
        current_thread->join_waiter->sleep_chan = 0;
    }
    
    thread_schedule();  // Never returns
}
```

Thread becomes zombie, wakes up any waiter, then schedules another thread. The zombie stays in the table until someone joins it.

#### thread_join()

```c
void *thread_join(int tid) {
    thread_t *t = find_thread(tid);
    
    while (t->state != T_ZOMBIE) {
        t->join_waiter = current_thread;
        current_thread->sleep_chan = t;
        current_thread->state = T_SLEEPING;
        thread_schedule();
    }
    
    void *retval = t->retval;
    free(t->stack);
    t->state = T_UNUSED;
    
    return retval;
}
```

If target not zombie yet, sleep and wait. When woken up (by target's exit), collect return value and free resources.

### Sleep/Wakeup

Base mechanism for all synchronization:

```c
void thread_sleep(void *chan) {
    current_thread->sleep_chan = chan;
    current_thread->state = T_SLEEPING;
    thread_schedule();
}

void thread_wakeup(void *chan) {
    for (int i = 0; i < MAX_THREADS; i++) {
        if (threads[i].state == T_SLEEPING && 
            threads[i].sleep_chan == chan) {
            threads[i].state = T_RUNNABLE;
            threads[i].sleep_chan = 0;
        }
    }
}
```

The channel is just a void pointer - typically the address of the lock/condition variable. Threads sleeping on the same channel get woken up together.

**Why sleep/wakeup vs. spinlocks:**
- No busy waiting - blocked thread doesn't consume CPU
- Cooperative scheduler makes this safe
- If we used spinlocks: `while (locked) ;` would deadlock immediately because we're not preemptive

### Mutex Operations

#### mutex_lock()

```c
void mutex_lock(mutex_t *m) {
    while (m->locked) {
        thread_sleep(m->wait_chan);
    }
    m->locked = 1;
    m->owner = thread_self();
}
```

Not perfect - there's a small window between checking `locked` and setting it where another thread could slip in. But we're cooperative, so this only matters if you yield inside the critical section (don't do that).

#### mutex_unlock()

```c
void mutex_unlock(mutex_t *m) {
    if (m->owner != thread_self()) {
        return;  // Error handling
    }
    m->locked = 0;
    m->owner = -1;
    thread_wakeup(m->wait_chan);
}
```

#### mutex_trylock()

```c
int mutex_trylock(mutex_t *m) {
    if (m->locked)
        return 0;
    m->locked = 1;
    m->owner = thread_self();
    return 1;
}
```

Just checks without sleeping.

### Condition Variable Operations

#### cond_wait()

```c
void cond_wait(cond_t *c, mutex_t *m) {
    if (m->owner != thread_self()) {
        return;  // Error handling
    }
    
    m->locked = 0;
    m->owner = -1;
    thread_wakeup(m->wait_chan);  // Wake up waiting mutex threads
    
    thread_sleep(c->wait_chan);
    
    mutex_lock(m);  // Reacquire on wakeup
}
```

Standard Mesa semantics: wake up, reacquire lock, recheck condition in a while loop.

#### cond_signal() and cond_broadcast()

```c
void cond_signal(cond_t *c) {
    thread_wakeup(c->wait_chan);
}

void cond_broadcast(cond_t *c) {
    thread_wakeup(c->wait_chan);  // Wakes all
}
```

### Channel Operations

#### channel_send()

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

Circular buffer protected by mutex. Two condition variables:
- `not_empty`: Receivers wait on this when buffer is empty
- `not_full`: Senders wait on this when buffer is full

Receive is symmetric. When channel is closed, waiting threads get woken up and return -1.

### File I/O Operations

#### Problem Statement

Standard `read()` and `write()` system calls block the entire process. In a multi-threaded program, if one thread calls `read()` on a file with no data, the whole process blocks - all threads stop running. This defeats the purpose of threading.

**Solution**: Wrap file I/O operations with async behavior. When a read finds no data (EOF) or a write can't complete, the current thread sleeps and yields to other runnable threads. When data becomes available (for reads) or space becomes available (for writes), waiting threads are woken up.

#### uopen() - File Opening

```c
int uopen(const char *path, int mode) {
    fd = open(path, mode);  // Native system call
    fs = &file_states[fd];
    fs->fd = fd;
    // Set readable/writable based on mode
    mutex_init(&fs->m);
    cond_init(&fs->cond_read);
    cond_init(&fs->cond_write);
    return fd;
}
```

**Direct system call for open:**
- Opening a file is fast and never blocks
- No need for async wrapper
- Just initialize the state structure

**Mode-based flags:**
- `O_RDONLY` or `O_RDWR` → `readable = 1`
- `O_WRONLY` or `O_RDWR` → `writable = 1`
- Used later to determine which condition variables to signal

#### uclose() - File Closing

```c
int uclose(int fd) {
    mutex_lock(&fs->m);
    fs->readable = 0;
    fs->writable = 0;
    fs->fd = -1;
    cond_broadcast(&fs->cond_read);   // Wake all waiting readers
    cond_broadcast(&fs->cond_write);  // Wake all waiting writers
    mutex_unlock(&fs->m);
    return close(fd);
}
```

**Why broadcast on close?**
- File is closing, no more I/O possible
- All waiting threads should wake up and see the error
- Prevents threads from sleeping forever on a closed file

**Why set fd = -1?**
- Marks the slot as unused
- Prevents reuse of stale state
- Validation check: `if (fs->fd != fd)` catches bugs

#### uread() - Async Read

```c
int uread(int fd, void *buf, int n) {
    mutex_lock(&fs->m);
    
    while (1) {
        mutex_unlock(&fs->m);
        ret = read(fd, buf, n);  // Try actual read
        mutex_lock(&fs->m);
        
        if (ret > 0) {
            // Success: data read
            fs->readable = 1;
            cond_signal(&fs->cond_write);  // Wake waiting writers
            mutex_unlock(&fs->m);
            return ret;
        }
        
        if (ret == 0) {
            // EOF: no data available
            fs->readable = 0;
            cond_wait(&fs->cond_read, &fs->m);  // Sleep until data available
            continue;  // Retry after wakeup
        }
        
        // Error (ret < 0)
        mutex_unlock(&fs->m);
        return ret;
    }
}
```

**Why unlock mutex before system call?**
- System call might take time (even if it returns immediately)
- Other threads can proceed with different files
- Only lock when manipulating shared state

**Why signal writers on successful read?**
- Reading data might free up space (for pipes/buffers)
- Writers waiting for space should check again
- Cross-direction signaling: read success → writer might succeed

**Why wait on cond_read when EOF?**
- No data available now
- But writer might add data later
- When writer calls `uwrite()`, it signals `cond_read` to wake readers

**Retry loop:**
- After wakeup, try reading again
- Might succeed if writer added data
- Might still be EOF (writer hasn't written yet) → sleep again

#### uwrite() - Async Write

```c
int uwrite(int fd, const void *buf, int n) {
    mutex_lock(&fs->m);
    
    while (1) {
        mutex_unlock(&fs->m);
        ret = write(fd, buf, n);  // Try actual write
        mutex_lock(&fs->m);
        
        if (ret == n) {
            // Success: all data written
            fs->writable = 1;
            cond_signal(&fs->cond_read);  // Wake waiting readers
            mutex_unlock(&fs->m);
            return ret;
        }
        
        if (ret >= 0 && ret < n) {
            // Partial write: buffer full
            fs->writable = 0;
            cond_wait(&fs->cond_write, &fs->m);  // Sleep until space available
            continue;  // Retry remaining data
        }
        
        // Error (ret < 0)
        mutex_unlock(&fs->m);
        return ret;
    }
}
```

**Why signal readers on successful write?**
- New data is now available
- Readers waiting for data should wake up
- Cross-direction signaling: write success → reader might succeed

**Partial write handling:**
- `write()` returns bytes written (0 to n)
- If `ret < n`, buffer is full
- Sleep and retry remaining `n - ret` bytes
- In practice, xv6's file system usually writes all or nothing, but we handle partial writes for completeness

**Why wait on cond_write when full?**
- No space available now
- But reader might consume data later
- When reader calls `uread()`, it signals `cond_write` to wake writers

**Key insight:** Writers signal readers, readers signal writers. This creates a feedback loop where I/O operations on one side enable operations on the other side.

#### Why Not Just Use read()/write()?

**Problem with blocking I/O:**
```c
// Thread 1
read(fd, buf, n);  // Blocks entire process if no data

// Thread 2
printf("hello");   // Never runs because Thread 1 blocked
```

**With async I/O:**
```c
// Thread 1
uread(fd, buf, n);  // Sleeps, yields to Thread 2

// Thread 2
printf("hello");    // Runs immediately!
```

**Cooperative scheduling requirement:**
- Since we're user-space threads, we must yield voluntarily
- Blocking system calls would freeze everything
- Async wrappers ensure threads yield when I/O can't proceed

## Design Trade-offs and Limitations

### Design Constants

#### MAX_THREADS = 64

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

#### STACK_SIZE = 4096 (4KB)

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

#### MAX_FDS = 64

**Why 64?**
- Matches our MAX_THREADS
- xv6 typically uses <16 FDs per process
- 64 is safe upper bound
- Array lookup is O(1) and simple

### Design Trade-offs

#### Per-FD mutex vs. global mutex

- **Per-FD**: Allows concurrent I/O on different files (better)
- **Global**: Simpler but serializes all file I/O (worse)
- Chose per-FD for better concurrency

#### Two condition variables vs. one

- **Two**: Precise wakeup (readers wake readers, writers wake writers)
- **One**: Simpler but spurious wakeups (worse)
- Chose two for efficiency

#### State flags (readable/writable)

- Track I/O availability to avoid unnecessary waits
- But flags can be stale (race conditions)
- In practice, we always try the system call first, then check result
- Flags are hints, not guarantees

### Limitations

#### Cooperative scheduling only

Threads must call `thread_yield()` or a blocking operation. No preemption. An infinite loop will hang everything.

#### No atomic operations

The mutex implementation has a theoretical race condition. In practice it works because we're cooperative.

#### Fixed stack size

4KB per thread. No overflow detection. Stack smashing will corrupt heap.
- Deep recursion (>100-200 levels) will overflow
- Large local arrays (>3KB) will overflow
- No stack canaries or guard pages to detect overflow

#### Maximum 64 threads

Hard limit from array size. Could be increased but wastes memory.
- Each thread_t is ~64 bytes
- 64 threads = 4KB for thread table
- 64 × 4KB stacks = 256KB total stack memory
- xv6 user heap is only ~4MB, so this is significant
- Going to 256 threads would eat 1MB just for stacks

#### Single process

All threads share the same xv6 process. If one thread exits the process, all threads die.
- xv6 has no concept of thread-local storage
- All threads see same file descriptors, memory, etc.
- `exit()` kills the whole process, not just one thread

#### File I/O Limitations

**Not true async I/O:**
- Still uses blocking system calls (`read()`, `write()`)
- Just wraps them with sleep/yield behavior
- True async I/O would use non-blocking FDs + select/poll (xv6 doesn't have these)

**File system specific:**
- Works well for regular files
- For pipes, might need different logic (xv6 pipes block differently)
- For devices (console), behavior depends on device driver

**No timeout mechanism:**
- Threads wait indefinitely for I/O
- Could add timeout with additional state tracking
- Current design keeps it simple

**Single process assumption:**
- All threads share same file descriptor table
- If one thread closes FD, others see it immediately
- This is actually correct behavior (xv6 FDs are process-wide)

## File Organization

```
src/
├── uthreads.h          - All type definitions and API declarations
├── uthreads.c          - Thread management (create/exit/join/schedule)
├── uthreads_switch.S   - x86 assembly context switch
├── uthreads_sync.c     - Mutex, condition variable, channel
└── uthreads_fileio.c   - Async file I/O wrappers (uopen/uread/uwrite/uclose)

tests/
└── uthreads_test.c     - All tests 

examples/
├── producer_consumer.c - Producer-consumer using channels
├── reader_writer.c     - Reader-writer lock using mutex+cond
└── file_producer_consumer.c - File-based producer-consumer using async I/O
```

## Why User Space?

Could have modified xv6 kernel to support kernel threads. Chose user space because:

1. **Learning value**: Implementing context switch in assembly teaches low-level details
2. **Portability**: Works on any xv6 without kernel changes
3. **Simplicity**: No privilege level switching, page table management, or interrupt handling
4. **Realistic**: Modern threading libraries (pthreads, goroutines) also do user-space scheduling

Trade-off: Can't use timer interrupts for preemption. Must rely on cooperation.

## Build Integration

Added to xv6's Makefile:

```makefile
ULIB_THREADS = ulib.o usys.o printf.o umalloc.o \
               user_threading_library_core/src/uthreads.o \
               user_threading_library_core/src/uthreads_sync.o \
               user_threading_library_core/src/uthreads_switch.o \
               user_threading_library_core/src/uthreads_fileio.o

UPROGS = \
    _uthreads_test \
    _producer_consumer \
    _reader_writer \
    _file_producer_consumer
```

The threading library objects get linked into threading programs. File I/O wrapper (`uthreads_fileio.o`) is only included in programs that use async I/O. Regular xv6 programs use standard `ULIB` without threading overhead.

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

**File producer-consumer** (`file_producer_consumer.c`): Producer-consumer pattern using async file I/O. Verifies I/O safety and concurrent file operations.
- 1 producer thread: writes 25 items to file
- 1 consumer thread: reads 25 items from file
- Uses separate file descriptors (O_RDWR for write, O_RDONLY for read) to avoid file pointer conflicts
- Producer appends to file (reads to EOF first, then writes)
- Consumer filters out initial file content, only processes "item X" lines
- Verifies: data integrity (all 25 items read), concurrent execution (output interleaving), no deadlock (program completes)

Run in xv6:
```bash
$ uthreads_test
```

## References

- xv6 source code - MIT PDOS
- Thread switching code inspired by xv6's process scheduler
- Channel implementation based on Go runtime (simplified)
