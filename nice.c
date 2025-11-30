#include "types.h"
#include "stat.h"
#include "user.h"

static void usage(void) {
  printf(1, "usage:\n");
  printf(1, "  nice <pid> <value>\n");
  printf(1, "  nice <value>\n");
}

int main(int argc, char *argv[]) {
  int pid, val, old;
  if (argc == 2) {
    val = atoi(argv[1]);
    pid = getpid();
  } else if (argc == 3) {
    pid = atoi(argv[1]);
    val = atoi(argv[2]);
  } else {
    usage();
    exit();
  }
  old = setnice(pid, val);
  if (old < 0) {
    printf(1, "nice failed pid=%d value=%d\n", pid, val);
    exit();
  }
  printf(1, "%d %d\n", pid, old);
  exit();
}
