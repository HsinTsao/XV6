#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

#define MAX_PI_LOCKS 7

struct pi_lock {
  int used;
  int locked;
  struct proc *owner;
  struct proc *waiters[NPROC];
  int waiter_count;
};

static struct pi_lock pi_locks[MAX_PI_LOCKS];
static struct spinlock pi_table_lock;

extern struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static void
add_waiter(struct pi_lock *l, struct proc *p)
{
  int i;
  for(i = 0; i < l->waiter_count; i++){
    if(l->waiters[i] == p)
      return;
  }
  if(l->waiter_count < NPROC){
    l->waiters[l->waiter_count++] = p;
  }
}

static void
remove_waiter(struct pi_lock *l, struct proc *p)
{
  int i;
  for(i = 0; i < l->waiter_count; i++){
    if(l->waiters[i] == p){
      l->waiter_count--;
      l->waiters[i] = l->waiters[l->waiter_count];
      l->waiters[l->waiter_count] = 0;
      return;
    }
  }
}

static int
best_waiter_nice(struct pi_lock *l)
{
  int best = NICE_MAX + 1;
  for(int i = 0; i < l->waiter_count; i++){
    struct proc *w = l->waiters[i];
    if(w && w->state != UNUSED && w->eff_nice < best)
      best = w->eff_nice;
  }
  return best == NICE_MAX + 1 ? -1 : best;
}

static void
recompute_proc_priority(struct proc *p)
{
  int new_nice = p->base_nice;
  for(int i = 0; i < MAX_PI_LOCKS; i++){
    if(pi_locks[i].owner == p){
      int candidate = best_waiter_nice(&pi_locks[i]);
      if(candidate >= 0 && candidate < new_nice)
        new_nice = candidate;
    }
  }
  p->eff_nice = new_nice;
}

void
pi_init(void)
{
  initlock(&pi_table_lock, "pilock");
  for(int i = 0; i < MAX_PI_LOCKS; i++){
    pi_locks[i].used = 0;
    pi_locks[i].locked = 0;
    pi_locks[i].owner = 0;
    pi_locks[i].waiter_count = 0;
  }
}

int
pi_lock_acquire(int id)
{
  if(id < 0 || id >= MAX_PI_LOCKS)
    return -1;

  struct proc *cur = myproc();

  acquire(&ptable.lock);
  acquire(&pi_table_lock);
  struct pi_lock *lock = &pi_locks[id];
  lock->used = 1;

  for(;;){
    if(!lock->locked){
      lock->locked = 1;
      lock->owner = cur;
      lock->waiter_count = 0;
      cur->pi_mask |= (1 << id);
      recompute_proc_priority(cur);
      release(&pi_table_lock);
      release(&ptable.lock);
      return 0;
    }

    if(lock->owner == cur){
      release(&pi_table_lock);
      release(&ptable.lock);
      return -1;
    }

    add_waiter(lock, cur);
    if(lock->owner && cur->eff_nice < lock->owner->eff_nice){
      lock->owner->eff_nice = cur->eff_nice;
    }

    release(&pi_table_lock);
    sleep(lock, &ptable.lock);
    acquire(&pi_table_lock);
    remove_waiter(lock, cur);
  }
}

int
pi_lock_release(int id)
{
  if(id < 0 || id >= MAX_PI_LOCKS)
    return -1;

  struct proc *cur = myproc();

  acquire(&ptable.lock);
  acquire(&pi_table_lock);
  struct pi_lock *lock = &pi_locks[id];

  if(!lock->locked || lock->owner != cur){
    release(&pi_table_lock);
    release(&ptable.lock);
    return -1;
  }

  lock->locked = 0;
  lock->owner = 0;
  cur->pi_mask &= ~(1 << id);
  recompute_proc_priority(cur);

  release(&pi_table_lock);
  release(&ptable.lock);
  wakeup(lock);
  return 0;
}
