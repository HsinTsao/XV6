#include "types.h"
#include "stat.h"
#include "user.h"

int isprime(int x){
  if(x < 2) return 0;
  for(int j = 2; j * j <= x; j++)
    if(x % j == 0) return 0;
  return 1;
}

void busy(char tag, int beats){
  int i = 2, c = 0, b = 0;
  while(b < beats){
    if(isprime(i)) c++;

    if(c % 800 == 0){  
      printf(1, "T3 %c pid %d beat %d nice %d\n",
             tag, getpid(), b, getnice(getpid()));
      b++;

      int n = getnice(getpid());
      if(n == 0) sleep(3);
      else if(n == 2) sleep(8);
      else sleep(15);
    }
    i++;
  }

  printf(1, "T3 %c pid %d done\n", tag, getpid());
  exit();
}

int main(int argc, char *argv[]){
  int a = fork();
  if(a == 0){
    setnice(getpid(), 4);   
    busy('A', 12);
    exit();
  }

  int b = fork();
  if(b == 0){
    setnice(getpid(), 2);   
    busy('B', 12);
    exit();
  }

  
  sleep(20);
  printf(1, "T3 change A higher\n");
  setnice(a, 0);              // A -> highest

  sleep(20);
  printf(1, "T3 change B lower\n");
  setnice(b, 4);              // B -> lowest

  sleep(20);
  printf(1, "T3 change A lower\n");
  setnice(a, 4);              // A -> lowest again

  sleep(20);
  printf(1, "T3 change B higher\n");
  setnice(b, 0);              // B -> highest

  wait();
  wait();
  printf(1, "T3 done all\n");
  exit();
}
