#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "user_threading_library_core/src/uthreads.h"

#define NUM_ITEMS 25
#define TEST_FILE "pc_test.txt"

int fd_read;
int fd_write;

void *producer(void *arg) {
    int i;
    char buf[32];
    char dummy[256];
    int len, pos;
    int num;
    int n;
    
    while ((n = read(fd_write, dummy, sizeof(dummy))) > 0) {
    }
    
    for (i = 0; i < NUM_ITEMS; i++) {
        strcpy(buf, "item ");
        pos = strlen(buf);
        num = i;
        if (num == 0) {
            buf[pos++] = '0';
        } else {
            char temp[16];
            int temp_pos = 0;
            while (num > 0) {
                temp[temp_pos++] = '0' + (num % 10);
                num /= 10;
            }
            while (temp_pos > 0) {
                buf[pos++] = temp[--temp_pos];
            }
        }
        buf[pos++] = '\n';
        buf[pos] = '\0';
        len = pos;
        
        if (uwrite(fd_write, buf, len) != len) {
            printf(2, "producer: write failed for item %d\n", i);
            break;
        }
        
        printf(1, "producer: wrote item %d\n", i);
        thread_yield();
    }
    
    return 0;
}

void *consumer(void *arg) {
    char buf[256];
    int n;
    int items_read = 0;
    char line[256];
    int line_pos = 0;
    int eof_count = 0;
    
    while (items_read < NUM_ITEMS) {
        n = uread(fd_read, buf, sizeof(buf) - 1);
        
        if (n < 0) {
            printf(2, "consumer: read error\n");
            break;
        }
        
        if (n == 0) {
            eof_count++;
            if (eof_count > 10000 && items_read >= NUM_ITEMS - 1) {
                break;
            }
            thread_yield();
            continue;
        }
        
        eof_count = 0;
        buf[n] = '\0';
        
        int i;
        for (i = 0; i < n; i++) {
            if (buf[i] == '\n') {
                line[line_pos] = '\0';
                if (line_pos > 0) {
                    if (line_pos >= 5 && line[0] == 'i' && line[1] == 't' && 
                        line[2] == 'e' && line[3] == 'm' && line[4] == ' ') {
                        printf(1, "consumer: read %s\n", line);
                        items_read++;
                    }
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

int main(int argc, char *argv[]) {
    int producer_tid, consumer_tid;
    
    thread_init();
    
    fd_write = uopen(TEST_FILE, O_RDWR);
    if (fd_write < 0) {
        printf(2, "Failed to open %s\n", TEST_FILE);
        exit();
    }
    
    fd_read = uopen(TEST_FILE, O_RDONLY);
    if (fd_read < 0) {
        printf(2, "Failed to open %s for reading\n", TEST_FILE);
        uclose(fd_write);
        exit();
    }
    
    producer_tid = thread_create(producer, 0);
    consumer_tid = thread_create(consumer, 0);
    
    thread_join(producer_tid);
    printf(1, "Producer thread completed\n");
    
    thread_join(consumer_tid);
    printf(1, "Consumer thread completed\n");
    
    uclose(fd_read);
    uclose(fd_write);

     fd_read = uopen(TEST_FILE, O_RDONLY);
    if (fd_read >= 0) {
        char verify_buf[512];
        int verify_n;
        int total_lines = 0;
        
        printf(1, "\nVerifying file content:\n");
        while ((verify_n = read(fd_read, verify_buf, sizeof(verify_buf) - 1)) > 0) {
            verify_buf[verify_n] = '\0';
            int i;
            for (i = 0; i < verify_n; i++) {
                if (verify_buf[i] == '\n') {
                    total_lines++;
                }
            }
        }
        printf(1, "Total lines in file: %d (expected: %d initial + %d items = %d)\n", 
               total_lines, 20, NUM_ITEMS, 20 + NUM_ITEMS);
        uclose(fd_read);
    }
    
    
    printf(1, "File producer-consumer test completed\n");
    
    exit();
}

