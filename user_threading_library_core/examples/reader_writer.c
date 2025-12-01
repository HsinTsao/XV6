// reader_writer.c - Writer-priority Reader-Writer lock example

#include "types.h"
#include "stat.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

#define NUM_READERS 5
#define NUM_WRITERS 2
#define READ_TIMES 3
#define WRITE_TIMES 3

/* 写优先读写锁 */
typedef struct {
    mutex_t lock;
    cond_t can_read;
    cond_t can_write;
    int active_readers;
    int active_writers;
    int waiting_writers;
} rwlock_t;

void rwlock_init(rwlock_t *rw) {
    mutex_init(&rw->lock);
    cond_init(&rw->can_read);
    cond_init(&rw->can_write);
    rw->active_readers = 0;
    rw->active_writers = 0;
    rw->waiting_writers = 0;
}

void reader_lock(rwlock_t *rw) {
    mutex_lock(&rw->lock);
    
    while (rw->active_writers > 0 || rw->waiting_writers > 0) {
        cond_wait(&rw->can_read, &rw->lock);
    }
    
    rw->active_readers++;
    mutex_unlock(&rw->lock);
}

void reader_unlock(rwlock_t *rw) {
    mutex_lock(&rw->lock);
    
    rw->active_readers--;
    
    if (rw->active_readers == 0) {
        cond_signal(&rw->can_write);
    }
    
    mutex_unlock(&rw->lock);
}

void writer_lock(rwlock_t *rw) {
    mutex_lock(&rw->lock);
    
    rw->waiting_writers++;
    
    while (rw->active_readers > 0 || rw->active_writers > 0) {
        cond_wait(&rw->can_write, &rw->lock);
    }
    
    rw->waiting_writers--;
    rw->active_writers++;
    
    mutex_unlock(&rw->lock);
}

void writer_unlock(rwlock_t *rw) {
    mutex_lock(&rw->lock);
    
    rw->active_writers--;
    
    if (rw->waiting_writers > 0) {
        cond_signal(&rw->can_write);
    } else {
        cond_broadcast(&rw->can_read);
    }
    
    mutex_unlock(&rw->lock);
}

rwlock_t rwlock;
int shared_data = 0;

void *reader(void *arg) {
    int id = (int)arg;
    int i;
    
    printf(1, "[读者%d] 启动\n", id);
    
    for (i = 0; i < READ_TIMES; i++) {
        printf(1, "[读者%d] 请求读锁...\n", id);
        reader_lock(&rwlock);
        
        printf(1, "[读者%d] 获得读锁，读取数据 = %d\n", id, shared_data);
        thread_yield();
        
        reader_unlock(&rwlock);
        printf(1, "[读者%d] 释放读锁\n", id);
        
        thread_yield();
    }
    
    printf(1, "[读者%d] 完成\n", id);
    return 0;
}

void *writer(void *arg) {
    int id = (int)arg;
    int i;
    
    printf(1, "[写者%d] 启动\n", id);
    
    for (i = 0; i < WRITE_TIMES; i++) {
        printf(1, "[写者%d] 请求写锁...\n", id);
        writer_lock(&rwlock);
        
        shared_data++;
        printf(1, "[写者%d] *** 获得写锁，写入数据 = %d ***\n", id, shared_data);
        thread_yield();
        
        writer_unlock(&rwlock);
        printf(1, "[写者%d] 释放写锁\n", id);
        
        thread_yield();
    }
    
    printf(1, "[写者%d] 完成\n", id);
    return 0;
}

int main(int argc, char *argv[]) {
    int reader_tids[NUM_READERS];
    int writer_tids[NUM_WRITERS];
    int i;
    
    printf(1, "========================================\n");
    printf(1, "      写优先读写锁示例\n");
    printf(1, "========================================\n\n");
    
    thread_init();
    rwlock_init(&rwlock);
    
    // 创建读者
    for (i = 0; i < NUM_READERS; i++) {
        reader_tids[i] = thread_create(reader, (void*)i);
    }
    
    // 创建写者
    for (i = 0; i < NUM_WRITERS; i++) {
        writer_tids[i] = thread_create(writer, (void*)i);
    }
    
    printf(1, "所有线程已创建，开始执行...\n\n");
    
    // 等待所有线程完成
    for (i = 0; i < NUM_READERS; i++) {
        thread_join(reader_tids[i]);
    }
    
    for (i = 0; i < NUM_WRITERS; i++) {
        thread_join(writer_tids[i]);
    }
    
    printf(1, "\n========================================\n");
    printf(1, "所有线程已完成！\n");
    printf(1, "最终数据值：%d（预期：%d）\n", shared_data, NUM_WRITERS * WRITE_TIMES);
    printf(1, "========================================\n");
    
    exit();
}

