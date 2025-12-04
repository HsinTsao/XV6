#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "user_threading_library_core/src/uthreads.h"

#define MAX_FDS 64

static file_state_t file_states[MAX_FDS];
static int file_states_initialized = 0;

static void file_io_init(void) {
    int i;
    if (file_states_initialized)
        return;
    
    for (i = 0; i < MAX_FDS; i++) {
        file_states[i].fd = -1;
        file_states[i].readable = 0;
        file_states[i].writable = 0;
        mutex_init(&file_states[i].m);
        cond_init(&file_states[i].cond_read);
        cond_init(&file_states[i].cond_write);
    }
    
    file_states_initialized = 1;
}

static file_state_t *get_file_state(int fd) {
    if (fd < 0 || fd >= MAX_FDS)
        return 0;
    return &file_states[fd];
}

int uopen(const char *path, int mode) {
    int fd;
    file_state_t *fs;
    
    file_io_init();
    
    fd = open(path, mode);
    if (fd < 0)
        return fd;
    
    if (fd >= MAX_FDS) {
        printf(2, "[ufileio] Error: File descriptor %d exceeds maximum %d\n", fd, MAX_FDS);
        close(fd);
        return -1;
    }
    
    fs = &file_states[fd];
    fs->fd = fd;
    
    if (mode & O_RDONLY || mode & O_RDWR) {
        fs->readable = 1;
    }
    if (mode & O_WRONLY || mode & O_RDWR) {
        fs->writable = 1;
    }
    
    mutex_init(&fs->m);
    cond_init(&fs->cond_read);
    cond_init(&fs->cond_write);
    
    return fd;
}

int uclose(int fd) {
    file_state_t *fs;
    
    if (!file_states_initialized) {
        return close(fd);
    }
    
    fs = get_file_state(fd);
    if (!fs || fs->fd != fd) {
        return close(fd);
    }
    
    mutex_lock(&fs->m);
    
    fs->readable = 0;
    fs->writable = 0;
    fs->fd = -1;
    
    cond_broadcast(&fs->cond_read);
    cond_broadcast(&fs->cond_write);
    
    mutex_unlock(&fs->m);
    
    return close(fd);
}

int uread(int fd, void *buf, int n) {
    file_state_t *fs;
    int ret;
    
    if (!file_states_initialized) {
        file_io_init();
    }
    
    fs = get_file_state(fd);
    if (!fs || fs->fd != fd) {
        return read(fd, buf, n);
    }
    
    mutex_lock(&fs->m);
    
    while (1) {
        mutex_unlock(&fs->m);
        ret = read(fd, buf, n);
        mutex_lock(&fs->m);
        
        if (ret > 0) {
            fs->readable = 1;
            cond_signal(&fs->cond_write);
            mutex_unlock(&fs->m);
            return ret;
        }
        
        if (ret == 0) {
            fs->readable = 0;
            cond_wait(&fs->cond_read, &fs->m);
            continue;
        }
        
        mutex_unlock(&fs->m);
        return ret;
    }
}

int uwrite(int fd, const void *buf, int n) {
    file_state_t *fs;
    int ret;
    
    if (!file_states_initialized) {
        file_io_init();
    }
    
    fs = get_file_state(fd);
    if (!fs || fs->fd != fd) {
        return write(fd, buf, n);
    }
    
    mutex_lock(&fs->m);
    
    while (1) {
        mutex_unlock(&fs->m);
        ret = write(fd, buf, n);
        mutex_lock(&fs->m);
        
        if (ret == n) {
            fs->writable = 1;
            cond_signal(&fs->cond_read);
            mutex_unlock(&fs->m);
            return ret;
        }
        
        if (ret >= 0 && ret < n) {
            fs->writable = 0;
            cond_wait(&fs->cond_write, &fs->m);
            continue;
        }
        
        if (ret < 0) {
            mutex_unlock(&fs->m);
            return ret;
        }
        
        mutex_unlock(&fs->m);
        return ret;
    }
}

