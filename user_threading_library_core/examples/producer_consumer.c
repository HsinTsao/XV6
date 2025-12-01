// producer_consumer.c - Producer-Consumer example using channel

#include "types.h"
#include "stat.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

#define NUM_PRODUCERS 3
#define NUM_CONSUMERS 2
#define ITEMS_PER_PRODUCER 10
#define CHANNEL_CAPACITY 5

typedef struct {
    int producer_id;
    int item_number;
} Item;

channel_t *channel;

void *producer(void *arg) {
    int id = (int)arg;
    int i;
    Item *item;
    
    printf(1, "[生产者%d] 启动\n", id);
    
    for (i = 0; i < ITEMS_PER_PRODUCER; i++) {
        item = (Item*)malloc(sizeof(Item));
        item->producer_id = id;
        item->item_number = i;
        
        printf(1, "[生产者%d] 生产 item-%d\n", id, i);
        
        if (channel_send(channel, item) < 0) {
            printf(1, "[生产者%d] 发送失败（channel已关闭）\n", id);
            free(item);
            break;
        }
        
        thread_yield();
    }
    
    printf(1, "[生产者%d] 完成生产\n", id);
    return 0;
}

void *consumer(void *arg) {
    int id = (int)arg;
    int consumed_count = 0;
    void *data;
    Item *item;
    
    printf(1, "[消费者%d] 启动\n", id);
    
    while (1) {
        if (channel_recv(channel, &data) < 0) {
            printf(1, "[消费者%d] channel已关闭且为空，退出\n", id);
            break;
        }
        
        item = (Item*)data;
        printf(1, "[消费者%d] 消费 item：来自生产者%d的第%d个\n", 
               id, item->producer_id, item->item_number);
        
        consumed_count++;
        free(item);
        
        thread_yield();
    }
    
    printf(1, "[消费者%d] 共消费了 %d 个item\n", id, consumed_count);
    return 0;
}

int main(int argc, char *argv[]) {
    int producer_tids[NUM_PRODUCERS];
    int consumer_tids[NUM_CONSUMERS];
    int i;
    
    printf(1, "========================================\n");
    printf(1, "      生产者-消费者示例\n");
    printf(1, "========================================\n\n");
    
    thread_init();
    
    channel = channel_create(CHANNEL_CAPACITY);
    if (!channel) {
        printf(2, "创建 channel 失败\n");
        exit();
    }
    
    // 创建生产者
    for (i = 0; i < NUM_PRODUCERS; i++) {
        producer_tids[i] = thread_create(producer, (void*)i);
    }
    
    // 创建消费者
    for (i = 0; i < NUM_CONSUMERS; i++) {
        consumer_tids[i] = thread_create(consumer, (void*)i);
    }
    
    printf(1, "所有线程已创建，开始执行...\n\n");
    
    // 等待所有生产者完成
    for (i = 0; i < NUM_PRODUCERS; i++) {
        thread_join(producer_tids[i]);
    }
    
    printf(1, "\n所有生产者已完成，关闭 channel...\n\n");
    channel_close(channel);
    
    // 等待所有消费者完成
    for (i = 0; i < NUM_CONSUMERS; i++) {
        thread_join(consumer_tids[i]);
    }
    
    printf(1, "\n========================================\n");
    printf(1, "所有线程已完成！\n");
    printf(1, "========================================\n");
    
    channel_destroy(channel);
    
    exit();
}

