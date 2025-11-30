#include "types.h"
#include "stat.h"
#include "user.h"

int isprime(int x){
  if(x < 2) return 0;
  for(int j = 2; j * j <= x; j++)
    if(x % j == 0) return 0;
  return 1;
}

void work(){
  int pid = getpid();
  int nice = getnice(pid);    

  int i = 2, cnt = 0;
  while(cnt < 200){
    if(isprime(i)){
      if(cnt % 20 == 0)
        printf(1, "T1 P%d nice%d %d\n", pid, nice, i);
      cnt++;

      if(nice == 0)
        sleep(1);
      else if(nice == 2)
        sleep(2);
      else
        sleep(4);
    }
    i++;
  }
  exit();
}
int main(int argc, char *argv[]){
  int p1 = fork();
  if(p1 == 0){
    setnice(getpid(), 0);
    work();
  }

  int p2 = fork();
  if(p2 == 0){
    setnice(getpid(), 2);
    work();
  }

  int p3 = fork();
  if(p3 == 0){
    setnice(getpid(), 4);
    work();
  }

  wait();
  wait();
  wait();
  exit();
}
