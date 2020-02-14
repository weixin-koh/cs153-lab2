
_lab1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
int exitWait(void);
int waitPid(void);
int CELEBW02(void);

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  printf(1, "\n This program tests the correctness of your lab#1\n");
   d:	c7 44 24 04 f0 0d 00 	movl   $0xdf0,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 4f 08 00 00       	call   870 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 94 06 00 00       	call   6c0 <atoi>
  2c:	83 f8 01             	cmp    $0x1,%eax
  2f:	74 40                	je     71 <main+0x71>
	exitWait();
  else if (atoi(argv[1]) == 2)
  31:	8b 43 04             	mov    0x4(%ebx),%eax
  34:	89 04 24             	mov    %eax,(%esp)
  37:	e8 84 06 00 00       	call   6c0 <atoi>
  3c:	83 f8 02             	cmp    $0x2,%eax
  3f:	74 37                	je     78 <main+0x78>
	waitPid();
  else if (atoi(argv[1]) == 3)
  41:	8b 43 04             	mov    0x4(%ebx),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 74 06 00 00       	call   6c0 <atoi>
  4c:	83 f8 03             	cmp    $0x3,%eax
  4f:	74 36                	je     87 <main+0x87>
	CELEBW02();
  else 
   printf(1, "\ntype \"lab1 1\" to test exit and wait, \"lab1 2\" to test waitpid and \"lab1 3\" to test the extra credit WNOHANG option \n");
  51:	c7 44 24 04 24 0e 00 	movl   $0xe24,0x4(%esp)
  58:	00 
  59:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  60:	e8 0b 08 00 00       	call   870 <printf>
  
    // End of test
	 exit(0);
  65:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  6c:	e8 b1 06 00 00       	call   722 <exit>
	exitWait();
  71:	e8 2a 00 00 00       	call   a0 <exitWait>
  76:	eb ed                	jmp    65 <main+0x65>
  78:	90                   	nop
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	waitPid();
  80:	e8 1b 01 00 00       	call   1a0 <waitPid>
  85:	eb de                	jmp    65 <main+0x65>
	CELEBW02();
  87:	e8 84 03 00 00       	call   410 <CELEBW02>
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	eb d3                	jmp    65 <main+0x65>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <exitWait>:
	 return 0;
 }
  
int exitWait(void) {
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
       int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  a5:	31 db                	xor    %ebx,%ebx
int exitWait(void) {
  a7:	83 ec 20             	sub    $0x20,%esp
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");
  aa:	c7 44 24 04 d8 0b 00 	movl   $0xbd8,0x4(%esp)
  b1:	00 
      {
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
      exit(-1);
  } 
    } else if (pid > 0) { // only the parent executes this code
      ret_pid = wait(&exit_status);
  b2:	8d 75 f4             	lea    -0xc(%ebp),%esi
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");
  b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bc:	e8 af 07 00 00       	call   870 <printf>
    pid = fork();
  c1:	e8 54 06 00 00       	call   71a <fork>
    if (pid == 0) { // only the child executed this code
  c6:	83 f8 00             	cmp    $0x0,%eax
  c9:	74 45                	je     110 <exitWait+0x70>
  cb:	90                   	nop
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if (pid > 0) { // only the parent executes this code
  d0:	0f 8e a3 00 00 00    	jle    179 <exitWait+0xd9>
      ret_pid = wait(&exit_status);
  d6:	89 34 24             	mov    %esi,(%esp)
  for (i = 0; i < 2; i++) {
  d9:	83 c3 01             	add    $0x1,%ebx
      ret_pid = wait(&exit_status);
  dc:	e8 49 06 00 00       	call   72a <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e4:	c7 44 24 04 58 0c 00 	movl   $0xc58,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  f7:	89 44 24 08          	mov    %eax,0x8(%esp)
  fb:	e8 70 07 00 00       	call   870 <printf>
  for (i = 0; i < 2; i++) {
 100:	83 fb 02             	cmp    $0x2,%ebx
 103:	75 bc                	jne    c1 <exitWait+0x21>
	  printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
}
 105:	83 c4 20             	add    $0x20,%esp
 108:	31 c0                	xor    %eax,%eax
 10a:	5b                   	pop    %ebx
 10b:	5e                   	pop    %esi
 10c:	5d                   	pop    %ebp
 10d:	c3                   	ret    
 10e:	66 90                	xchg   %ax,%ax
      if (i == 0)
 110:	85 db                	test   %ebx,%ebx
 112:	75 34                	jne    148 <exitWait+0xa8>
      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 114:	e8 91 06 00 00       	call   7aa <getpid>
 119:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 120:	00 
 121:	c7 44 24 04 1c 0c 00 	movl   $0xc1c,0x4(%esp)
 128:	00 
 129:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	e8 37 07 00 00       	call   870 <printf>
      exit(0);
 139:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 140:	e8 dd 05 00 00       	call   722 <exit>
 145:	8d 76 00             	lea    0x0(%esi),%esi
	 printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 148:	e8 5d 06 00 00       	call   7aa <getpid>
 14d:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
 154:	ff 
 155:	c7 44 24 04 1c 0c 00 	movl   $0xc1c,0x4(%esp)
 15c:	00 
 15d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 164:	89 44 24 08          	mov    %eax,0x8(%esp)
 168:	e8 03 07 00 00       	call   870 <printf>
      exit(-1);
 16d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 174:	e8 a9 05 00 00       	call   722 <exit>
	  printf(2, "\nError using fork\n");
 179:	c7 44 24 04 9c 0e 00 	movl   $0xe9c,0x4(%esp)
 180:	00 
 181:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 188:	e8 e3 06 00 00       	call   870 <printf>
      exit(-1);
 18d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 194:	e8 89 05 00 00       	call   722 <exit>
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <waitPid>:

int waitPid(void){
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
 1a5:	83 ec 30             	sub    $0x30,%esp
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

 printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");
 1a8:	c7 44 24 04 9c 0c 00 	movl   $0xc9c,0x4(%esp)
 1af:	00 
 1b0:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 1b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ba:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int pid_a[5]={0, 0, 0, 0, 0};
 1bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 1cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");
 1e0:	e8 8b 06 00 00       	call   870 <printf>

	for (i = 0; i <5; i++) {
		pid_a[i] = fork();
 1e5:	e8 30 05 00 00       	call   71a <fork>
		if (pid_a[i] == 0) { // only the child executed this code
 1ea:	85 c0                	test   %eax,%eax
		pid_a[i] = fork();
 1ec:	89 03                	mov    %eax,(%ebx)
		if (pid_a[i] == 0) { // only the child executed this code
 1ee:	0f 84 d5 01 00 00    	je     3c9 <waitPid+0x229>
 1f4:	83 c3 04             	add    $0x4,%ebx
	for (i = 0; i <5; i++) {
 1f7:	39 f3                	cmp    %esi,%ebx
 1f9:	75 ea                	jne    1e5 <waitPid+0x45>
			printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
			exit(getpid() + 4);
		}
	}
       
      sleep(5);
 1fb:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 202:	8d 5d e0             	lea    -0x20(%ebp),%ebx
      sleep(5);
 205:	e8 b0 05 00 00       	call   7ba <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 20a:	8b 75 f0             	mov    -0x10(%ebp),%esi
 20d:	c7 44 24 04 18 0d 00 	movl   $0xd18,0x4(%esp)
 214:	00 
 215:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 21c:	89 74 24 08          	mov    %esi,0x8(%esp)
 220:	e8 4b 06 00 00       	call   870 <printf>
      ret_pid = waitpid(pid_a[3], &exit_status, 0);
 225:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 229:	89 34 24             	mov    %esi,(%esp)
 22c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 233:	00 
 234:	e8 f9 04 00 00       	call   732 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 239:	8b 55 e0             	mov    -0x20(%ebp),%edx
 23c:	c7 44 24 04 54 0d 00 	movl   $0xd54,0x4(%esp)
 243:	00 
 244:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 24f:	89 44 24 08          	mov    %eax,0x8(%esp)
 253:	e8 18 06 00 00       	call   870 <printf>
      sleep(5);
 258:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 25f:	e8 56 05 00 00       	call   7ba <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 264:	8b 75 e8             	mov    -0x18(%ebp),%esi
 267:	c7 44 24 04 18 0d 00 	movl   $0xd18,0x4(%esp)
 26e:	00 
 26f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 276:	89 74 24 08          	mov    %esi,0x8(%esp)
 27a:	e8 f1 05 00 00       	call   870 <printf>
      ret_pid = waitpid(pid_a[1], &exit_status, 0);
 27f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 283:	89 34 24             	mov    %esi,(%esp)
 286:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 28d:	00 
 28e:	e8 9f 04 00 00       	call   732 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 293:	8b 55 e0             	mov    -0x20(%ebp),%edx
 296:	c7 44 24 04 54 0d 00 	movl   $0xd54,0x4(%esp)
 29d:	00 
 29e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a5:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2a9:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ad:	e8 be 05 00 00       	call   870 <printf>
      sleep(5);
 2b2:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 2b9:	e8 fc 04 00 00       	call   7ba <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 2be:	8b 75 ec             	mov    -0x14(%ebp),%esi
 2c1:	c7 44 24 04 18 0d 00 	movl   $0xd18,0x4(%esp)
 2c8:	00 
 2c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2d0:	89 74 24 08          	mov    %esi,0x8(%esp)
 2d4:	e8 97 05 00 00       	call   870 <printf>
      ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2d9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2dd:	89 34 24             	mov    %esi,(%esp)
 2e0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 2e7:	00 
 2e8:	e8 45 04 00 00       	call   732 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 2ed:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2f0:	c7 44 24 04 54 0d 00 	movl   $0xd54,0x4(%esp)
 2f7:	00 
 2f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ff:	89 54 24 0c          	mov    %edx,0xc(%esp)
 303:	89 44 24 08          	mov    %eax,0x8(%esp)
 307:	e8 64 05 00 00       	call   870 <printf>
      sleep(5);
 30c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 313:	e8 a2 04 00 00       	call   7ba <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 318:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 31b:	c7 44 24 04 18 0d 00 	movl   $0xd18,0x4(%esp)
 322:	00 
 323:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 32a:	89 74 24 08          	mov    %esi,0x8(%esp)
 32e:	e8 3d 05 00 00       	call   870 <printf>
      ret_pid = waitpid(pid_a[0], &exit_status, 0);
 333:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 337:	89 34 24             	mov    %esi,(%esp)
 33a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 341:	00 
 342:	e8 eb 03 00 00       	call   732 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 347:	8b 55 e0             	mov    -0x20(%ebp),%edx
 34a:	c7 44 24 04 54 0d 00 	movl   $0xd54,0x4(%esp)
 351:	00 
 352:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 359:	89 54 24 0c          	mov    %edx,0xc(%esp)
 35d:	89 44 24 08          	mov    %eax,0x8(%esp)
 361:	e8 0a 05 00 00       	call   870 <printf>
      sleep(5);
 366:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 36d:	e8 48 04 00 00       	call   7ba <sleep>
      printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 372:	8b 75 f4             	mov    -0xc(%ebp),%esi
 375:	c7 44 24 04 18 0d 00 	movl   $0xd18,0x4(%esp)
 37c:	00 
 37d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 384:	89 74 24 08          	mov    %esi,0x8(%esp)
 388:	e8 e3 04 00 00       	call   870 <printf>
      ret_pid = waitpid(pid_a[4], &exit_status, 0);
 38d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 391:	89 34 24             	mov    %esi,(%esp)
 394:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 39b:	00 
 39c:	e8 91 03 00 00       	call   732 <waitpid>
      printf(1, "\n This is the partent: Child# %d has exited with status %d\n",ret_pid, exit_status);
 3a1:	8b 55 e0             	mov    -0x20(%ebp),%edx
 3a4:	c7 44 24 04 54 0d 00 	movl   $0xd54,0x4(%esp)
 3ab:	00 
 3ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3b7:	89 44 24 08          	mov    %eax,0x8(%esp)
 3bb:	e8 b0 04 00 00       	call   870 <printf>
      
      return 0;
  }
 3c0:	83 c4 30             	add    $0x30,%esp
 3c3:	31 c0                	xor    %eax,%eax
 3c5:	5b                   	pop    %ebx
 3c6:	5e                   	pop    %esi
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    
			printf(1, "\n The is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
 3c9:	e8 dc 03 00 00       	call   7aa <getpid>
 3ce:	89 c3                	mov    %eax,%ebx
 3d0:	e8 d5 03 00 00       	call   7aa <getpid>
 3d5:	83 c3 04             	add    $0x4,%ebx
 3d8:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 3dc:	c7 44 24 04 dc 0c 00 	movl   $0xcdc,0x4(%esp)
 3e3:	00 
 3e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3eb:	89 44 24 08          	mov    %eax,0x8(%esp)
 3ef:	e8 7c 04 00 00       	call   870 <printf>
			exit(getpid() + 4);
 3f4:	e8 b1 03 00 00       	call   7aa <getpid>
 3f9:	83 c0 04             	add    $0x4,%eax
 3fc:	89 04 24             	mov    %eax,(%esp)
 3ff:	e8 1e 03 00 00       	call   722 <exit>
 404:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 40a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000410 <CELEBW02>:

int CELEBW02(void){
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	56                   	push   %esi
 414:	53                   	push   %ebx
 415:	83 ec 20             	sub    $0x20,%esp
	
 printf(1, "\n  Part e) the waitpid option WNOHANG, test program CELEBW02 \n");
 418:	c7 44 24 04 90 0d 00 	movl   $0xd90,0x4(%esp)
 41f:	00 
 420:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 427:	e8 44 04 00 00       	call   870 <printf>

  int pid, retpid;
  int status;

  if ((pid = fork()) < 0)
 42c:	e8 e9 02 00 00       	call   71a <fork>
 431:	85 c0                	test   %eax,%eax
 433:	89 c3                	mov    %eax,%ebx
 435:	0f 88 92 00 00 00    	js     4cd <CELEBW02+0xbd>
    printf(2, "fork() error");
  else if (pid == 0) {
 43b:	0f 84 a2 00 00 00    	je     4e3 <CELEBW02+0xd3>
 441:	8d 75 f4             	lea    -0xc(%ebp),%esi
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sleep(5);
    exit(1);
  }
  else do {
    if ((retpid = waitpid(pid, &status, WNOHANG)) == -1)
 448:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44f:	00 
 450:	89 74 24 04          	mov    %esi,0x4(%esp)
 454:	89 1c 24             	mov    %ebx,(%esp)
 457:	e8 d6 02 00 00       	call   732 <waitpid>
 45c:	83 f8 ff             	cmp    $0xffffffff,%eax
 45f:	74 4f                	je     4b0 <CELEBW02+0xa0>
      printf(2, "wait() error");
    else if (retpid == 0) {
 461:	85 c0                	test   %eax,%eax
 463:	75 23                	jne    488 <CELEBW02+0x78>
      printf(1, "child is still running \n");
 465:	c7 44 24 04 c9 0e 00 	movl   $0xec9,0x4(%esp)
 46c:	00 
 46d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 474:	e8 f7 03 00 00       	call   870 <printf>
      sleep(1);
 479:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 480:	e8 35 03 00 00       	call   7ba <sleep>
 485:	eb c1                	jmp    448 <CELEBW02+0x38>
 487:	90                   	nop
    }
    else {
        printf(1, "child exited with status of %d\n", status);
 488:	8b 45 f4             	mov    -0xc(%ebp),%eax
 48b:	c7 44 24 04 d0 0d 00 	movl   $0xdd0,0x4(%esp)
 492:	00 
 493:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 49a:	89 44 24 08          	mov    %eax,0x8(%esp)
 49e:	e8 cd 03 00 00       	call   870 <printf>
    }
  } while (retpid == 0);
  
  return 0;
  
  }
 4a3:	83 c4 20             	add    $0x20,%esp
 4a6:	31 c0                	xor    %eax,%eax
 4a8:	5b                   	pop    %ebx
 4a9:	5e                   	pop    %esi
 4aa:	5d                   	pop    %ebp
 4ab:	c3                   	ret    
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(2, "wait() error");
 4b0:	c7 44 24 04 bc 0e 00 	movl   $0xebc,0x4(%esp)
 4b7:	00 
 4b8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 4bf:	e8 ac 03 00 00       	call   870 <printf>
  }
 4c4:	83 c4 20             	add    $0x20,%esp
 4c7:	31 c0                	xor    %eax,%eax
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
    printf(2, "fork() error");
 4cd:	c7 44 24 04 af 0e 00 	movl   $0xeaf,0x4(%esp)
 4d4:	00 
 4d5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 4dc:	e8 8f 03 00 00       	call   870 <printf>
 4e1:	eb c0                	jmp    4a3 <CELEBW02+0x93>
    sleep(5);
 4e3:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 4ea:	e8 cb 02 00 00       	call   7ba <sleep>
    exit(1);
 4ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4f6:	e8 27 02 00 00       	call   722 <exit>
 4fb:	66 90                	xchg   %ax,%ax
 4fd:	66 90                	xchg   %ax,%ax
 4ff:	90                   	nop

00000500 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 509:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 50a:	89 c2                	mov    %eax,%edx
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 510:	83 c1 01             	add    $0x1,%ecx
 513:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 517:	83 c2 01             	add    $0x1,%edx
 51a:	84 db                	test   %bl,%bl
 51c:	88 5a ff             	mov    %bl,-0x1(%edx)
 51f:	75 ef                	jne    510 <strcpy+0x10>
    ;
  return os;
}
 521:	5b                   	pop    %ebx
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 52a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000530 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	8b 55 08             	mov    0x8(%ebp),%edx
 536:	53                   	push   %ebx
 537:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 53a:	0f b6 02             	movzbl (%edx),%eax
 53d:	84 c0                	test   %al,%al
 53f:	74 2d                	je     56e <strcmp+0x3e>
 541:	0f b6 19             	movzbl (%ecx),%ebx
 544:	38 d8                	cmp    %bl,%al
 546:	74 0e                	je     556 <strcmp+0x26>
 548:	eb 2b                	jmp    575 <strcmp+0x45>
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 550:	38 c8                	cmp    %cl,%al
 552:	75 15                	jne    569 <strcmp+0x39>
    p++, q++;
 554:	89 d9                	mov    %ebx,%ecx
 556:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 559:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 55c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 55f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 563:	84 c0                	test   %al,%al
 565:	75 e9                	jne    550 <strcmp+0x20>
 567:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 569:	29 c8                	sub    %ecx,%eax
}
 56b:	5b                   	pop    %ebx
 56c:	5d                   	pop    %ebp
 56d:	c3                   	ret    
 56e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 571:	31 c0                	xor    %eax,%eax
 573:	eb f4                	jmp    569 <strcmp+0x39>
 575:	0f b6 cb             	movzbl %bl,%ecx
 578:	eb ef                	jmp    569 <strcmp+0x39>
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000580 <strlen>:

uint
strlen(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 586:	80 39 00             	cmpb   $0x0,(%ecx)
 589:	74 12                	je     59d <strlen+0x1d>
 58b:	31 d2                	xor    %edx,%edx
 58d:	8d 76 00             	lea    0x0(%esi),%esi
 590:	83 c2 01             	add    $0x1,%edx
 593:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 597:	89 d0                	mov    %edx,%eax
 599:	75 f5                	jne    590 <strlen+0x10>
    ;
  return n;
}
 59b:	5d                   	pop    %ebp
 59c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 59d:	31 c0                	xor    %eax,%eax
}
 59f:	5d                   	pop    %ebp
 5a0:	c3                   	ret    
 5a1:	eb 0d                	jmp    5b0 <memset>
 5a3:	90                   	nop
 5a4:	90                   	nop
 5a5:	90                   	nop
 5a6:	90                   	nop
 5a7:	90                   	nop
 5a8:	90                   	nop
 5a9:	90                   	nop
 5aa:	90                   	nop
 5ab:	90                   	nop
 5ac:	90                   	nop
 5ad:	90                   	nop
 5ae:	90                   	nop
 5af:	90                   	nop

000005b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	8b 55 08             	mov    0x8(%ebp),%edx
 5b6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 5bd:	89 d7                	mov    %edx,%edi
 5bf:	fc                   	cld    
 5c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5c2:	89 d0                	mov    %edx,%eax
 5c4:	5f                   	pop    %edi
 5c5:	5d                   	pop    %ebp
 5c6:	c3                   	ret    
 5c7:	89 f6                	mov    %esi,%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005d0 <strchr>:

char*
strchr(const char *s, char c)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	53                   	push   %ebx
 5d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 5da:	0f b6 18             	movzbl (%eax),%ebx
 5dd:	84 db                	test   %bl,%bl
 5df:	74 1d                	je     5fe <strchr+0x2e>
    if(*s == c)
 5e1:	38 d3                	cmp    %dl,%bl
 5e3:	89 d1                	mov    %edx,%ecx
 5e5:	75 0d                	jne    5f4 <strchr+0x24>
 5e7:	eb 17                	jmp    600 <strchr+0x30>
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f0:	38 ca                	cmp    %cl,%dl
 5f2:	74 0c                	je     600 <strchr+0x30>
  for(; *s; s++)
 5f4:	83 c0 01             	add    $0x1,%eax
 5f7:	0f b6 10             	movzbl (%eax),%edx
 5fa:	84 d2                	test   %dl,%dl
 5fc:	75 f2                	jne    5f0 <strchr+0x20>
      return (char*)s;
  return 0;
 5fe:	31 c0                	xor    %eax,%eax
}
 600:	5b                   	pop    %ebx
 601:	5d                   	pop    %ebp
 602:	c3                   	ret    
 603:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000610 <gets>:

char*
gets(char *buf, int max)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 615:	31 f6                	xor    %esi,%esi
{
 617:	53                   	push   %ebx
 618:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 61b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 61e:	eb 31                	jmp    651 <gets+0x41>
    cc = read(0, &c, 1);
 620:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 627:	00 
 628:	89 7c 24 04          	mov    %edi,0x4(%esp)
 62c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 633:	e8 0a 01 00 00       	call   742 <read>
    if(cc < 1)
 638:	85 c0                	test   %eax,%eax
 63a:	7e 1d                	jle    659 <gets+0x49>
      break;
    buf[i++] = c;
 63c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 640:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 642:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 645:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 647:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 64b:	74 0c                	je     659 <gets+0x49>
 64d:	3c 0a                	cmp    $0xa,%al
 64f:	74 08                	je     659 <gets+0x49>
  for(i=0; i+1 < max; ){
 651:	8d 5e 01             	lea    0x1(%esi),%ebx
 654:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 657:	7c c7                	jl     620 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 660:	83 c4 2c             	add    $0x2c,%esp
 663:	5b                   	pop    %ebx
 664:	5e                   	pop    %esi
 665:	5f                   	pop    %edi
 666:	5d                   	pop    %ebp
 667:	c3                   	ret    
 668:	90                   	nop
 669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000670 <stat>:

int
stat(const char *n, struct stat *st)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	56                   	push   %esi
 674:	53                   	push   %ebx
 675:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 678:	8b 45 08             	mov    0x8(%ebp),%eax
 67b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 682:	00 
 683:	89 04 24             	mov    %eax,(%esp)
 686:	e8 df 00 00 00       	call   76a <open>
  if(fd < 0)
 68b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 68d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 68f:	78 27                	js     6b8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 691:	8b 45 0c             	mov    0xc(%ebp),%eax
 694:	89 1c 24             	mov    %ebx,(%esp)
 697:	89 44 24 04          	mov    %eax,0x4(%esp)
 69b:	e8 e2 00 00 00       	call   782 <fstat>
  close(fd);
 6a0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 6a3:	89 c6                	mov    %eax,%esi
  close(fd);
 6a5:	e8 a8 00 00 00       	call   752 <close>
  return r;
 6aa:	89 f0                	mov    %esi,%eax
}
 6ac:	83 c4 10             	add    $0x10,%esp
 6af:	5b                   	pop    %ebx
 6b0:	5e                   	pop    %esi
 6b1:	5d                   	pop    %ebp
 6b2:	c3                   	ret    
 6b3:	90                   	nop
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 6b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 6bd:	eb ed                	jmp    6ac <stat+0x3c>
 6bf:	90                   	nop

000006c0 <atoi>:

int
atoi(const char *s)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 6c6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6c7:	0f be 11             	movsbl (%ecx),%edx
 6ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 6cd:	3c 09                	cmp    $0x9,%al
  n = 0;
 6cf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 6d4:	77 17                	ja     6ed <atoi+0x2d>
 6d6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 6d8:	83 c1 01             	add    $0x1,%ecx
 6db:	8d 04 80             	lea    (%eax,%eax,4),%eax
 6de:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 6e2:	0f be 11             	movsbl (%ecx),%edx
 6e5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 6e8:	80 fb 09             	cmp    $0x9,%bl
 6eb:	76 eb                	jbe    6d8 <atoi+0x18>
  return n;
}
 6ed:	5b                   	pop    %ebx
 6ee:	5d                   	pop    %ebp
 6ef:	c3                   	ret    

000006f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6f0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6f1:	31 d2                	xor    %edx,%edx
{
 6f3:	89 e5                	mov    %esp,%ebp
 6f5:	56                   	push   %esi
 6f6:	8b 45 08             	mov    0x8(%ebp),%eax
 6f9:	53                   	push   %ebx
 6fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6fd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 700:	85 db                	test   %ebx,%ebx
 702:	7e 12                	jle    716 <memmove+0x26>
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 708:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 70c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 70f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 712:	39 da                	cmp    %ebx,%edx
 714:	75 f2                	jne    708 <memmove+0x18>
  return vdst;
}
 716:	5b                   	pop    %ebx
 717:	5e                   	pop    %esi
 718:	5d                   	pop    %ebp
 719:	c3                   	ret    

0000071a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 71a:	b8 01 00 00 00       	mov    $0x1,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <exit>:
SYSCALL(exit)
 722:	b8 02 00 00 00       	mov    $0x2,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <wait>:
SYSCALL(wait)
 72a:	b8 03 00 00 00       	mov    $0x3,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <waitpid>:
SYSCALL(waitpid)
 732:	b8 16 00 00 00       	mov    $0x16,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <pipe>:
SYSCALL(pipe)
 73a:	b8 04 00 00 00       	mov    $0x4,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <read>:
SYSCALL(read)
 742:	b8 05 00 00 00       	mov    $0x5,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <write>:
SYSCALL(write)
 74a:	b8 10 00 00 00       	mov    $0x10,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <close>:
SYSCALL(close)
 752:	b8 15 00 00 00       	mov    $0x15,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <kill>:
SYSCALL(kill)
 75a:	b8 06 00 00 00       	mov    $0x6,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <exec>:
SYSCALL(exec)
 762:	b8 07 00 00 00       	mov    $0x7,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <open>:
SYSCALL(open)
 76a:	b8 0f 00 00 00       	mov    $0xf,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <mknod>:
SYSCALL(mknod)
 772:	b8 11 00 00 00       	mov    $0x11,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <unlink>:
SYSCALL(unlink)
 77a:	b8 12 00 00 00       	mov    $0x12,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <fstat>:
SYSCALL(fstat)
 782:	b8 08 00 00 00       	mov    $0x8,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <link>:
SYSCALL(link)
 78a:	b8 13 00 00 00       	mov    $0x13,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <mkdir>:
SYSCALL(mkdir)
 792:	b8 14 00 00 00       	mov    $0x14,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <chdir>:
SYSCALL(chdir)
 79a:	b8 09 00 00 00       	mov    $0x9,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <dup>:
SYSCALL(dup)
 7a2:	b8 0a 00 00 00       	mov    $0xa,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    

000007aa <getpid>:
SYSCALL(getpid)
 7aa:	b8 0b 00 00 00       	mov    $0xb,%eax
 7af:	cd 40                	int    $0x40
 7b1:	c3                   	ret    

000007b2 <sbrk>:
SYSCALL(sbrk)
 7b2:	b8 0c 00 00 00       	mov    $0xc,%eax
 7b7:	cd 40                	int    $0x40
 7b9:	c3                   	ret    

000007ba <sleep>:
SYSCALL(sleep)
 7ba:	b8 0d 00 00 00       	mov    $0xd,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <uptime>:
SYSCALL(uptime)
 7c2:	b8 0e 00 00 00       	mov    $0xe,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax

000007d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	89 c6                	mov    %eax,%esi
 7d7:	53                   	push   %ebx
 7d8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7de:	85 db                	test   %ebx,%ebx
 7e0:	74 09                	je     7eb <printint+0x1b>
 7e2:	89 d0                	mov    %edx,%eax
 7e4:	c1 e8 1f             	shr    $0x1f,%eax
 7e7:	84 c0                	test   %al,%al
 7e9:	75 75                	jne    860 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 7eb:	89 d0                	mov    %edx,%eax
  neg = 0;
 7ed:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 7f4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 7f7:	31 ff                	xor    %edi,%edi
 7f9:	89 ce                	mov    %ecx,%esi
 7fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 7fe:	eb 02                	jmp    802 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 800:	89 cf                	mov    %ecx,%edi
 802:	31 d2                	xor    %edx,%edx
 804:	f7 f6                	div    %esi
 806:	8d 4f 01             	lea    0x1(%edi),%ecx
 809:	0f b6 92 e9 0e 00 00 	movzbl 0xee9(%edx),%edx
  }while((x /= base) != 0);
 810:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 812:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 815:	75 e9                	jne    800 <printint+0x30>
  if(neg)
 817:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 81a:	89 c8                	mov    %ecx,%eax
 81c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 81f:	85 d2                	test   %edx,%edx
 821:	74 08                	je     82b <printint+0x5b>
    buf[i++] = '-';
 823:	8d 4f 02             	lea    0x2(%edi),%ecx
 826:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 82b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 82e:	66 90                	xchg   %ax,%ax
 830:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 835:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 838:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 83f:	00 
 840:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 844:	89 34 24             	mov    %esi,(%esp)
 847:	88 45 d7             	mov    %al,-0x29(%ebp)
 84a:	e8 fb fe ff ff       	call   74a <write>
  while(--i >= 0)
 84f:	83 ff ff             	cmp    $0xffffffff,%edi
 852:	75 dc                	jne    830 <printint+0x60>
    putc(fd, buf[i]);
}
 854:	83 c4 4c             	add    $0x4c,%esp
 857:	5b                   	pop    %ebx
 858:	5e                   	pop    %esi
 859:	5f                   	pop    %edi
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 860:	89 d0                	mov    %edx,%eax
 862:	f7 d8                	neg    %eax
    neg = 1;
 864:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 86b:	eb 87                	jmp    7f4 <printint+0x24>
 86d:	8d 76 00             	lea    0x0(%esi),%esi

00000870 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 874:	31 ff                	xor    %edi,%edi
{
 876:	56                   	push   %esi
 877:	53                   	push   %ebx
 878:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 87b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 87e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 881:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 884:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 887:	0f b6 13             	movzbl (%ebx),%edx
 88a:	83 c3 01             	add    $0x1,%ebx
 88d:	84 d2                	test   %dl,%dl
 88f:	75 39                	jne    8ca <printf+0x5a>
 891:	e9 c2 00 00 00       	jmp    958 <printf+0xe8>
 896:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 898:	83 fa 25             	cmp    $0x25,%edx
 89b:	0f 84 bf 00 00 00    	je     960 <printf+0xf0>
  write(fd, &c, 1);
 8a1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 8a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8ab:	00 
 8ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 8b0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 8b3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
 8b6:	e8 8f fe ff ff       	call   74a <write>
 8bb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 8be:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 8c2:	84 d2                	test   %dl,%dl
 8c4:	0f 84 8e 00 00 00    	je     958 <printf+0xe8>
    if(state == 0){
 8ca:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 8cc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 8cf:	74 c7                	je     898 <printf+0x28>
      }
    } else if(state == '%'){
 8d1:	83 ff 25             	cmp    $0x25,%edi
 8d4:	75 e5                	jne    8bb <printf+0x4b>
      if(c == 'd'){
 8d6:	83 fa 64             	cmp    $0x64,%edx
 8d9:	0f 84 31 01 00 00    	je     a10 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8df:	25 f7 00 00 00       	and    $0xf7,%eax
 8e4:	83 f8 70             	cmp    $0x70,%eax
 8e7:	0f 84 83 00 00 00    	je     970 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8ed:	83 fa 73             	cmp    $0x73,%edx
 8f0:	0f 84 a2 00 00 00    	je     998 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8f6:	83 fa 63             	cmp    $0x63,%edx
 8f9:	0f 84 35 01 00 00    	je     a34 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8ff:	83 fa 25             	cmp    $0x25,%edx
 902:	0f 84 e0 00 00 00    	je     9e8 <printf+0x178>
  write(fd, &c, 1);
 908:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 90b:	83 c3 01             	add    $0x1,%ebx
 90e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 915:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 916:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 918:	89 44 24 04          	mov    %eax,0x4(%esp)
 91c:	89 34 24             	mov    %esi,(%esp)
 91f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 922:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 926:	e8 1f fe ff ff       	call   74a <write>
        putc(fd, c);
 92b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 92e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 931:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 938:	00 
 939:	89 44 24 04          	mov    %eax,0x4(%esp)
 93d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 940:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 943:	e8 02 fe ff ff       	call   74a <write>
  for(i = 0; fmt[i]; i++){
 948:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 94c:	84 d2                	test   %dl,%dl
 94e:	0f 85 76 ff ff ff    	jne    8ca <printf+0x5a>
 954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
 958:	83 c4 3c             	add    $0x3c,%esp
 95b:	5b                   	pop    %ebx
 95c:	5e                   	pop    %esi
 95d:	5f                   	pop    %edi
 95e:	5d                   	pop    %ebp
 95f:	c3                   	ret    
        state = '%';
 960:	bf 25 00 00 00       	mov    $0x25,%edi
 965:	e9 51 ff ff ff       	jmp    8bb <printf+0x4b>
 96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 970:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 973:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
 978:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 97a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 981:	8b 10                	mov    (%eax),%edx
 983:	89 f0                	mov    %esi,%eax
 985:	e8 46 fe ff ff       	call   7d0 <printint>
        ap++;
 98a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 98e:	e9 28 ff ff ff       	jmp    8bb <printf+0x4b>
 993:	90                   	nop
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 998:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 99b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 99f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 9a1:	b8 e2 0e 00 00       	mov    $0xee2,%eax
 9a6:	85 ff                	test   %edi,%edi
 9a8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 9ab:	0f b6 07             	movzbl (%edi),%eax
 9ae:	84 c0                	test   %al,%al
 9b0:	74 2a                	je     9dc <printf+0x16c>
 9b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9b8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 9bb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 9be:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 9c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9c8:	00 
 9c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 9cd:	89 34 24             	mov    %esi,(%esp)
 9d0:	e8 75 fd ff ff       	call   74a <write>
        while(*s != 0){
 9d5:	0f b6 07             	movzbl (%edi),%eax
 9d8:	84 c0                	test   %al,%al
 9da:	75 dc                	jne    9b8 <printf+0x148>
      state = 0;
 9dc:	31 ff                	xor    %edi,%edi
 9de:	e9 d8 fe ff ff       	jmp    8bb <printf+0x4b>
 9e3:	90                   	nop
 9e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 9e8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 9eb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 9ed:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9f4:	00 
 9f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 9f9:	89 34 24             	mov    %esi,(%esp)
 9fc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 a00:	e8 45 fd ff ff       	call   74a <write>
 a05:	e9 b1 fe ff ff       	jmp    8bb <printf+0x4b>
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a10:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a13:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
 a18:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 a1b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a22:	8b 10                	mov    (%eax),%edx
 a24:	89 f0                	mov    %esi,%eax
 a26:	e8 a5 fd ff ff       	call   7d0 <printint>
        ap++;
 a2b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a2f:	e9 87 fe ff ff       	jmp    8bb <printf+0x4b>
        putc(fd, *ap);
 a34:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 a37:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 a39:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a3b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a42:	00 
 a43:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 a46:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 a49:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 a4c:	89 44 24 04          	mov    %eax,0x4(%esp)
 a50:	e8 f5 fc ff ff       	call   74a <write>
        ap++;
 a55:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a59:	e9 5d fe ff ff       	jmp    8bb <printf+0x4b>
 a5e:	66 90                	xchg   %ax,%ax

00000a60 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a60:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a61:	a1 f0 11 00 00       	mov    0x11f0,%eax
{
 a66:	89 e5                	mov    %esp,%ebp
 a68:	57                   	push   %edi
 a69:	56                   	push   %esi
 a6a:	53                   	push   %ebx
 a6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a6e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 a70:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a73:	39 d0                	cmp    %edx,%eax
 a75:	72 11                	jb     a88 <free+0x28>
 a77:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a78:	39 c8                	cmp    %ecx,%eax
 a7a:	72 04                	jb     a80 <free+0x20>
 a7c:	39 ca                	cmp    %ecx,%edx
 a7e:	72 10                	jb     a90 <free+0x30>
 a80:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a82:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a84:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a86:	73 f0                	jae    a78 <free+0x18>
 a88:	39 ca                	cmp    %ecx,%edx
 a8a:	72 04                	jb     a90 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a8c:	39 c8                	cmp    %ecx,%eax
 a8e:	72 f0                	jb     a80 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a90:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a93:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 a96:	39 cf                	cmp    %ecx,%edi
 a98:	74 1e                	je     ab8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a9a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a9d:	8b 48 04             	mov    0x4(%eax),%ecx
 aa0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 aa3:	39 f2                	cmp    %esi,%edx
 aa5:	74 28                	je     acf <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 aa7:	89 10                	mov    %edx,(%eax)
  freep = p;
 aa9:	a3 f0 11 00 00       	mov    %eax,0x11f0
}
 aae:	5b                   	pop    %ebx
 aaf:	5e                   	pop    %esi
 ab0:	5f                   	pop    %edi
 ab1:	5d                   	pop    %ebp
 ab2:	c3                   	ret    
 ab3:	90                   	nop
 ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 ab8:	03 71 04             	add    0x4(%ecx),%esi
 abb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 abe:	8b 08                	mov    (%eax),%ecx
 ac0:	8b 09                	mov    (%ecx),%ecx
 ac2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ac5:	8b 48 04             	mov    0x4(%eax),%ecx
 ac8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 acb:	39 f2                	cmp    %esi,%edx
 acd:	75 d8                	jne    aa7 <free+0x47>
    p->s.size += bp->s.size;
 acf:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 ad2:	a3 f0 11 00 00       	mov    %eax,0x11f0
    p->s.size += bp->s.size;
 ad7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ada:	8b 53 f8             	mov    -0x8(%ebx),%edx
 add:	89 10                	mov    %edx,(%eax)
}
 adf:	5b                   	pop    %ebx
 ae0:	5e                   	pop    %esi
 ae1:	5f                   	pop    %edi
 ae2:	5d                   	pop    %ebp
 ae3:	c3                   	ret    
 ae4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 aea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000af0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	57                   	push   %edi
 af4:	56                   	push   %esi
 af5:	53                   	push   %ebx
 af6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 af9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 afc:	8b 1d f0 11 00 00    	mov    0x11f0,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b02:	8d 48 07             	lea    0x7(%eax),%ecx
 b05:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 b08:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b0a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 b0d:	0f 84 9b 00 00 00    	je     bae <malloc+0xbe>
 b13:	8b 13                	mov    (%ebx),%edx
 b15:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b18:	39 fe                	cmp    %edi,%esi
 b1a:	76 64                	jbe    b80 <malloc+0x90>
 b1c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 b23:	bb 00 80 00 00       	mov    $0x8000,%ebx
 b28:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b2b:	eb 0e                	jmp    b3b <malloc+0x4b>
 b2d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b30:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b32:	8b 78 04             	mov    0x4(%eax),%edi
 b35:	39 fe                	cmp    %edi,%esi
 b37:	76 4f                	jbe    b88 <malloc+0x98>
 b39:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b3b:	3b 15 f0 11 00 00    	cmp    0x11f0,%edx
 b41:	75 ed                	jne    b30 <malloc+0x40>
  if(nu < 4096)
 b43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b46:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 b4c:	bf 00 10 00 00       	mov    $0x1000,%edi
 b51:	0f 43 fe             	cmovae %esi,%edi
 b54:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 b57:	89 04 24             	mov    %eax,(%esp)
 b5a:	e8 53 fc ff ff       	call   7b2 <sbrk>
  if(p == (char*)-1)
 b5f:	83 f8 ff             	cmp    $0xffffffff,%eax
 b62:	74 18                	je     b7c <malloc+0x8c>
  hp->s.size = nu;
 b64:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 b67:	83 c0 08             	add    $0x8,%eax
 b6a:	89 04 24             	mov    %eax,(%esp)
 b6d:	e8 ee fe ff ff       	call   a60 <free>
  return freep;
 b72:	8b 15 f0 11 00 00    	mov    0x11f0,%edx
      if((p = morecore(nunits)) == 0)
 b78:	85 d2                	test   %edx,%edx
 b7a:	75 b4                	jne    b30 <malloc+0x40>
        return 0;
 b7c:	31 c0                	xor    %eax,%eax
 b7e:	eb 20                	jmp    ba0 <malloc+0xb0>
    if(p->s.size >= nunits){
 b80:	89 d0                	mov    %edx,%eax
 b82:	89 da                	mov    %ebx,%edx
 b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 b88:	39 fe                	cmp    %edi,%esi
 b8a:	74 1c                	je     ba8 <malloc+0xb8>
        p->s.size -= nunits;
 b8c:	29 f7                	sub    %esi,%edi
 b8e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 b91:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 b94:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 b97:	89 15 f0 11 00 00    	mov    %edx,0x11f0
      return (void*)(p + 1);
 b9d:	83 c0 08             	add    $0x8,%eax
  }
}
 ba0:	83 c4 1c             	add    $0x1c,%esp
 ba3:	5b                   	pop    %ebx
 ba4:	5e                   	pop    %esi
 ba5:	5f                   	pop    %edi
 ba6:	5d                   	pop    %ebp
 ba7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 ba8:	8b 08                	mov    (%eax),%ecx
 baa:	89 0a                	mov    %ecx,(%edx)
 bac:	eb e9                	jmp    b97 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 bae:	c7 05 f0 11 00 00 f4 	movl   $0x11f4,0x11f0
 bb5:	11 00 00 
    base.s.size = 0;
 bb8:	ba f4 11 00 00       	mov    $0x11f4,%edx
    base.s.ptr = freep = prevp = &base;
 bbd:	c7 05 f4 11 00 00 f4 	movl   $0x11f4,0x11f4
 bc4:	11 00 00 
    base.s.size = 0;
 bc7:	c7 05 f8 11 00 00 00 	movl   $0x0,0x11f8
 bce:	00 00 00 
 bd1:	e9 46 ff ff ff       	jmp    b1c <malloc+0x2c>
