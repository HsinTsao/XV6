#include "types.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

thread_t threads[MAX_THREADS];
thread_t *current_thread = 0;
int next_tid = 0;

static void thread_entry(void);
static thread_t *find_thread(int tid);

static void thread_entry(void) {
    void *ret = current_thread->start_routine(current_thread->arg);
    thread_exit(ret);
}

static thread_t *find_thread(int tid) {
    if (tid < 0 || tid >= MAX_THREADS)
        return 0;
    if (threads[tid].state == T_UNUSED)
        return 0;
    return &threads[tid];
}

void thread_init(void) {
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
        threads[i].state = T_UNUSED;
        threads[i].tid = i;
        threads[i].stack = 0;
        threads[i].start_routine = 0;
        threads[i].arg = 0;
        threads[i].retval = 0;
        threads[i].join_waiter = 0;
        threads[i].sleep_chan = 0;
    }
    
    threads[0].state = T_RUNNING;
    threads[0].tid = 0;
    current_thread = &threads[0];
    next_tid = 1;
    
    printf(1, "[uthreads] Thread library initialized, main thread tid=0\n");
}

int thread_create(void *(*start_routine)(void*), void *arg) {
    thread_t *t;
    int i;
    uint *sp;
    
    if (!start_routine)
        return -1;
    
    t = 0;
    for (i = 0; i < MAX_THREADS; i++) {
        if (threads[i].state == T_UNUSED) {
            t = &threads[i];
            break;
        }
    }
    
    if (!t) {
        printf(2, "[uthreads] Error: Thread limit reached\n");
        return -1;
    }
    
    t->stack = malloc(STACK_SIZE);
    if (!t->stack) {
        printf(2, "[uthreads] Error: Stack allocation failed\n");
        return -1;
    }
    
    t->state = T_RUNNABLE;
    t->start_routine = start_routine;
    t->arg = arg;
    t->retval = 0;
    t->join_waiter = 0;
    t->sleep_chan = 0;
    
    memset(&t->context, 0, sizeof(thread_context_t));
    
    sp = (uint*)((char*)t->stack + STACK_SIZE);
    
    sp--;
    *sp = (uint)thread_entry;
    
    t->context.esp = (uint)sp;
    t->context.eip = (uint)thread_entry;
    
    printf(1, "[uthreads] Created thread tid=%d\n", t->tid);
    return t->tid;
}

void thread_exit(void *retval) {
    current_thread->retval = retval;
    current_thread->state = T_ZOMBIE;
    
    printf(1, "[uthreads] Thread tid=%d exiting\n", current_thread->tid);
    
    if (current_thread->join_waiter) {
        current_thread->join_waiter->state = T_RUNNABLE;
        current_thread->join_waiter->sleep_chan = 0;
    }
    
    thread_schedule();
    
    printf(2, "[uthreads] Error: thread_exit should not return\n");
    exit();
}

void *thread_join(int tid) {
    thread_t *t;
    void *retval;
    
    t = find_thread(tid);
    if (!t || t == current_thread) {
        printf(2, "[uthreads] Error: Invalid join target tid=%d\n", tid);
        return 0;
    }
    
    while (t->state != T_ZOMBIE) {
        if (t->join_waiter) {
            printf(2, "[uthreads] Error: Thread tid=%d already being joined\n", tid);
            return 0;
        }
        
        t->join_waiter = current_thread;
        current_thread->sleep_chan = t;
        current_thread->state = T_SLEEPING;
        
        thread_schedule();
    }
    
    retval = t->retval;
    
    if (t->stack) {
        free(t->stack);
        t->stack = 0;
    }
    t->state = T_UNUSED;
    
    printf(1, "[uthreads] Thread tid=%d joined\n", tid);
    return retval;
}

void thread_yield(void) {
    current_thread->state = T_RUNNABLE;
    thread_schedule();
}

int thread_self(void) {
    return current_thread->tid;
}

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
        
        printf(1, "[uthreads] All threads finished or blocked\n");
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

void thread_sleep(void *chan) {
    current_thread->sleep_chan = chan;
    current_thread->state = T_SLEEPING;
    thread_schedule();
}

void thread_wakeup(void *chan) {
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
        if (threads[i].state == T_SLEEPING && threads[i].sleep_chan == chan) {
            threads[i].state = T_RUNNABLE;
            threads[i].sleep_chan = 0;
        }
    }
}
