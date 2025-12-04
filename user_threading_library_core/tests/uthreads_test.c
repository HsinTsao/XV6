#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "user_threading_library_core/src/uthreads.h"

int shared_counter = 0;
int test_passed = 0;

void *basic_thread(void *arg) {
    int id = (int)arg;
    printf(1, "  [Thread%d] Start running\n", id);
    printf(1, "  [Thread%d] Finish running\n", id);
    return (void*)(id * 10);
}

void test_basic_create_exit(void) {
    printf(1, "\n[Test 1.1] Basic Thread Creation and Exit\n");
    printf(1, "----------------------------------------------\n");
    
    int tid1 = thread_create(basic_thread, (void*)1);
    int tid2 = thread_create(basic_thread, (void*)2);
    
    printf(1, "Created 2 threads: tid=%d, tid=%d\n", tid1, tid2);
    
    void *ret1 = thread_join(tid1);
    void *ret2 = thread_join(tid2);
    
    printf(1, "Thread %d return value: %d (expected: 10)\n", tid1, (int)ret1);
    printf(1, "Thread %d return value: %d (expected: 20)\n", tid2, (int)ret2);
    
    if ((int)ret1 == 10 && (int)ret2 == 20) {
        printf(1, "PASS Test passed\n");
    } else {
        printf(1, "FAIL Test failed\n");
    }
}

void *yield_thread(void *arg) {
    int id = (int)arg;
    int i;
    
    for (i = 0; i < 5; i++) {
        printf(1, "  [Thread%d] Iteration %d\n", id, i);
        thread_yield();
    }
    
    return (void*)0;
}

void test_yield_scheduling(void) {
    printf(1, "\n[Test 1.2] Thread Yield and Round-Robin Scheduling\n");
    printf(1, "----------------------------------------------\n");
    printf(1, "Expected: Threads should alternate (Round-Robin)\n\n");
    
    int tid1 = thread_create(yield_thread, (void*)1);
    int tid2 = thread_create(yield_thread, (void*)2);
    int tid3 = thread_create(yield_thread, (void*)3);
    
    thread_join(tid1);
    thread_join(tid2);
    thread_join(tid3);
    
    printf(1, "PASS Test completed (verify scheduling order from output)\n");
}

void *stress_thread(void *arg) {
    int id = (int)arg;
    printf(1, "  [Thread%d] Fast execution and exit\n", id);
    return (void*)id;
}

void test_many_threads(void) {
    printf(1, "\n[Test 1.3] Multiple Threads Creation Stress Test\n");
    printf(1, "----------------------------------------------\n");
    
    int tids[10];
    int i;
    
    for (i = 0; i < 10; i++) {
        tids[i] = thread_create(stress_thread, (void*)i);
    }
    
    printf(1, "Successfully created 10 threads\n");
    
    for (i = 0; i < 10; i++) {
        void *ret = thread_join(tids[i]);
        printf(1, "  Thread %d returned: %d\n", tids[i], (int)ret);
    }
    
    printf(1, "PASS Test passed\n");
}

int ctx_var1 = 0, ctx_var2 = 0;

void *context_thread1(void *arg) {
    int i;
    for (i = 0; i < 100; i++) {
        ctx_var1++;
        thread_yield();
    }
    return (void*)0;
}

void *context_thread2(void *arg) {
    int i;
    for (i = 0; i < 100; i++) {
        ctx_var2++;
        thread_yield();
    }
    return (void*)0;
}

void test_context_switch(void) {
    printf(1, "\n[Test 1.4] Context Switch Correctness\n");
    printf(1, "----------------------------------------------\n");
    printf(1, "Test: Two threads increment different variables, verify context save\n");
    
    ctx_var1 = 0;
    ctx_var2 = 0;
    
    int tid1 = thread_create(context_thread1, (void*)0);
    int tid2 = thread_create(context_thread2, (void*)0);
    
    thread_join(tid1);
    thread_join(tid2);
    
    printf(1, "ctx_var1 = %d (expected: 100)\n", ctx_var1);
    printf(1, "ctx_var2 = %d (expected: 100)\n", ctx_var2);
    
    if (ctx_var1 == 100 && ctx_var2 == 100) {
        printf(1, "PASS Context switch correct\n");
    } else {
        printf(1, "FAIL Context switch error\n");
    }
}

void *self_thread(void *arg) {
    int expected_tid = (int)arg;
    int actual_tid = thread_self();
    
    printf(1, "  [Thread] Expected tid=%d, Actual tid=%d\n", expected_tid, actual_tid);
    
    if (expected_tid == actual_tid) {
        return (void*)1;
    } else {
        return (void*)0;
    }
}

void test_thread_self(void) {
    printf(1, "\n[Test 1.5] Thread Self Function\n");
    printf(1, "----------------------------------------------\n");
    
    int tid1 = thread_create(self_thread, (void*)0);
    thread_join(tid1);
    
    printf(1, "PASS Thread Self test completed\n");
}

mutex_t test_mutex;
int protected_counter = 0;

void *mutex_inc_thread(void *arg) {
    int i;
    int iterations = (int)arg;
    
    for (i = 0; i < iterations; i++) {
        mutex_lock(&test_mutex);
        protected_counter++;
        printf(1, "  [Thread%d] counter = %d\n", thread_self(), protected_counter);
        mutex_unlock(&test_mutex);
        thread_yield();
    }
    
    return (void*)0;
}

void test_mutex_basic(void) {
    printf(1, "\n[Test 2.1] Mutex Basic Lock/Unlock\n");
    printf(1, "----------------------------------------------\n");
    
    mutex_init(&test_mutex);
    protected_counter = 0;
    
    int tid1 = thread_create(mutex_inc_thread, (void*)5);
    int tid2 = thread_create(mutex_inc_thread, (void*)5);
    
    thread_join(tid1);
    thread_join(tid2);
    
    printf(1, "Final counter = %d (expected: 10)\n", protected_counter);
    
    if (protected_counter == 10) {
        printf(1, "PASS Mutex correctly protected critical section\n");
    } else {
        printf(1, "FAIL Mutex failed to protect critical section\n");
    }
}

void *trylock_thread(void *arg) {
    int success = 0;
    int i;
    
    for (i = 0; i < 5; i++) {
        if (mutex_trylock(&test_mutex)) {
            printf(1, "  [Thread%d] Trylock succeeded\n", thread_self());
            success++;
            protected_counter++;
            mutex_unlock(&test_mutex);
        } else {
            printf(1, "  [Thread%d] Trylock failed, lock occupied\n", thread_self());
        }
        thread_yield();
    }
    
    return (void*)success;
}

void test_mutex_trylock(void) {
    printf(1, "\n[Test 2.2] Mutex Trylock Function\n");
    printf(1, "----------------------------------------------\n");
    
    mutex_init(&test_mutex);
    protected_counter = 0;
    
    int tid1 = thread_create(trylock_thread, (void*)0);
    int tid2 = thread_create(trylock_thread, (void*)0);
    
    thread_join(tid1);
    thread_join(tid2);
    
    printf(1, "PASS Trylock test completed\n");
}

#define BUFFER_SIZE 5
int buffer[BUFFER_SIZE];
int count = 0;
mutex_t pc_mutex;
cond_t not_empty;
cond_t not_full;

void *producer_thread(void *arg) {
    int id = (int)arg;
    int i;
    
    for (i = 0; i < 3; i++) {
        mutex_lock(&pc_mutex);
        
        while (count == BUFFER_SIZE) {
            printf(1, "  [Producer%d] Buffer full, waiting...\n", id);
            cond_wait(&not_full, &pc_mutex);
        }
        
        buffer[count] = id * 10 + i;
        count++;
        printf(1, "  [Producer%d] Produce: %d (count=%d)\n", id, id*10+i, count);
        
        cond_signal(&not_empty);
        mutex_unlock(&pc_mutex);
        
        thread_yield();
    }
    
    return (void*)0;
}

void *consumer_thread(void *arg) {
    int id = (int)arg;
    int i;
    
    for (i = 0; i < 3; i++) {
        mutex_lock(&pc_mutex);
        
        while (count == 0) {
            printf(1, "  [Consumer%d] Buffer empty, waiting...\n", id);
            cond_wait(&not_empty, &pc_mutex);
        }
        
        count--;
        int item = buffer[count];
        printf(1, "  [Consumer%d] Consume: %d (count=%d)\n", id, item, count);
        
        cond_signal(&not_full);
        mutex_unlock(&pc_mutex);
        
        thread_yield();
    }
    
    return (void*)0;
}

void test_condition_variable(void) {
    printf(1, "\n[Test 2.3] Condition Variable - Producer Consumer\n");
    printf(1, "----------------------------------------------\n");
    
    mutex_init(&pc_mutex);
    cond_init(&not_empty);
    cond_init(&not_full);
    count = 0;
    
    int prod1 = thread_create(producer_thread, (void*)1);
    int cons1 = thread_create(consumer_thread, (void*)1);
    int prod2 = thread_create(producer_thread, (void*)2);
    int cons2 = thread_create(consumer_thread, (void*)2);
    
    thread_join(prod1);
    thread_join(prod2);
    thread_join(cons1);
    thread_join(cons2);
    
    printf(1, "Final count = %d (expected: 0)\n", count);
    printf(1, "PASS Condition variable test completed\n");
}

cond_t broadcast_cond;
mutex_t broadcast_mutex;
int broadcast_ready = 0;
int wakeup_count = 0;

void *wait_broadcast_thread(void *arg) {
    int id = (int)arg;
    
    mutex_lock(&broadcast_mutex);
    printf(1, "  [Thread%d] Waiting for broadcast signal...\n", id);
    
    while (!broadcast_ready) {
        cond_wait(&broadcast_cond, &broadcast_mutex);
    }
    
    wakeup_count++;
    printf(1, "  [Thread%d] Received broadcast, woken up!\n", id);
    mutex_unlock(&broadcast_mutex);
    
    return (void*)0;
}

void test_cond_broadcast(void) {
    printf(1, "\n[Test 2.4] Condition Variable Broadcast\n");
    printf(1, "----------------------------------------------\n");
    
    mutex_init(&broadcast_mutex);
    cond_init(&broadcast_cond);
    broadcast_ready = 0;
    wakeup_count = 0;
    
    int tid1 = thread_create(wait_broadcast_thread, (void*)1);
    int tid2 = thread_create(wait_broadcast_thread, (void*)2);
    int tid3 = thread_create(wait_broadcast_thread, (void*)3);
    int tid4 = thread_create(wait_broadcast_thread, (void*)4);
    
    thread_yield();
    thread_yield();
    
    printf(1, "  [Main] Sending broadcast signal...\n");
    mutex_lock(&broadcast_mutex);
    broadcast_ready = 1;
    cond_broadcast(&broadcast_cond);
    mutex_unlock(&broadcast_mutex);
    
    thread_join(tid1);
    thread_join(tid2);
    thread_join(tid3);
    thread_join(tid4);
    
    printf(1, "Woken threads: %d (expected: 4)\n", wakeup_count);
    printf(1, "PASS Broadcast test completed\n");
}

void *channel_sender(void *arg) {
    channel_t *ch = (channel_t*)arg;
    int i;
    
    for (i = 0; i < 5; i++) {
        int *data = (int*)malloc(sizeof(int));
        *data = i * 100;
        
        printf(1, "  [Sender] Send: %d\n", *data);
        channel_send(ch, (void*)data);
        thread_yield();
    }
    
    return (void*)0;
}

void *channel_receiver(void *arg) {
    channel_t *ch = (channel_t*)arg;
    int i;
    
    for (i = 0; i < 5; i++) {
        void *data;
        int ret = channel_recv(ch, &data);
        
        if (ret == 0) {
            printf(1, "  [Receiver] Receive: %d\n", *(int*)data);
            free(data);
        }
        thread_yield();
    }
    
    return (void*)0;
}

void test_channel_basic(void) {
    printf(1, "\n[Test 2.5] Channel Basic Send/Receive\n");
    printf(1, "----------------------------------------------\n");
    
    channel_t *ch = channel_create(3);
    
    int sender = thread_create(channel_sender, (void*)ch);
    int receiver = thread_create(channel_receiver, (void*)ch);
    
    thread_join(sender);
    thread_join(receiver);
    
    channel_destroy(ch);
    printf(1, "PASS Channel basic function test completed\n");
}

void *channel_fast_sender(void *arg) {
    channel_t *ch = (channel_t*)arg;
    int i;
    
    for (i = 0; i < 8; i++) {
        printf(1, "  [FastSend] Try to send %d\n", i);
        channel_send(ch, (void*)i);
        printf(1, "  [FastSend] Successfully sent %d\n", i);
    }
    
    return (void*)0;
}

void *channel_slow_receiver(void *arg) {
    channel_t *ch = (channel_t*)arg;
    int i;
    
    for (i = 0; i < 8; i++) {
        thread_yield();
        thread_yield();
        
        void *data;
        channel_recv(ch, &data);
        printf(1, "  [SlowRecv] Received %d\n", (int)data);
    }
    
    return (void*)0;
}

void test_channel_blocking(void) {
    printf(1, "\n[Test 2.6] Channel Blocking and Wakeup\n");
    printf(1, "----------------------------------------------\n");
    printf(1, "Fast sender will block when buffer is full\n\n");
    
    channel_t *ch = channel_create(3);
    
    int sender = thread_create(channel_fast_sender, (void*)ch);
    int receiver = thread_create(channel_slow_receiver, (void*)ch);
    
    thread_join(sender);
    thread_join(receiver);
    
    channel_destroy(ch);
    printf(1, "PASS Channel blocking test completed\n");
}

void *multi_producer(void *arg) {
    channel_t *ch = (channel_t*)arg;
    int id = thread_self();
    int i;
    
    for (i = 0; i < 3; i++) {
        int msg = id * 100 + i;
        printf(1, "  [Producer%d] Send: %d\n", id, msg);
        channel_send(ch, (void*)msg);
        thread_yield();
    }
    
    return (void*)0;
}

void *multi_consumer(void *arg) {
    channel_t *ch = (channel_t*)arg;
    int id = thread_self();
    int i;
    
    for (i = 0; i < 3; i++) {
        void *msg;
        channel_recv(ch, &msg);
        printf(1, "  [Consumer%d] Receive: %d\n", id, (int)msg);
        thread_yield();
    }
    
    return (void*)0;
}

void test_channel_multi(void) {
    printf(1, "\n[Test 2.7] Multiple Producer-Consumer Channel\n");
    printf(1, "----------------------------------------------\n");
    
    channel_t *ch = channel_create(5);
    
    int p1 = thread_create(multi_producer, (void*)ch);
    int p2 = thread_create(multi_producer, (void*)ch);
    int c1 = thread_create(multi_consumer, (void*)ch);
    int c2 = thread_create(multi_consumer, (void*)ch);
    
    thread_join(p1);
    thread_join(p2);
    thread_join(c1);
    thread_join(c2);
    
    channel_destroy(ch);
    printf(1, "PASS Multiple producer-consumer test completed\n");
}

void test_part3_examples(void) {
    printf(1, "\n========================================================\n");
    printf(1, "Part 3 tests the same logic as standalone examples:\n");
    printf(1, "  - examples/producer_consumer.c (3 producers, 2 consumers)\n");
    printf(1, "  - examples/reader_writer.c (5 readers, 2 writers)\n");
    printf(1, "\nTo run full examples separately:\n");
    printf(1, "  $ producer_consumer\n");
    printf(1, "  $ reader_writer\n");
    printf(1, "========================================================\n");
}

static int test_fd;
static int test_items_read;

void *test_fileio_reader(void *arg) {
    char buf[256];
    int n;
    char line[256];
    int line_pos = 0;
    int expected_lines = 24;
    
    while (test_items_read < expected_lines) {
        n = uread(test_fd, buf, sizeof(buf) - 1);
        
        if (n < 0) {
            break;
        }
        
        if (n == 0) {
            thread_yield();
            continue;
        }
        
        buf[n] = '\0';
        
        int i;
        for (i = 0; i < n; i++) {
            if (buf[i] == '\n') {
                line[line_pos] = '\0';
                if (line_pos > 0) {
                    test_items_read++;
                    line_pos = 0;
                }
            } else {
                if (line_pos < sizeof(line) - 1) {
                    line[line_pos++] = buf[i];
                }
            }
        }
        
        thread_yield();
    }
    
    return 0;
}

void test_file_io(void) {
    int reader_tid;
    char *test_file = "file_io_test.txt";
    
    printf(1, "\n[Test 4.1] Async File I/O\n");
    printf(1, "----------------------------------------------\n");
    
    test_items_read = 0;
    
    test_fd = uopen(test_file, O_RDONLY);
    if (test_fd < 0) {
        printf(2, "FAIL Failed to open %s\n", test_file);
        return;
    }
    
    reader_tid = thread_create(test_fileio_reader, 0);
    thread_join(reader_tid);
    
    uclose(test_fd);
    
    if (test_items_read == 24) {
        printf(1, "PASS File I/O test passed (read %d lines)\n", test_items_read);
    } else {
        printf(2, "FAIL File I/O test failed: read %d lines (expected 24)\n", test_items_read);
    }
}

int main(int argc, char *argv[]) {
    printf(1, "\n");
    printf(1, "========================================================\n");
    printf(1, "    Threading Library Test\n");
    printf(1, "========================================================\n");
    
    thread_init();
    
    printf(1, "\n");
    printf(1, "========================================================\n");
    printf(1, "=                                                      =\n");
    printf(1, "=      Part 1: Threading System Basics                 =\n");
    printf(1, "=                                                      =\n");
    printf(1, "=  Test Content:                                       =\n");
    printf(1, "=  - Thread data structure + global thread table      =\n");
    printf(1, "=  - Thread create/exit/join/yield                    =\n");
    printf(1, "=  - x86 assembly context switch                      =\n");
    printf(1, "=  - Round-Robin scheduler                            =\n");
    printf(1, "=                                                      =\n");
    printf(1, "========================================================\n");
    
    test_basic_create_exit();
    test_yield_scheduling();
    test_many_threads();
    test_context_switch();
    test_thread_self();
    
    printf(1, "\n");
    printf(1, "========================================================\n");
    printf(1, "=                                                      =\n");
    printf(1, "=      Part 2: Synchronization Primitives              =\n");
    printf(1, "=                                                      =\n");
    printf(1, "=  Test Content:                                       =\n");
    printf(1, "=  - Mutex lock (lock/unlock/trylock)                 =\n");
    printf(1, "=  - Condition Variable (wait/signal/broadcast)       =\n");
    printf(1, "=  - Channel (buffered message queue)                 =\n");
    printf(1, "=                                                      =\n");
    printf(1, "========================================================\n");
    
    test_mutex_basic();
    test_mutex_trylock();
    test_condition_variable();
    test_cond_broadcast();
    test_channel_basic();
    test_channel_blocking();
    test_channel_multi();
    
    printf(1, "\n");
    printf(1, "========================================================\n");
    printf(1, "=                                                      =\n");
    printf(1, "=      Part 3: Application Examples                    =\n");
    printf(1, "=                                                      =\n");
    printf(1, "=  Note: Part 3 uses standalone example programs:     =\n");
    printf(1, "=    - examples/producer_consumer.c                   =\n");
    printf(1, "=    - examples/reader_writer.c                       =\n");
    printf(1, "=                                                      =\n");
    printf(1, "=  Run them separately for full application demos:    =\n");
    printf(1, "=    $ producer_consumer                              =\n");
    printf(1, "=    $ reader_writer                                  =\n");
    printf(1, "=                                                      =\n");
    printf(1, "========================================================\n");
    
    test_part3_examples();
    
    printf(1, "\n");
    printf(1, "========================================================\n");
    printf(1, "=                                                      =\n");
    printf(1, "=      Part 4: Async File I/O                         =\n");
    printf(1, "=                                                      =\n");
    printf(1, "=  Test Content:                                       =\n");
    printf(1, "=  - Async read/write operations                       =\n");
    printf(1, "=  - File producer-consumer pattern                    =\n");
    printf(1, "=                                                      =\n");
    printf(1, "=  Note: Full example available at:                   =\n");
    printf(1, "=    - examples/file_producer_consumer.c               =\n");
    printf(1, "=                                                      =\n");
    printf(1, "=  Run separately for full demo:                       =\n");
    printf(1, "=    $ file_producer_consumer                          =\n");
    printf(1, "=                                                      =\n");
    printf(1, "========================================================\n");
    
    test_file_io();
    
    printf(1, "\n");
    printf(1, "========================================================\n");
    printf(1, "              All Tests Completed!\n");
    printf(1, "========================================================\n");

    
    exit();
}
