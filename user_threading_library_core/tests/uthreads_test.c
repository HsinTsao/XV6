// uthreads_test.c - Basic test for user-level threads

#include "types.h"
#include "stat.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

void *simple_task(void *arg) {
    int id = (int)arg;
    int i;
    
    printf(1, "[线程%d] 开始执行\n", id);
    
    for (i = 0; i < 3; i++) {
        printf(1, "[线程%d] 迭代 %d\n", id, i);
        thread_yield();
    }
    
    printf(1, "[线程%d] 结束执行\n", id);
    return (void*)(id * 100);
}

int main(int argc, char *argv[]) {
    int tid1, tid2, tid3;
    void *ret;
    
    printf(1, "========================================\n");
    printf(1, "      用户级线程基础测试\n");
    printf(1, "========================================\n\n");
    
    thread_init();
    
    tid1 = thread_create(simple_task, (void*)1);
    tid2 = thread_create(simple_task, (void*)2);
    tid3 = thread_create(simple_task, (void*)3);
    
    printf(1, "创建了 3 个线程: tid=%d, %d, %d\n\n", tid1, tid2, tid3);
    
    ret = thread_join(tid1);
    printf(1, "线程 tid=%d 返回值=%d\n", tid1, (int)ret);
    
    ret = thread_join(tid2);
    printf(1, "线程 tid=%d 返回值=%d\n", tid2, (int)ret);
    
    ret = thread_join(tid3);
    printf(1, "线程 tid=%d 返回值=%d\n", tid3, (int)ret);
    
    printf(1, "\n========================================\n");
    printf(1, "测试完成！\n");
    printf(1, "========================================\n");
    
    exit();
}

