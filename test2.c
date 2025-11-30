#include "types.h"
#include "stat.h"
#include "user.h"

int isprime(int x){
  if(x < 2) return 0;
  for(int j = 2; j * j <= x; j++)
    if(x % j == 0) return 0;
  return 1;
}

void busy_work(char tag, int nice){
  int i = 2, c = 0;
  while(c < 50){
    if(isprime(i)){
      if(c % 10 == 0)
        printf(1, "T2 [%c] pid %d nice %d step %d\n",
               tag, getpid(), nice, c);

      c++;

      if(nice == 0)
        sleep(1);     
      else if(nice == 2)
        sleep(5);   
      else
        sleep(12);    
    }
    i++;
  }

  printf(1, "T2 [%c] pid %d done\n", tag, getpid());
  exit();
}

int main(int argc, char *argv[])
{
  int pidA = fork();
  if(pidA == 0){
    setnice(getpid(), 0);
    busy_work('A', 0);
  }

  int pidB = fork();
  if(pidB == 0){
    setnice(getpid(), 2);
    busy_work('B', 2);
  }

  int pidC = fork();
  if(pidC == 0){
    setnice(getpid(), 4);
    busy_work('C', 4);
  }

  wait();
  wait();
  wait();
  exit();
}
