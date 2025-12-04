#ifndef UTHREADS_H
#define UTHREADS_H

#define MAX_THREADS 64
#define STACK_SIZE 4096

typedef enum {
    T_UNUSED,
    T_RUNNABLE,
    T_RUNNING,
    T_SLEEPING,
    T_ZOMBIE
} thread_state_t;

typedef struct {
    uint eax;
    uint ebx;
    uint ecx;
    uint edx;
    uint esi;
    uint edi;
    uint ebp;
    uint esp;
    uint eip;
} thread_context_t;

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

void thread_init(void);
int thread_create(void *(*start_routine)(void*), void *arg);
void thread_exit(void *retval);
void *thread_join(int tid);
void thread_yield(void);
int thread_self(void);

void thread_schedule(void);
void thread_switch(thread_context_t *old, thread_context_t *new);
void thread_sleep(void *chan);
void thread_wakeup(void *chan);

typedef struct {
    int locked;
    int owner;
    void *wait_chan;
} mutex_t;

void mutex_init(mutex_t *m);
void mutex_lock(mutex_t *m);
void mutex_unlock(mutex_t *m);
int mutex_trylock(mutex_t *m);

typedef struct {
    void *wait_chan;
} cond_t;

void cond_init(cond_t *c);
void cond_wait(cond_t *c, mutex_t *m);
void cond_signal(cond_t *c);
void cond_broadcast(cond_t *c);

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

typedef struct {
    mutex_t m;
    cond_t cond_read;
    cond_t cond_write;
    int readable;
    int writable;
    int fd;
} file_state_t;

int uopen(const char *path, int mode);
int uclose(int fd);
int uread(int fd, void *buf, int n);
int uwrite(int fd, const void *buf, int n);

#endif
