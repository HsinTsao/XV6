// uthreads.h - User-level threading library for xv6

#ifndef UTHREADS_H
#define UTHREADS_H

/* 常量定义 */
#define MAX_THREADS 64
#define STACK_SIZE 4096

/* 线程状态 */
typedef enum {
    T_UNUSED,       // 未使用
    T_RUNNABLE,     // 就绪态
    T_RUNNING,      // 运行态
    T_SLEEPING,     // 睡眠态
    T_ZOMBIE        // 僵尸态
} thread_state_t;

/* 线程上下文（x86 32位寄存器） */
typedef struct {
    uint eax;
    uint ebx;
    uint ecx;
    uint edx;
    uint esi;
    uint edi;
    uint ebp;
    uint esp;       // 栈指针
    uint eip;       // 指令指针
} thread_context_t;

/* 线程控制块 */
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

/* 线程管理 API */
void thread_init(void);
int thread_create(void *(*start_routine)(void*), void *arg);
void thread_exit(void *retval);
void *thread_join(int tid);
void thread_yield(void);
int thread_self(void);

/* 内部函数 */
void thread_schedule(void);
void thread_switch(thread_context_t *old, thread_context_t *new);
void thread_sleep(void *chan);
void thread_wakeup(void *chan);

/* 互斥锁 */
typedef struct {
    int locked;
    int owner;
    void *wait_chan;
} mutex_t;

void mutex_init(mutex_t *m);
void mutex_lock(mutex_t *m);
void mutex_unlock(mutex_t *m);
int mutex_trylock(mutex_t *m);

/* 条件变量 */
typedef struct {
    void *wait_chan;
} cond_t;

void cond_init(cond_t *c);
void cond_wait(cond_t *c, mutex_t *m);
void cond_signal(cond_t *c);
void cond_broadcast(cond_t *c);

/* Channel */
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

channel_t *channel_create(int capacity);
int channel_send(channel_t *ch, void *data);
int channel_recv(channel_t *ch, void **data);
void channel_close(channel_t *ch);
void channel_destroy(channel_t *ch);

#endif // UTHREADS_H

