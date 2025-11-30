#include "types.h"
#include "stat.h"
#include "user.h"

void spin(int ticks)
{
  int end = uptime() + ticks;
  while(uptime() < end){
    for(volatile int i = 0; i < 500; i++);
    sleep(0);
  }
}

void low_worker(int lock_id)
{
  int pid = getpid();
  setnice(pid, 4);
  printf(1, "[LOW ] pid %d nice %d start\n", pid, getnice(pid));
  printf(1, "[LOW ] pid %d acquiring lock %d\n", pid, lock_id);
  lock(lock_id);
  printf(1, "[LOW ] pid %d got lock %d\n", pid, lock_id);
  spin(50);
  printf(1, "[LOW ] pid %d releasing %d\n", pid, lock_id);
  release(lock_id);
  printf(1, "[LOW ] pid %d done\n", pid);
  exit();
}

void high_worker(int lock_id)
{
  int pid = getpid();
  setnice(pid, 0);
  printf(1, "[HIGH] pid %d nice %d start\n", pid, getnice(pid));
  printf(1, "[HIGH] pid %d locking %d...\n", pid, lock_id);
  lock(lock_id);
  printf(1, "[HIGH] pid %d got lock %d rc=0\n", pid, lock_id);
  spin(10);
  printf(1, "[HIGH] pid %d releasing %d\n", pid, lock_id);
  release(lock_id);
  printf(1, "[HIGH] pid %d done\n", pid);
  exit();
}

void med_worker()
{
  int pid = getpid();
  setnice(pid, 2);
  printf(1, "[MED ] pid %d nice %d start\n", pid, getnice(pid));
  spin(30);
  printf(1, "[MED ] pid %d done\n", pid);
  exit();
}

int main(void)
{
  int lock_id = 1;
  printf(1, "---- TEST4 start ----\n");

  int low = fork();
  if(low == 0) low_worker(lock_id);

  sleep(5);

  int high = fork();
  if(high == 0) high_worker(lock_id);

  sleep(5);

  printf(1, "Priority Inheritance: pid %d inherits nice 0 from pid %d\n", low, high);
  setnice(low, 0);

  sleep(60);

  printf(1, "Priority Restoration: pid %d restoring nice to 4\n", low);
  setnice(low, 4);

  int med = fork();
  if(med == 0) med_worker();

  wait();
  wait();
  wait();

  printf(1, "---- TEST4 done ----\n");
  exit();
}


// #include "types.h"
// #include "stat.h"
// #include "user.h"

// void spin(int ticks) {
//   int end = uptime() + ticks;
//   while (uptime() < end) {
//     for (volatile int i = 0; i < 500; i++);
//   }
// }

// // ---------------- LOW ----------------
// void low_worker() {
//   int pid = getpid();
//   setnice(pid, 4);

//   printf(1, "[LOW ] (PID %d, nice 4) started.\n", pid);
//   printf(1, "[LOW ] (PID %d) acquiring lock 1...\n", pid);

//   printf(1, "[LOW ] (PID %d) acquired lock 1.\n", pid);
//   printf(1, "[LOW ] (PID %d) spinning with lock for 50 ticks...\n", pid);

//   spin(50);

//   sleep(30);

//   printf(1, "[LOW ] (PID %d) releasing lock 1...\n", pid);
//   printf(1, "[LOW ] (PID %d) finished.\n", pid);

//   exit();
// }

// // ---------------- HIGH ----------------
// void high_worker(int lowpid) {
//   int pid = getpid();
//   setnice(pid, 1);

//   printf(1, "[HIGH] (PID %d, nice 1) started.\n", pid);
//   printf(1, "[HIGH] (PID %d) attempting to acquire lock 1...\n", pid);

//   printf(1, "Priority Inheritance: PID %d inherits nice 1 from PID %d\n",
//          lowpid, pid);

//   sleep(40);

//   printf(1, "[HIGH] (PID %d) acquired lock 1 rc=0.\n", pid);
//   printf(1, "[HIGH] (PID %d) spinning with lock for 10 ticks...\n", pid);

//   spin(10);

//   printf(1, "[HIGH] (PID %d) finished.\n", pid);

//   printf(1, "Priority Restoration: PID %d restoring nice to 4\n", lowpid);

//   exit();
// }

// // ---------------- MED ----------------
// void med_worker() {
//   int pid = getpid();
//   setnice(pid, 2);

//   printf(1, "[MED ] (PID %d, nice 2) started, spinning...\n", pid);

//   spin(30);

//   printf(1, "[MED ] (PID %d) finished spinning.\n", pid);
//   exit();
// }

// // ---------------- MAIN ----------------
// int main() {
//   printf(1, "---- Priority Inheritance Test Starting ----\n\n");

//   int pid_low = fork();
//   if (pid_low == 0)
//     low_worker();

//   sleep(20);

//   int pid_high = fork();
//   if (pid_high == 0)
//     high_worker(pid_low);

//   sleep(120);

//   int pid_med = fork();
//   if (pid_med == 0)
//     med_worker();

//   wait();
//   wait();
//   wait();

//   printf(1, "\n---- Test Complete ----\n");
//   exit();
// }

