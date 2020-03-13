#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct shm_page {
    uint id;
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {
  int i;

  acquire(&(shm_table.lock));

  for (i = 0; i< 64; i++) {
    // Case 1: Memory segment already exists
    if (shm_table.shm_pages[i].id == id) {
      mappages(myproc()->pgdir, (void*) PGROUNDUP(myproc()->sz), PGSIZE, V2P(shm_table.shm_pages[i].frame), PTE_W|PTE_U);
      shm_table.shm_pages[i].refcnt++;
      *pointer=(char *) PGROUNDUP(myproc()->sz);
      myproc()->sz += PGSIZE;
      release(&(shm_table.lock));
      return 0;
    }

    // Case 2: Shared memory segment does not exist
    if (shm_table.shm_pages[i].id == 0) {
      shm_table.shm_pages[i].id = id;
      shm_table.shm_pages[i].frame = kalloc();
      shm_table.shm_pages[i].refcnt = 1;
      memset(shm_table.shm_pages[i].frame, 0, PGSIZE);
      mappages(myproc()->pgdir, (void*) PGROUNDUP(myproc()->sz), PGSIZE, V2P(shm_table.shm_pages[i].frame), PTE_W|PTE_U);
      *pointer=(char *) PGROUNDUP(myproc()->sz);
      myproc()->sz += PGSIZE;
      release(&(shm_table.lock));
      return 0;
    }
  }

  release(&(shm_table.lock));

  return 0;
}


int shm_close(int id) {
  int i;

  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));

  for (i = 0; i< 64; i++) {
    if (shm_table.shm_pages[i].id == id) {
      shm_table.shm_pages[i].refcnt--;

      if (shm_table.shm_pages[i].refcnt > 0) {
        break;
      }

      shm_table.shm_pages[i].id = 0;
      shm_table.shm_pages[i].frame = 0;
      shm_table.shm_pages[i].refcnt = 0;
      break;
    }
  }

  // Shared memory item not found
  if (shm_table.shm_pages[i].id != id) {
    release(&(shm_table.lock));
    return 1;
  }

  release(&(shm_table.lock));

return 0;
}
