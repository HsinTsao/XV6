// uthreads.c - User-level threading library implementation for xv6

#include "types.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

/* 全局变量 */
thread_t threads[MAX_THREADS];
thread_t *current_thread = 0;
int next_tid = 0;

/* 内部辅助函数 */
static void thread_entry(void);
static thread_t *find_thread(int tid);

/* 线程入口包装函数 */
static void thread_entry(void) {
    void *ret = current_thread->start_routine(current_thread->arg);
    thread_exit(ret);
}

/* 查找线程 */
static thread_t *find_thread(int tid) {
    if (tid < 0 || tid >= MAX_THREADS)
        return 0;
    if (threads[tid].state == T_UNUSED)
        return 0;
    return &threads[tid];
}

/* 初始化线程库 */
void thread_init(void) {
    int i;
    
    // 初始化线程表
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
    
    // 主线程
    threads[0].state = T_RUNNING;
    threads[0].tid = 0;
    current_thread = &threads[0];
    next_tid = 1;
    
    printf(1, "[uthreads] 线程库初始化完成，主线程 tid=0\n");
}

/* 创建线程 */
int thread_create(void *(*start_routine)(void*), void *arg) {
    thread_t *t;
    int i;
    uint *sp;
    
    if (!start_routine)
        return -1;
    
    // 查找空闲线程槽
    t = 0;
    for (i = 0; i < MAX_THREADS; i++) {
        if (threads[i].state == T_UNUSED) {
            t = &threads[i];
            break;
        }
    }
    
    if (!t) {
        printf(2, "[uthreads] 错误：线程数已达上限\n");
        return -1;
    }
    
    // 分配栈
    t->stack = malloc(STACK_SIZE);
    if (!t->stack) {
        printf(2, "[uthreads] 错误：栈分配失败\n");
        return -1;
    }
    
    // 初始化 TCB
    t->state = T_RUNNABLE;
    t->start_routine = start_routine;
    t->arg = arg;
    t->retval = 0;
    t->join_waiter = 0;
    t->sleep_chan = 0;
    
    // 初始化上下文
    memset(&t->context, 0, sizeof(thread_context_t));
    
    // 设置栈顶
    sp = (uint*)((char*)t->stack + STACK_SIZE);
    
    // 在栈上放置返回地址
    sp--;
    *sp = (uint)thread_entry;
    
    // 设置 esp 和 eip
    t->context.esp = (uint)sp;
    t->context.eip = (uint)thread_entry;
    
    printf(1, "[uthreads] 创建线程 tid=%d\n", t->tid);
    return t->tid;
}

/* 退出当前线程 */
void thread_exit(void *retval) {
    current_thread->retval = retval;
    current_thread->state = T_ZOMBIE;
    
    printf(1, "[uthreads] 线程 tid=%d 退出\n", current_thread->tid);
    
    // 唤醒等待的线程
    if (current_thread->join_waiter) {
        current_thread->join_waiter->state = T_RUNNABLE;
        current_thread->join_waiter->sleep_chan = 0;
    }
    
    // 调度到其他线程
    thread_schedule();
    
    // 不应该到这里
    printf(2, "[uthreads] 错误：thread_exit 不应返回\n");
    exit();
}

/* 等待线程结束 */
void *thread_join(int tid) {
    thread_t *t;
    void *retval;
    
    t = find_thread(tid);
    if (!t || t == current_thread) {
        printf(2, "[uthreads] 错误：无效的 join 目标 tid=%d\n", tid);
        return 0;
    }
    
    // 等待目标线程结束
    while (t->state != T_ZOMBIE) {
        if (t->join_waiter) {
            printf(2, "[uthreads] 错误：线程 tid=%d 已被其他线程 join\n", tid);
            return 0;
        }
        
        t->join_waiter = current_thread;
        current_thread->sleep_chan = t;
        current_thread->state = T_SLEEPING;
        
        thread_schedule();
    }
    
    // 获取返回值并清理
    retval = t->retval;
    
    if (t->stack) {
        free(t->stack);
        t->stack = 0;
    }
    t->state = T_UNUSED;
    
    printf(1, "[uthreads] 线程 tid=%d join 完成\n", tid);
    return retval;
}

/* 主动让出 CPU */
void thread_yield(void) {
    current_thread->state = T_RUNNABLE;
    thread_schedule();
}

/* 获取当前线程 ID */
int thread_self(void) {
    return current_thread->tid;
}

/* 调度器 */
void thread_schedule(void) {
    thread_t *old_thread, *new_thread;
    int start, i, idx;
    
    old_thread = current_thread;
    new_thread = 0;
    
    // Round-robin 调度
    start = (current_thread->tid + 1) % MAX_THREADS;
    for (i = 0; i < MAX_THREADS; i++) {
        idx = (start + i) % MAX_THREADS;
        if (threads[idx].state == T_RUNNABLE) {
            new_thread = &threads[idx];
            break;
        }
    }
    
    // 没有可运行的线程
    if (!new_thread) {
        if (current_thread->state == T_RUNNING) {
            return;
        }
        
        printf(1, "[uthreads] 所有线程已结束或阻塞\n");
        exit();
    }
    
    // 同一个线程
    if (new_thread == old_thread) {
        if (old_thread->state == T_RUNNABLE) {
            old_thread->state = T_RUNNING;
        }
        return;
    }
    
    // 更新状态
    if (old_thread->state == T_RUNNING) {
        old_thread->state = T_RUNNABLE;
    }
    new_thread->state = T_RUNNING;
    current_thread = new_thread;
    
    // 上下文切换
    thread_switch(&old_thread->context, &new_thread->context);
}

/* 线程睡眠 */
void thread_sleep(void *chan) {
    current_thread->sleep_chan = chan;
    current_thread->state = T_SLEEPING;
    thread_schedule();
}

/* 唤醒线程 */
void thread_wakeup(void *chan) {
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
        if (threads[i].state == T_SLEEPING && threads[i].sleep_chan == chan) {
            threads[i].state = T_RUNNABLE;
            threads[i].sleep_chan = 0;
        }
    }
}

