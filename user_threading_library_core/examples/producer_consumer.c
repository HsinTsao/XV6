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
    
    for (i = 0; i < ITEMS_PER_PRODUCER; i++) {
        item = (Item*)malloc(sizeof(Item));
        item->producer_id = id;
        item->item_number = i;
        
        printf(1, "Producer %d: generated item %d\n", id + 1, i);
        
        if (channel_send(channel, item) < 0) {
            printf(1, "[Producer%d] Send failed (channel closed)\n", id + 1);
            free(item);
            break;
        }
        
        thread_yield();
    }
    
    return 0;
}

void *consumer(void *arg) {
    int id = (int)arg;
    int consumed_count = 0;
    void *data;
    Item *item;
    
    while (1) {
        if (channel_recv(channel, &data) < 0) {
            break;
        }
        
        item = (Item*)data;
        printf(1, "Consumer %d: consumed item %d\n", id + 1, item->item_number);
        
        consumed_count++;
        free(item);
        
        thread_yield();
    }
    
    return 0;
}

int main(int argc, char *argv[]) {
    int producer_tids[NUM_PRODUCERS];
    int consumer_tids[NUM_CONSUMERS];
    int i;
    
    thread_init();
    
    channel = channel_create(CHANNEL_CAPACITY);
    if (!channel) {
        printf(2, "Failed to create channel\n");
        exit();
    }
    
    for (i = 0; i < NUM_PRODUCERS; i++) {
        producer_tids[i] = thread_create(producer, (void*)i);
    }
    
    for (i = 0; i < NUM_CONSUMERS; i++) {
        consumer_tids[i] = thread_create(consumer, (void*)i);
    }
    
    for (i = 0; i < NUM_PRODUCERS; i++) {
        thread_join(producer_tids[i]);
    }
    
    channel_close(channel);
    
    for (i = 0; i < NUM_CONSUMERS; i++) {
        thread_join(consumer_tids[i]);
    }
    
    printf(1, "All items processed. Consumers exiting.\n");
    
    channel_destroy(channel);
    
    exit();
}
