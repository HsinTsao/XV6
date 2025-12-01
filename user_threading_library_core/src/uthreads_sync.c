#include "types.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

void mutex_init(mutex_t *m) {
    m->locked = 0;
    m->owner = -1;
    m->wait_chan = m;
}

void mutex_lock(mutex_t *m) {
    while (m->locked) {
        thread_sleep(m->wait_chan);
    }
    
    m->locked = 1;
    m->owner = thread_self();
}

void mutex_unlock(mutex_t *m) {
    if (m->owner != thread_self()) {
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
        return;
    }
    
    m->locked = 0;
    m->owner = -1;
    
    thread_wakeup(m->wait_chan);
}

int mutex_trylock(mutex_t *m) {
    if (m->locked) {
        return 0;
    }
    
    m->locked = 1;
    m->owner = thread_self();
    return 1;
}

void cond_init(cond_t *c) {
    c->wait_chan = c;
}

void cond_wait(cond_t *c, mutex_t *m) {
    if (m->owner != thread_self()) {
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
        return;
    }
    
    m->locked = 0;
    m->owner = -1;
    thread_wakeup(m->wait_chan);
    
    thread_sleep(c->wait_chan);
    
    mutex_lock(m);
}

void cond_signal(cond_t *c) {
    thread_wakeup(c->wait_chan);
}

void cond_broadcast(cond_t *c) {
    thread_wakeup(c->wait_chan);
}

channel_t *channel_create(int capacity) {
    channel_t *ch;
    
    if (capacity <= 0) {
        printf(2, "[uthreads] Error: Channel capacity must be greater than 0\n");
        return 0;
    }
    
    ch = (channel_t*)malloc(sizeof(channel_t));
    if (!ch) {
        printf(2, "[uthreads] Error: Channel allocation failed\n");
        return 0;
    }
    
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
    if (!ch->buffer) {
        printf(2, "[uthreads] Error: Channel buffer allocation failed\n");
        free(ch);
        return 0;
    }
    
    ch->capacity = capacity;
    ch->count = 0;
    ch->read_idx = 0;
    ch->write_idx = 0;
    ch->is_closed = 0;
    
    mutex_init(&ch->lock);
    cond_init(&ch->not_empty);
    cond_init(&ch->not_full);
    
    printf(1, "[uthreads] Channel created successfully, capacity=%d\n", capacity);
    return ch;
}

int channel_send(channel_t *ch, void *data) {
    mutex_lock(&ch->lock);
    
    if (ch->is_closed) {
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    while (ch->count == ch->capacity && !ch->is_closed) {
        cond_wait(&ch->not_full, &ch->lock);
    }
    
    if (ch->is_closed) {
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    ch->buffer[ch->write_idx] = data;
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    ch->count++;
    
    cond_signal(&ch->not_empty);
    
    mutex_unlock(&ch->lock);
    return 0;
}

int channel_recv(channel_t *ch, void **data) {
    mutex_lock(&ch->lock);
    
    while (ch->count == 0 && !ch->is_closed) {
        cond_wait(&ch->not_empty, &ch->lock);
    }
    
    if (ch->is_closed && ch->count == 0) {
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    *data = ch->buffer[ch->read_idx];
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    ch->count--;
    
    cond_signal(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    return 0;
}

void channel_close(channel_t *ch) {
    mutex_lock(&ch->lock);
    
    ch->is_closed = 1;
    
    cond_broadcast(&ch->not_empty);
    cond_broadcast(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    
    printf(1, "[uthreads] Channel closed\n");
}

void channel_destroy(channel_t *ch) {
    if (!ch)
        return;
    
    if (ch->buffer) {
        free(ch->buffer);
    }
    free(ch);
}
