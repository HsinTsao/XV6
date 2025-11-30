// tail.c for xv6-public (x86)
// Supports: tail, tail FILE..., tail -N [FILE...], tail -n N [FILE...], pipes, multi-file headers.

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#define CHUNK 512

typedef struct {
  char **lines;   // ring of pointers to heap-allocated lines
  int cap;        // capacity (N)
  int count;      // stored count (<= N)
  int head;       // next insert index [0..cap-1]
} LineRing;

typedef struct {
  char *buf;
  int cap;
  int len;
} Builder;

/* ===== utilities ===== */

static void die_oom(void) {
  printf(2, "tail: out of memory\n");
  exit();  // xv6 x86: exit() takes no arg
}

static void ring_init(LineRing *r, int cap) {
  r->cap = cap;
  r->count = 0;
  r->head = 0;
  if (cap > 0) {
    r->lines = (char**)malloc(sizeof(char*) * cap);
    if (!r->lines) die_oom();
    for (int i = 0; i < cap; i++) r->lines[i] = 0;
  } else {
    r->lines = 0;
  }
}

static void ring_free(LineRing *r) {
  if (r->lines) {
    int m = r->count < r->cap ? r->count : r->cap;
    for (int i = 0; i < m; i++) {
      int idx = (r->head - 1 - i);
      if (idx < 0) idx += r->cap;
      if (r->lines[idx]) {
        free(r->lines[idx]);
        r->lines[idx] = 0;
      }
    }
    free(r->lines);
  }
  r->lines = 0;
  r->cap = r->count = r->head = 0;
}

static void ring_push(LineRing *r, const char *line, int len) {
  if (r->cap == 0) return;
  char *p = (char*)malloc(len + 1);
  if (!p) die_oom();
  memmove(p, line, len);
  p[len] = '\0';

  if (r->count >= r->cap && r->lines[r->head]) {
    free(r->lines[r->head]);
    r->lines[r->head] = 0;
  }
  r->lines[r->head] = p;
  r->head = (r->head + 1) % r->cap;
  if (r->count < r->cap) r->count++;
}

static void ring_print(const LineRing *r) {
  if (r->cap == 0 || r->count == 0) return;
  int start = r->head - r->count;
  if (start < 0) start += r->cap;
  for (int i = 0; i < r->count; i++) {
    int idx = (start + i) % r->cap;
    if (r->lines[idx]) {
      write(1, r->lines[idx], strlen(r->lines[idx])); // stdout
    }
  }
}

static void b_init(Builder *b) {
  b->buf = 0;
  b->cap = 0;
  b->len = 0;
}

static void b_free(Builder *b) {
  if (b->buf) free(b->buf);
  b->buf = 0;
  b->cap = b->len = 0;
}

static void b_reserve(Builder *b, int need) {
  if (b->len + need < b->cap) return;
  int newcap = b->cap == 0 ? 64 : b->cap * 2;
  while (b->len + need >= newcap) newcap *= 2;
  char *np = (char*)malloc(newcap);
  if (!np) die_oom();
  if (b->buf && b->len > 0) memmove(np, b->buf, b->len);
  if (b->buf) free(b->buf);
  b->buf = np;
  b->cap = newcap;
}

static void b_pushc(Builder *b, char c) {
  b_reserve(b, 1);
  b->buf[b->len++] = c;
}

// finalize line: ensure newline, push to ring, reset len
static void b_finish_line(Builder *b, LineRing *r) {
  if (b->len == 0 || b->buf[b->len - 1] != '\n') b_pushc(b, '\n');
  ring_push(r, b->buf, b->len);
  b->len = 0;
}

/* ===== core ===== */

static void tail_fd(int fd, int n) {
  LineRing ring;
  ring_init(&ring, n);

  char buf[CHUNK];
  Builder cur;
  b_init(&cur);

  int nread;
  while ((nread = read(fd, buf, sizeof(buf))) > 0) {
    for (int i = 0; i < nread; i++) {
      char c = buf[i];
      b_pushc(&cur, c);
      if (c == '\n') {
        b_finish_line(&cur, &ring);
      }
    }
  }
  // last partial line
  if (cur.len > 0) {
    b_finish_line(&cur, &ring);
  }

  ring_print(&ring);
  b_free(&cur);
  ring_free(&ring);
}

static void usage(void) {
  printf(2, "usage: tail [-N] | [-n N] [file...]\n");
  exit();
}

/* ===== main ===== */

int main(int argc, char *argv[]) {
  int n = 10;
  int ai = 1;

  // Handle "-N" form (e.g., -5 means -n 5)
  if (ai < argc && argv[ai][0] == '-' && argv[ai][1] != '\0' && argv[ai][1] != 'n') {
    int k = 1, val = 0;
    while (argv[ai][k]) {
      char c = argv[ai][k++];
      if (c < '0' || c > '9') usage();
      val = val * 10 + (c - '0');
    }
    n = val;
    ai++;
  } else if (ai < argc && strcmp(argv[ai], "-n") == 0) {
    ai++;
    if (ai >= argc) usage();
    n = atoi(argv[ai]);
    ai++;
  }

  if (n < 0) {
    printf(2, "tail: N must be non-negative\n");
    exit();
  }

  int files = argc - ai;
  if (files <= 0) {
    // stdin
    tail_fd(0, n);
    exit();
  }

  int show_headers = (files > 1);
  for (int i = ai; i < argc; i++) {
    int fd = open(argv[i], O_RDONLY);
    if (fd < 0) {
      printf(2, "tail: cannot open %s\n", argv[i]);
      continue;
    }
    if (show_headers) {
      printf(1, "==> %s <==\n", argv[i]);
    }
    tail_fd(fd, n);
    close(fd);
    if (show_headers && i < argc - 1) {
      printf(1, "\n");
    }
  }
  exit();
}
