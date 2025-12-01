
_uthreads_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "  $ producer_consumer\n");
    printf(1, "  $ reader_writer\n");
    printf(1, "========================================================\n");
}

int main(int argc, char *argv[]) {
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
    printf(1, "\n");
      11:	68 d6 25 00 00       	push   $0x25d6
      16:	6a 01                	push   $0x1
      18:	e8 b3 15 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
      1d:	58                   	pop    %eax
      1e:	5a                   	pop    %edx
      1f:	68 5c 2f 00 00       	push   $0x2f5c
      24:	6a 01                	push   $0x1
      26:	e8 a5 15 00 00       	call   15d0 <printf>
    printf(1, "    Threading Library Test\n");
      2b:	59                   	pop    %ecx
      2c:	58                   	pop    %eax
      2d:	68 57 26 00 00       	push   $0x2657
      32:	6a 01                	push   $0x1
      34:	e8 97 15 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
      39:	58                   	pop    %eax
      3a:	5a                   	pop    %edx
      3b:	68 5c 2f 00 00       	push   $0x2f5c
      40:	6a 01                	push   $0x1
      42:	e8 89 15 00 00       	call   15d0 <printf>
    
    thread_init();
      47:	e8 94 18 00 00       	call   18e0 <thread_init>
    
    printf(1, "\n");
      4c:	59                   	pop    %ecx
      4d:	58                   	pop    %eax
      4e:	68 d6 25 00 00       	push   $0x25d6
      53:	6a 01                	push   $0x1
      55:	e8 76 15 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
      5a:	58                   	pop    %eax
      5b:	5a                   	pop    %edx
      5c:	68 5c 2f 00 00       	push   $0x2f5c
      61:	6a 01                	push   $0x1
      63:	e8 68 15 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
      68:	59                   	pop    %ecx
      69:	58                   	pop    %eax
      6a:	68 98 2f 00 00       	push   $0x2f98
      6f:	6a 01                	push   $0x1
      71:	e8 5a 15 00 00       	call   15d0 <printf>
    printf(1, "=      Part 1: Threading System Basics                 =\n");
      76:	58                   	pop    %eax
      77:	5a                   	pop    %edx
      78:	68 d4 2f 00 00       	push   $0x2fd4
      7d:	6a 01                	push   $0x1
      7f:	e8 4c 15 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
      84:	59                   	pop    %ecx
      85:	58                   	pop    %eax
      86:	68 98 2f 00 00       	push   $0x2f98
      8b:	6a 01                	push   $0x1
      8d:	e8 3e 15 00 00       	call   15d0 <printf>
    printf(1, "=  Test Content:                                       =\n");
      92:	58                   	pop    %eax
      93:	5a                   	pop    %edx
      94:	68 10 30 00 00       	push   $0x3010
      99:	6a 01                	push   $0x1
      9b:	e8 30 15 00 00       	call   15d0 <printf>
    printf(1, "=  - Thread data structure + global thread table      =\n");
      a0:	59                   	pop    %ecx
      a1:	58                   	pop    %eax
      a2:	68 4c 30 00 00       	push   $0x304c
      a7:	6a 01                	push   $0x1
      a9:	e8 22 15 00 00       	call   15d0 <printf>
    printf(1, "=  - Thread create/exit/join/yield                    =\n");
      ae:	58                   	pop    %eax
      af:	5a                   	pop    %edx
      b0:	68 88 30 00 00       	push   $0x3088
      b5:	6a 01                	push   $0x1
      b7:	e8 14 15 00 00       	call   15d0 <printf>
    printf(1, "=  - x86 assembly context switch                      =\n");
      bc:	59                   	pop    %ecx
      bd:	58                   	pop    %eax
      be:	68 c4 30 00 00       	push   $0x30c4
      c3:	6a 01                	push   $0x1
      c5:	e8 06 15 00 00       	call   15d0 <printf>
    printf(1, "=  - Round-Robin scheduler                            =\n");
      ca:	58                   	pop    %eax
      cb:	5a                   	pop    %edx
      cc:	68 00 31 00 00       	push   $0x3100
      d1:	6a 01                	push   $0x1
      d3:	e8 f8 14 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
      d8:	59                   	pop    %ecx
      d9:	58                   	pop    %eax
      da:	68 98 2f 00 00       	push   $0x2f98
      df:	6a 01                	push   $0x1
      e1:	e8 ea 14 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
      e6:	58                   	pop    %eax
      e7:	5a                   	pop    %edx
      e8:	68 5c 2f 00 00       	push   $0x2f5c
      ed:	6a 01                	push   $0x1
      ef:	e8 dc 14 00 00       	call   15d0 <printf>
    
    test_basic_create_exit();
      f4:	e8 07 08 00 00       	call   900 <test_basic_create_exit>
    test_yield_scheduling();
      f9:	e8 d2 08 00 00       	call   9d0 <test_yield_scheduling>
    test_many_threads();
      fe:	e8 6d 09 00 00       	call   a70 <test_many_threads>
    test_context_switch();
     103:	e8 18 0a 00 00       	call   b20 <test_context_switch>
    test_thread_self();
     108:	e8 03 0b 00 00       	call   c10 <test_thread_self>
    
    printf(1, "\n");
     10d:	59                   	pop    %ecx
     10e:	58                   	pop    %eax
     10f:	68 d6 25 00 00       	push   $0x25d6
     114:	6a 01                	push   $0x1
     116:	e8 b5 14 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
     11b:	58                   	pop    %eax
     11c:	5a                   	pop    %edx
     11d:	68 5c 2f 00 00       	push   $0x2f5c
     122:	6a 01                	push   $0x1
     124:	e8 a7 14 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
     129:	59                   	pop    %ecx
     12a:	58                   	pop    %eax
     12b:	68 98 2f 00 00       	push   $0x2f98
     130:	6a 01                	push   $0x1
     132:	e8 99 14 00 00       	call   15d0 <printf>
    printf(1, "=      Part 2: Synchronization Primitives              =\n");
     137:	58                   	pop    %eax
     138:	5a                   	pop    %edx
     139:	68 3c 31 00 00       	push   $0x313c
     13e:	6a 01                	push   $0x1
     140:	e8 8b 14 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
     145:	59                   	pop    %ecx
     146:	58                   	pop    %eax
     147:	68 98 2f 00 00       	push   $0x2f98
     14c:	6a 01                	push   $0x1
     14e:	e8 7d 14 00 00       	call   15d0 <printf>
    printf(1, "=  Test Content:                                       =\n");
     153:	58                   	pop    %eax
     154:	5a                   	pop    %edx
     155:	68 10 30 00 00       	push   $0x3010
     15a:	6a 01                	push   $0x1
     15c:	e8 6f 14 00 00       	call   15d0 <printf>
    printf(1, "=  - Mutex lock (lock/unlock/trylock)                 =\n");
     161:	59                   	pop    %ecx
     162:	58                   	pop    %eax
     163:	68 78 31 00 00       	push   $0x3178
     168:	6a 01                	push   $0x1
     16a:	e8 61 14 00 00       	call   15d0 <printf>
    printf(1, "=  - Condition Variable (wait/signal/broadcast)       =\n");
     16f:	58                   	pop    %eax
     170:	5a                   	pop    %edx
     171:	68 b4 31 00 00       	push   $0x31b4
     176:	6a 01                	push   $0x1
     178:	e8 53 14 00 00       	call   15d0 <printf>
    printf(1, "=  - Channel (buffered message queue)                 =\n");
     17d:	59                   	pop    %ecx
     17e:	58                   	pop    %eax
     17f:	68 f0 31 00 00       	push   $0x31f0
     184:	6a 01                	push   $0x1
     186:	e8 45 14 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
     18b:	58                   	pop    %eax
     18c:	5a                   	pop    %edx
     18d:	68 98 2f 00 00       	push   $0x2f98
     192:	6a 01                	push   $0x1
     194:	e8 37 14 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
     199:	59                   	pop    %ecx
     19a:	58                   	pop    %eax
     19b:	68 5c 2f 00 00       	push   $0x2f5c
     1a0:	6a 01                	push   $0x1
     1a2:	e8 29 14 00 00       	call   15d0 <printf>
    
    test_mutex_basic();
     1a7:	e8 b4 0a 00 00       	call   c60 <test_mutex_basic>
    test_mutex_trylock();
     1ac:	e8 7f 0b 00 00       	call   d30 <test_mutex_trylock>
    test_condition_variable();
     1b1:	e8 fa 0b 00 00       	call   db0 <test_condition_variable>
    test_cond_broadcast();
     1b6:	e8 e5 0c 00 00       	call   ea0 <test_cond_broadcast>
    test_channel_basic();
     1bb:	e8 10 0e 00 00       	call   fd0 <test_channel_basic>
    test_channel_blocking();
     1c0:	e8 8b 0e 00 00       	call   1050 <test_channel_blocking>
    test_channel_multi();
     1c5:	e8 16 0f 00 00       	call   10e0 <test_channel_multi>
    
    printf(1, "\n");
     1ca:	58                   	pop    %eax
     1cb:	5a                   	pop    %edx
     1cc:	68 d6 25 00 00       	push   $0x25d6
     1d1:	6a 01                	push   $0x1
     1d3:	e8 f8 13 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
     1d8:	59                   	pop    %ecx
     1d9:	58                   	pop    %eax
     1da:	68 5c 2f 00 00       	push   $0x2f5c
     1df:	6a 01                	push   $0x1
     1e1:	e8 ea 13 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
     1e6:	58                   	pop    %eax
     1e7:	5a                   	pop    %edx
     1e8:	68 98 2f 00 00       	push   $0x2f98
     1ed:	6a 01                	push   $0x1
     1ef:	e8 dc 13 00 00       	call   15d0 <printf>
    printf(1, "=      Part 3: Application Examples                    =\n");
     1f4:	59                   	pop    %ecx
     1f5:	58                   	pop    %eax
     1f6:	68 2c 32 00 00       	push   $0x322c
     1fb:	6a 01                	push   $0x1
     1fd:	e8 ce 13 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
     202:	58                   	pop    %eax
     203:	5a                   	pop    %edx
     204:	68 98 2f 00 00       	push   $0x2f98
     209:	6a 01                	push   $0x1
     20b:	e8 c0 13 00 00       	call   15d0 <printf>
    printf(1, "=  Note: Part 3 uses standalone example programs:     =\n");
     210:	59                   	pop    %ecx
     211:	58                   	pop    %eax
     212:	68 68 32 00 00       	push   $0x3268
     217:	6a 01                	push   $0x1
     219:	e8 b2 13 00 00       	call   15d0 <printf>
    printf(1, "=    - examples/producer_consumer.c                   =\n");
     21e:	58                   	pop    %eax
     21f:	5a                   	pop    %edx
     220:	68 a4 32 00 00       	push   $0x32a4
     225:	6a 01                	push   $0x1
     227:	e8 a4 13 00 00       	call   15d0 <printf>
    printf(1, "=    - examples/reader_writer.c                       =\n");
     22c:	59                   	pop    %ecx
     22d:	58                   	pop    %eax
     22e:	68 e0 32 00 00       	push   $0x32e0
     233:	6a 01                	push   $0x1
     235:	e8 96 13 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
     23a:	58                   	pop    %eax
     23b:	5a                   	pop    %edx
     23c:	68 98 2f 00 00       	push   $0x2f98
     241:	6a 01                	push   $0x1
     243:	e8 88 13 00 00       	call   15d0 <printf>
    printf(1, "=  Run them separately for full application demos:    =\n");
     248:	59                   	pop    %ecx
     249:	58                   	pop    %eax
     24a:	68 1c 33 00 00       	push   $0x331c
     24f:	6a 01                	push   $0x1
     251:	e8 7a 13 00 00       	call   15d0 <printf>
    printf(1, "=    $ producer_consumer                              =\n");
     256:	58                   	pop    %eax
     257:	5a                   	pop    %edx
     258:	68 58 33 00 00       	push   $0x3358
     25d:	6a 01                	push   $0x1
     25f:	e8 6c 13 00 00       	call   15d0 <printf>
    printf(1, "=    $ reader_writer                                  =\n");
     264:	59                   	pop    %ecx
     265:	58                   	pop    %eax
     266:	68 94 33 00 00       	push   $0x3394
     26b:	6a 01                	push   $0x1
     26d:	e8 5e 13 00 00       	call   15d0 <printf>
    printf(1, "=                                                      =\n");
     272:	58                   	pop    %eax
     273:	5a                   	pop    %edx
     274:	68 98 2f 00 00       	push   $0x2f98
     279:	6a 01                	push   $0x1
     27b:	e8 50 13 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
     280:	59                   	pop    %ecx
     281:	58                   	pop    %eax
     282:	68 5c 2f 00 00       	push   $0x2f5c
     287:	6a 01                	push   $0x1
     289:	e8 42 13 00 00       	call   15d0 <printf>
    
    test_part3_examples();
     28e:	e8 0d 0f 00 00       	call   11a0 <test_part3_examples>
    
    printf(1, "\n");
     293:	58                   	pop    %eax
     294:	5a                   	pop    %edx
     295:	68 d6 25 00 00       	push   $0x25d6
     29a:	6a 01                	push   $0x1
     29c:	e8 2f 13 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
     2a1:	59                   	pop    %ecx
     2a2:	58                   	pop    %eax
     2a3:	68 5c 2f 00 00       	push   $0x2f5c
     2a8:	6a 01                	push   $0x1
     2aa:	e8 21 13 00 00       	call   15d0 <printf>
    printf(1, "              All Tests Completed!\n");
     2af:	58                   	pop    %eax
     2b0:	5a                   	pop    %edx
     2b1:	68 d0 33 00 00       	push   $0x33d0
     2b6:	6a 01                	push   $0x1
     2b8:	e8 13 13 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
     2bd:	59                   	pop    %ecx
     2be:	58                   	pop    %eax
     2bf:	68 5c 2f 00 00       	push   $0x2f5c
     2c4:	6a 01                	push   $0x1
     2c6:	e8 05 13 00 00       	call   15d0 <printf>

    
    exit();
     2cb:	e8 93 11 00 00       	call   1463 <exit>

000002d0 <basic_thread>:
void *basic_thread(void *arg) {
     2d0:	55                   	push   %ebp
     2d1:	89 e5                	mov    %esp,%ebp
     2d3:	53                   	push   %ebx
     2d4:	83 ec 08             	sub    $0x8,%esp
     2d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    printf(1, "  [Thread%d] Start running\n", id);
     2da:	53                   	push   %ebx
     2db:	68 90 24 00 00       	push   $0x2490
     2e0:	6a 01                	push   $0x1
     2e2:	e8 e9 12 00 00       	call   15d0 <printf>
    printf(1, "  [Thread%d] Finish running\n", id);
     2e7:	83 c4 0c             	add    $0xc,%esp
     2ea:	53                   	push   %ebx
     2eb:	68 ac 24 00 00       	push   $0x24ac
     2f0:	6a 01                	push   $0x1
     2f2:	e8 d9 12 00 00       	call   15d0 <printf>
    return (void*)(id * 10);
     2f7:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
}
     2fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2fd:	c9                   	leave
    return (void*)(id * 10);
     2fe:	01 c0                	add    %eax,%eax
}
     300:	c3                   	ret
     301:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     308:	00 
     309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <stress_thread>:
void *stress_thread(void *arg) {
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	53                   	push   %ebx
     314:	83 ec 08             	sub    $0x8,%esp
     317:	8b 5d 08             	mov    0x8(%ebp),%ebx
    printf(1, "  [Thread%d] Fast execution and exit\n", id);
     31a:	53                   	push   %ebx
     31b:	68 98 26 00 00       	push   $0x2698
     320:	6a 01                	push   $0x1
     322:	e8 a9 12 00 00       	call   15d0 <printf>
}
     327:	89 d8                	mov    %ebx,%eax
     329:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     32c:	c9                   	leave
     32d:	c3                   	ret
     32e:	66 90                	xchg   %ax,%ax

00000330 <yield_thread>:
void *yield_thread(void *arg) {
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	56                   	push   %esi
     334:	53                   	push   %ebx
     335:	8b 75 08             	mov    0x8(%ebp),%esi
    for (i = 0; i < 5; i++) {
     338:	31 db                	xor    %ebx,%ebx
     33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, "  [Thread%d] Iteration %d\n", id, i);
     340:	53                   	push   %ebx
    for (i = 0; i < 5; i++) {
     341:	83 c3 01             	add    $0x1,%ebx
        printf(1, "  [Thread%d] Iteration %d\n", id, i);
     344:	56                   	push   %esi
     345:	68 c9 24 00 00       	push   $0x24c9
     34a:	6a 01                	push   $0x1
     34c:	e8 7f 12 00 00       	call   15d0 <printf>
        thread_yield();
     351:	e8 7a 19 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 5; i++) {
     356:	83 c4 10             	add    $0x10,%esp
     359:	83 fb 05             	cmp    $0x5,%ebx
     35c:	75 e2                	jne    340 <yield_thread+0x10>
}
     35e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     361:	31 c0                	xor    %eax,%eax
     363:	5b                   	pop    %ebx
     364:	5e                   	pop    %esi
     365:	5d                   	pop    %ebp
     366:	c3                   	ret
     367:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     36e:	00 
     36f:	90                   	nop

00000370 <context_thread1>:
void *context_thread1(void *arg) {
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	bb 64 00 00 00       	mov    $0x64,%ebx
     379:	83 ec 04             	sub    $0x4,%esp
     37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ctx_var1++;
     380:	83 05 18 43 00 00 01 	addl   $0x1,0x4318
        thread_yield();
     387:	e8 44 19 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 100; i++) {
     38c:	83 eb 01             	sub    $0x1,%ebx
     38f:	75 ef                	jne    380 <context_thread1+0x10>
}
     391:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     394:	31 c0                	xor    %eax,%eax
     396:	c9                   	leave
     397:	c3                   	ret
     398:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     39f:	00 

000003a0 <context_thread2>:
void *context_thread2(void *arg) {
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	bb 64 00 00 00       	mov    $0x64,%ebx
     3a9:	83 ec 04             	sub    $0x4,%esp
     3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ctx_var2++;
     3b0:	83 05 14 43 00 00 01 	addl   $0x1,0x4314
        thread_yield();
     3b7:	e8 14 19 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 100; i++) {
     3bc:	83 eb 01             	sub    $0x1,%ebx
     3bf:	75 ef                	jne    3b0 <context_thread2+0x10>
}
     3c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c4:	31 c0                	xor    %eax,%eax
     3c6:	c9                   	leave
     3c7:	c3                   	ret
     3c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3cf:	00 

000003d0 <self_thread>:
void *self_thread(void *arg) {
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	56                   	push   %esi
     3d4:	53                   	push   %ebx
     3d5:	8b 75 08             	mov    0x8(%ebp),%esi
    int actual_tid = thread_self();
     3d8:	e8 a3 16 00 00       	call   1a80 <thread_self>
    printf(1, "  [Thread] Expected tid=%d, Actual tid=%d\n", expected_tid, actual_tid);
     3dd:	50                   	push   %eax
    int actual_tid = thread_self();
     3de:	89 c3                	mov    %eax,%ebx
    printf(1, "  [Thread] Expected tid=%d, Actual tid=%d\n", expected_tid, actual_tid);
     3e0:	56                   	push   %esi
     3e1:	68 c0 26 00 00       	push   $0x26c0
     3e6:	6a 01                	push   $0x1
     3e8:	e8 e3 11 00 00       	call   15d0 <printf>
    if (expected_tid == actual_tid) {
     3ed:	83 c4 10             	add    $0x10,%esp
     3f0:	31 c0                	xor    %eax,%eax
     3f2:	39 de                	cmp    %ebx,%esi
     3f4:	0f 94 c0             	sete   %al
}
     3f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     3fa:	5b                   	pop    %ebx
     3fb:	5e                   	pop    %esi
     3fc:	5d                   	pop    %ebp
     3fd:	c3                   	ret
     3fe:	66 90                	xchg   %ax,%ax

00000400 <mutex_inc_thread>:
void *mutex_inc_thread(void *arg) {
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	57                   	push   %edi
     404:	56                   	push   %esi
     405:	53                   	push   %ebx
     406:	83 ec 0c             	sub    $0xc,%esp
     409:	8b 7d 08             	mov    0x8(%ebp),%edi
    for (i = 0; i < iterations; i++) {
     40c:	85 ff                	test   %edi,%edi
     40e:	7e 52                	jle    462 <mutex_inc_thread+0x62>
     410:	31 f6                	xor    %esi,%esi
     412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        mutex_lock(&test_mutex);
     418:	83 ec 0c             	sub    $0xc,%esp
    for (i = 0; i < iterations; i++) {
     41b:	83 c6 01             	add    $0x1,%esi
        mutex_lock(&test_mutex);
     41e:	68 08 43 00 00       	push   $0x4308
     423:	e8 48 19 00 00       	call   1d70 <mutex_lock>
        protected_counter++;
     428:	a1 04 43 00 00       	mov    0x4304,%eax
     42d:	8d 58 01             	lea    0x1(%eax),%ebx
     430:	89 1d 04 43 00 00    	mov    %ebx,0x4304
        printf(1, "  [Thread%d] counter = %d\n", thread_self(), protected_counter);
     436:	e8 45 16 00 00       	call   1a80 <thread_self>
     43b:	53                   	push   %ebx
     43c:	50                   	push   %eax
     43d:	68 e4 24 00 00       	push   $0x24e4
     442:	6a 01                	push   $0x1
     444:	e8 87 11 00 00       	call   15d0 <printf>
        mutex_unlock(&test_mutex);
     449:	83 c4 14             	add    $0x14,%esp
     44c:	68 08 43 00 00       	push   $0x4308
     451:	e8 5a 19 00 00       	call   1db0 <mutex_unlock>
        thread_yield();
     456:	e8 75 18 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < iterations; i++) {
     45b:	83 c4 10             	add    $0x10,%esp
     45e:	39 f7                	cmp    %esi,%edi
     460:	75 b6                	jne    418 <mutex_inc_thread+0x18>
}
     462:	8d 65 f4             	lea    -0xc(%ebp),%esp
     465:	31 c0                	xor    %eax,%eax
     467:	5b                   	pop    %ebx
     468:	5e                   	pop    %esi
     469:	5f                   	pop    %edi
     46a:	5d                   	pop    %ebp
     46b:	c3                   	ret
     46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000470 <trylock_thread>:
void *trylock_thread(void *arg) {
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	56                   	push   %esi
    int success = 0;
     474:	31 f6                	xor    %esi,%esi
void *trylock_thread(void *arg) {
     476:	53                   	push   %ebx
     477:	bb 05 00 00 00       	mov    $0x5,%ebx
     47c:	eb 3a                	jmp    4b8 <trylock_thread+0x48>
     47e:	66 90                	xchg   %ax,%ax
            printf(1, "  [Thread%d] Trylock succeeded\n", thread_self());
     480:	e8 fb 15 00 00       	call   1a80 <thread_self>
     485:	83 ec 04             	sub    $0x4,%esp
            success++;
     488:	83 c6 01             	add    $0x1,%esi
            printf(1, "  [Thread%d] Trylock succeeded\n", thread_self());
     48b:	50                   	push   %eax
     48c:	68 ec 26 00 00       	push   $0x26ec
     491:	6a 01                	push   $0x1
     493:	e8 38 11 00 00       	call   15d0 <printf>
            protected_counter++;
     498:	83 05 04 43 00 00 01 	addl   $0x1,0x4304
            mutex_unlock(&test_mutex);
     49f:	c7 04 24 08 43 00 00 	movl   $0x4308,(%esp)
     4a6:	e8 05 19 00 00       	call   1db0 <mutex_unlock>
     4ab:	83 c4 10             	add    $0x10,%esp
        thread_yield();
     4ae:	e8 1d 18 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 5; i++) {
     4b3:	83 eb 01             	sub    $0x1,%ebx
     4b6:	74 36                	je     4ee <trylock_thread+0x7e>
        if (mutex_trylock(&test_mutex)) {
     4b8:	83 ec 0c             	sub    $0xc,%esp
     4bb:	68 08 43 00 00       	push   $0x4308
     4c0:	e8 3b 19 00 00       	call   1e00 <mutex_trylock>
     4c5:	83 c4 10             	add    $0x10,%esp
     4c8:	85 c0                	test   %eax,%eax
     4ca:	75 b4                	jne    480 <trylock_thread+0x10>
            printf(1, "  [Thread%d] Trylock failed, lock occupied\n", thread_self());
     4cc:	e8 af 15 00 00       	call   1a80 <thread_self>
     4d1:	83 ec 04             	sub    $0x4,%esp
     4d4:	50                   	push   %eax
     4d5:	68 0c 27 00 00       	push   $0x270c
     4da:	6a 01                	push   $0x1
     4dc:	e8 ef 10 00 00       	call   15d0 <printf>
     4e1:	83 c4 10             	add    $0x10,%esp
        thread_yield();
     4e4:	e8 e7 17 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 5; i++) {
     4e9:	83 eb 01             	sub    $0x1,%ebx
     4ec:	75 ca                	jne    4b8 <trylock_thread+0x48>
}
     4ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
     4f1:	89 f0                	mov    %esi,%eax
     4f3:	5b                   	pop    %ebx
     4f4:	5e                   	pop    %esi
     4f5:	5d                   	pop    %ebp
     4f6:	c3                   	ret
     4f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     4fe:	00 
     4ff:	90                   	nop

00000500 <wait_broadcast_thread>:
void *wait_broadcast_thread(void *arg) {
     500:	55                   	push   %ebp
     501:	89 e5                	mov    %esp,%ebp
     503:	53                   	push   %ebx
     504:	83 ec 10             	sub    $0x10,%esp
     507:	8b 5d 08             	mov    0x8(%ebp),%ebx
    mutex_lock(&broadcast_mutex);
     50a:	68 c8 42 00 00       	push   $0x42c8
     50f:	e8 5c 18 00 00       	call   1d70 <mutex_lock>
    printf(1, "  [Thread%d] Waiting for broadcast signal...\n", id);
     514:	83 c4 0c             	add    $0xc,%esp
     517:	53                   	push   %ebx
     518:	68 38 27 00 00       	push   $0x2738
     51d:	6a 01                	push   $0x1
     51f:	e8 ac 10 00 00       	call   15d0 <printf>
    while (!broadcast_ready) {
     524:	8b 15 c4 42 00 00    	mov    0x42c4,%edx
     52a:	83 c4 10             	add    $0x10,%esp
     52d:	85 d2                	test   %edx,%edx
     52f:	75 25                	jne    556 <wait_broadcast_thread+0x56>
     531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        cond_wait(&broadcast_cond, &broadcast_mutex);
     538:	83 ec 08             	sub    $0x8,%esp
     53b:	68 c8 42 00 00       	push   $0x42c8
     540:	68 d4 42 00 00       	push   $0x42d4
     545:	e8 06 19 00 00       	call   1e50 <cond_wait>
    while (!broadcast_ready) {
     54a:	a1 c4 42 00 00       	mov    0x42c4,%eax
     54f:	83 c4 10             	add    $0x10,%esp
     552:	85 c0                	test   %eax,%eax
     554:	74 e2                	je     538 <wait_broadcast_thread+0x38>
    printf(1, "  [Thread%d] Received broadcast, woken up!\n", id);
     556:	83 ec 04             	sub    $0x4,%esp
    wakeup_count++;
     559:	83 05 c0 42 00 00 01 	addl   $0x1,0x42c0
    printf(1, "  [Thread%d] Received broadcast, woken up!\n", id);
     560:	53                   	push   %ebx
     561:	68 68 27 00 00       	push   $0x2768
     566:	6a 01                	push   $0x1
     568:	e8 63 10 00 00       	call   15d0 <printf>
    mutex_unlock(&broadcast_mutex);
     56d:	c7 04 24 c8 42 00 00 	movl   $0x42c8,(%esp)
     574:	e8 37 18 00 00       	call   1db0 <mutex_unlock>
}
     579:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     57c:	31 c0                	xor    %eax,%eax
     57e:	c9                   	leave
     57f:	c3                   	ret

00000580 <producer_thread>:
void *producer_thread(void *arg) {
     580:	55                   	push   %ebp
     581:	89 e5                	mov    %esp,%ebp
     583:	57                   	push   %edi
     584:	56                   	push   %esi
    for (i = 0; i < 3; i++) {
     585:	31 f6                	xor    %esi,%esi
void *producer_thread(void *arg) {
     587:	53                   	push   %ebx
     588:	83 ec 0c             	sub    $0xc,%esp
     58b:	8b 5d 08             	mov    0x8(%ebp),%ebx
        buffer[count] = id * 10 + i;
     58e:	8d 3c 9b             	lea    (%ebx,%ebx,4),%edi
     591:	01 ff                	add    %edi,%edi
        mutex_lock(&pc_mutex);
     593:	83 ec 0c             	sub    $0xc,%esp
     596:	68 e0 42 00 00       	push   $0x42e0
     59b:	e8 d0 17 00 00       	call   1d70 <mutex_lock>
        while (count == BUFFER_SIZE) {
     5a0:	a1 ec 42 00 00       	mov    0x42ec,%eax
     5a5:	83 c4 10             	add    $0x10,%esp
     5a8:	83 f8 05             	cmp    $0x5,%eax
     5ab:	75 31                	jne    5de <producer_thread+0x5e>
     5ad:	8d 76 00             	lea    0x0(%esi),%esi
            printf(1, "  [Producer%d] Buffer full, waiting...\n", id);
     5b0:	83 ec 04             	sub    $0x4,%esp
     5b3:	53                   	push   %ebx
     5b4:	68 94 27 00 00       	push   $0x2794
     5b9:	6a 01                	push   $0x1
     5bb:	e8 10 10 00 00       	call   15d0 <printf>
            cond_wait(&not_full, &pc_mutex);
     5c0:	58                   	pop    %eax
     5c1:	5a                   	pop    %edx
     5c2:	68 e0 42 00 00       	push   $0x42e0
     5c7:	68 d8 42 00 00       	push   $0x42d8
     5cc:	e8 7f 18 00 00       	call   1e50 <cond_wait>
        while (count == BUFFER_SIZE) {
     5d1:	a1 ec 42 00 00       	mov    0x42ec,%eax
     5d6:	83 c4 10             	add    $0x10,%esp
     5d9:	83 f8 05             	cmp    $0x5,%eax
     5dc:	74 d2                	je     5b0 <producer_thread+0x30>
        buffer[count] = id * 10 + i;
     5de:	8d 14 3e             	lea    (%esi,%edi,1),%edx
        printf(1, "  [Producer%d] Produce: %d (count=%d)\n", id, id*10+i, count);
     5e1:	83 ec 0c             	sub    $0xc,%esp
    for (i = 0; i < 3; i++) {
     5e4:	83 c6 01             	add    $0x1,%esi
        buffer[count] = id * 10 + i;
     5e7:	89 14 85 f0 42 00 00 	mov    %edx,0x42f0(,%eax,4)
        count++;
     5ee:	83 c0 01             	add    $0x1,%eax
     5f1:	a3 ec 42 00 00       	mov    %eax,0x42ec
        printf(1, "  [Producer%d] Produce: %d (count=%d)\n", id, id*10+i, count);
     5f6:	50                   	push   %eax
     5f7:	52                   	push   %edx
     5f8:	53                   	push   %ebx
     5f9:	68 bc 27 00 00       	push   $0x27bc
     5fe:	6a 01                	push   $0x1
     600:	e8 cb 0f 00 00       	call   15d0 <printf>
        cond_signal(&not_empty);
     605:	83 c4 14             	add    $0x14,%esp
     608:	68 dc 42 00 00       	push   $0x42dc
     60d:	e8 de 18 00 00       	call   1ef0 <cond_signal>
        mutex_unlock(&pc_mutex);
     612:	c7 04 24 e0 42 00 00 	movl   $0x42e0,(%esp)
     619:	e8 92 17 00 00       	call   1db0 <mutex_unlock>
        thread_yield();
     61e:	e8 ad 16 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 3; i++) {
     623:	83 c4 10             	add    $0x10,%esp
     626:	83 fe 03             	cmp    $0x3,%esi
     629:	0f 85 64 ff ff ff    	jne    593 <producer_thread+0x13>
}
     62f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     632:	31 c0                	xor    %eax,%eax
     634:	5b                   	pop    %ebx
     635:	5e                   	pop    %esi
     636:	5f                   	pop    %edi
     637:	5d                   	pop    %ebp
     638:	c3                   	ret
     639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000640 <consumer_thread>:
void *consumer_thread(void *arg) {
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	56                   	push   %esi
    int id = (int)arg;
     644:	be 03 00 00 00       	mov    $0x3,%esi
void *consumer_thread(void *arg) {
     649:	53                   	push   %ebx
     64a:	8b 5d 08             	mov    0x8(%ebp),%ebx
        mutex_lock(&pc_mutex);
     64d:	83 ec 0c             	sub    $0xc,%esp
     650:	68 e0 42 00 00       	push   $0x42e0
     655:	e8 16 17 00 00       	call   1d70 <mutex_lock>
        while (count == 0) {
     65a:	a1 ec 42 00 00       	mov    0x42ec,%eax
     65f:	83 c4 10             	add    $0x10,%esp
     662:	85 c0                	test   %eax,%eax
     664:	75 37                	jne    69d <consumer_thread+0x5d>
     666:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     66d:	00 
     66e:	66 90                	xchg   %ax,%ax
            printf(1, "  [Consumer%d] Buffer empty, waiting...\n", id);
     670:	83 ec 04             	sub    $0x4,%esp
     673:	53                   	push   %ebx
     674:	68 e4 27 00 00       	push   $0x27e4
     679:	6a 01                	push   $0x1
     67b:	e8 50 0f 00 00       	call   15d0 <printf>
            cond_wait(&not_empty, &pc_mutex);
     680:	58                   	pop    %eax
     681:	5a                   	pop    %edx
     682:	68 e0 42 00 00       	push   $0x42e0
     687:	68 dc 42 00 00       	push   $0x42dc
     68c:	e8 bf 17 00 00       	call   1e50 <cond_wait>
        while (count == 0) {
     691:	a1 ec 42 00 00       	mov    0x42ec,%eax
     696:	83 c4 10             	add    $0x10,%esp
     699:	85 c0                	test   %eax,%eax
     69b:	74 d3                	je     670 <consumer_thread+0x30>
        printf(1, "  [Consumer%d] Consume: %d (count=%d)\n", id, item, count);
     69d:	83 ec 0c             	sub    $0xc,%esp
        count--;
     6a0:	83 e8 01             	sub    $0x1,%eax
     6a3:	a3 ec 42 00 00       	mov    %eax,0x42ec
        printf(1, "  [Consumer%d] Consume: %d (count=%d)\n", id, item, count);
     6a8:	50                   	push   %eax
     6a9:	ff 34 85 f0 42 00 00 	push   0x42f0(,%eax,4)
     6b0:	53                   	push   %ebx
     6b1:	68 10 28 00 00       	push   $0x2810
     6b6:	6a 01                	push   $0x1
     6b8:	e8 13 0f 00 00       	call   15d0 <printf>
        cond_signal(&not_full);
     6bd:	83 c4 14             	add    $0x14,%esp
     6c0:	68 d8 42 00 00       	push   $0x42d8
     6c5:	e8 26 18 00 00       	call   1ef0 <cond_signal>
        mutex_unlock(&pc_mutex);
     6ca:	c7 04 24 e0 42 00 00 	movl   $0x42e0,(%esp)
     6d1:	e8 da 16 00 00       	call   1db0 <mutex_unlock>
        thread_yield();
     6d6:	e8 f5 15 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 3; i++) {
     6db:	83 c4 10             	add    $0x10,%esp
     6de:	83 ee 01             	sub    $0x1,%esi
     6e1:	0f 85 66 ff ff ff    	jne    64d <consumer_thread+0xd>
}
     6e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     6ea:	31 c0                	xor    %eax,%eax
     6ec:	5b                   	pop    %ebx
     6ed:	5e                   	pop    %esi
     6ee:	5d                   	pop    %ebp
     6ef:	c3                   	ret

000006f0 <channel_sender>:
void *channel_sender(void *arg) {
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	57                   	push   %edi
     6f4:	56                   	push   %esi
     6f5:	53                   	push   %ebx
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	83 ec 0c             	sub    $0xc,%esp
     6fb:	8b 7d 08             	mov    0x8(%ebp),%edi
    for (i = 0; i < 5; i++) {
     6fe:	66 90                	xchg   %ax,%ax
        int *data = (int*)malloc(sizeof(int));
     700:	83 ec 0c             	sub    $0xc,%esp
     703:	6a 04                	push   $0x4
     705:	e8 e6 10 00 00       	call   17f0 <malloc>
        printf(1, "  [Sender] Send: %d\n", *data);
     70a:	83 c4 0c             	add    $0xc,%esp
        *data = i * 100;
     70d:	89 18                	mov    %ebx,(%eax)
        int *data = (int*)malloc(sizeof(int));
     70f:	89 c6                	mov    %eax,%esi
        printf(1, "  [Sender] Send: %d\n", *data);
     711:	53                   	push   %ebx
    for (i = 0; i < 5; i++) {
     712:	83 c3 64             	add    $0x64,%ebx
        printf(1, "  [Sender] Send: %d\n", *data);
     715:	68 ff 24 00 00       	push   $0x24ff
     71a:	6a 01                	push   $0x1
     71c:	e8 af 0e 00 00       	call   15d0 <printf>
        channel_send(ch, (void*)data);
     721:	58                   	pop    %eax
     722:	5a                   	pop    %edx
     723:	56                   	push   %esi
     724:	57                   	push   %edi
     725:	e8 06 19 00 00       	call   2030 <channel_send>
        thread_yield();
     72a:	e8 a1 15 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 5; i++) {
     72f:	83 c4 10             	add    $0x10,%esp
     732:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
     738:	75 c6                	jne    700 <channel_sender+0x10>
}
     73a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     73d:	31 c0                	xor    %eax,%eax
     73f:	5b                   	pop    %ebx
     740:	5e                   	pop    %esi
     741:	5f                   	pop    %edi
     742:	5d                   	pop    %ebp
     743:	c3                   	ret
     744:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     74b:	00 
     74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000750 <channel_fast_sender>:
void *channel_fast_sender(void *arg) {
     750:	55                   	push   %ebp
     751:	89 e5                	mov    %esp,%ebp
     753:	56                   	push   %esi
     754:	53                   	push   %ebx
     755:	8b 75 08             	mov    0x8(%ebp),%esi
    for (i = 0; i < 8; i++) {
     758:	31 db                	xor    %ebx,%ebx
     75a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, "  [FastSend] Try to send %d\n", i);
     760:	83 ec 04             	sub    $0x4,%esp
     763:	53                   	push   %ebx
     764:	68 14 25 00 00       	push   $0x2514
     769:	6a 01                	push   $0x1
     76b:	e8 60 0e 00 00       	call   15d0 <printf>
        channel_send(ch, (void*)i);
     770:	58                   	pop    %eax
     771:	5a                   	pop    %edx
     772:	53                   	push   %ebx
     773:	56                   	push   %esi
     774:	e8 b7 18 00 00       	call   2030 <channel_send>
        printf(1, "  [FastSend] Successfully sent %d\n", i);
     779:	83 c4 0c             	add    $0xc,%esp
     77c:	53                   	push   %ebx
    for (i = 0; i < 8; i++) {
     77d:	83 c3 01             	add    $0x1,%ebx
        printf(1, "  [FastSend] Successfully sent %d\n", i);
     780:	68 38 28 00 00       	push   $0x2838
     785:	6a 01                	push   $0x1
     787:	e8 44 0e 00 00       	call   15d0 <printf>
    for (i = 0; i < 8; i++) {
     78c:	83 c4 10             	add    $0x10,%esp
     78f:	83 fb 08             	cmp    $0x8,%ebx
     792:	75 cc                	jne    760 <channel_fast_sender+0x10>
}
     794:	8d 65 f8             	lea    -0x8(%ebp),%esp
     797:	31 c0                	xor    %eax,%eax
     799:	5b                   	pop    %ebx
     79a:	5e                   	pop    %esi
     79b:	5d                   	pop    %ebp
     79c:	c3                   	ret
     79d:	8d 76 00             	lea    0x0(%esi),%esi

000007a0 <multi_producer>:
void *multi_producer(void *arg) {
     7a0:	55                   	push   %ebp
     7a1:	89 e5                	mov    %esp,%ebp
     7a3:	57                   	push   %edi
     7a4:	56                   	push   %esi
     7a5:	53                   	push   %ebx
     7a6:	83 ec 0c             	sub    $0xc,%esp
    int id = thread_self();
     7a9:	e8 d2 12 00 00       	call   1a80 <thread_self>
        int msg = id * 100 + i;
     7ae:	6b f8 64             	imul   $0x64,%eax,%edi
    int id = thread_self();
     7b1:	89 c3                	mov    %eax,%ebx
    for (i = 0; i < 3; i++) {
     7b3:	8d 77 03             	lea    0x3(%edi),%esi
        printf(1, "  [Producer%d] Send: %d\n", id, msg);
     7b6:	57                   	push   %edi
     7b7:	53                   	push   %ebx
     7b8:	68 31 25 00 00       	push   $0x2531
     7bd:	6a 01                	push   $0x1
     7bf:	e8 0c 0e 00 00       	call   15d0 <printf>
        channel_send(ch, (void*)msg);
     7c4:	58                   	pop    %eax
     7c5:	5a                   	pop    %edx
     7c6:	57                   	push   %edi
     7c7:	ff 75 08             	push   0x8(%ebp)
    for (i = 0; i < 3; i++) {
     7ca:	83 c7 01             	add    $0x1,%edi
        channel_send(ch, (void*)msg);
     7cd:	e8 5e 18 00 00       	call   2030 <channel_send>
        thread_yield();
     7d2:	e8 f9 14 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 3; i++) {
     7d7:	83 c4 10             	add    $0x10,%esp
     7da:	39 f7                	cmp    %esi,%edi
     7dc:	75 d8                	jne    7b6 <multi_producer+0x16>
}
     7de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7e1:	31 c0                	xor    %eax,%eax
     7e3:	5b                   	pop    %ebx
     7e4:	5e                   	pop    %esi
     7e5:	5f                   	pop    %edi
     7e6:	5d                   	pop    %ebp
     7e7:	c3                   	ret
     7e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     7ef:	00 

000007f0 <channel_slow_receiver>:
void *channel_slow_receiver(void *arg) {
     7f0:	55                   	push   %ebp
     7f1:	89 e5                	mov    %esp,%ebp
     7f3:	57                   	push   %edi
     7f4:	56                   	push   %esi
     7f5:	8d 75 e4             	lea    -0x1c(%ebp),%esi
     7f8:	53                   	push   %ebx
     7f9:	bb 08 00 00 00       	mov    $0x8,%ebx
     7fe:	83 ec 1c             	sub    $0x1c,%esp
     801:	8b 7d 08             	mov    0x8(%ebp),%edi
    for (i = 0; i < 8; i++) {
     804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        thread_yield();
     808:	e8 c3 14 00 00       	call   1cd0 <thread_yield>
        thread_yield();
     80d:	e8 be 14 00 00       	call   1cd0 <thread_yield>
        channel_recv(ch, &data);
     812:	83 ec 08             	sub    $0x8,%esp
     815:	56                   	push   %esi
     816:	57                   	push   %edi
     817:	e8 d4 19 00 00       	call   21f0 <channel_recv>
        printf(1, "  [SlowRecv] Received %d\n", (int)data);
     81c:	83 c4 0c             	add    $0xc,%esp
     81f:	ff 75 e4             	push   -0x1c(%ebp)
     822:	68 4a 25 00 00       	push   $0x254a
     827:	6a 01                	push   $0x1
     829:	e8 a2 0d 00 00       	call   15d0 <printf>
    for (i = 0; i < 8; i++) {
     82e:	83 c4 10             	add    $0x10,%esp
     831:	83 eb 01             	sub    $0x1,%ebx
     834:	75 d2                	jne    808 <channel_slow_receiver+0x18>
}
     836:	8d 65 f4             	lea    -0xc(%ebp),%esp
     839:	31 c0                	xor    %eax,%eax
     83b:	5b                   	pop    %ebx
     83c:	5e                   	pop    %esi
     83d:	5f                   	pop    %edi
     83e:	5d                   	pop    %ebp
     83f:	c3                   	ret

00000840 <multi_consumer>:
void *multi_consumer(void *arg) {
     840:	55                   	push   %ebp
     841:	89 e5                	mov    %esp,%ebp
     843:	57                   	push   %edi
    int id = thread_self();
     844:	bf 03 00 00 00       	mov    $0x3,%edi
void *multi_consumer(void *arg) {
     849:	56                   	push   %esi
     84a:	8d 75 e4             	lea    -0x1c(%ebp),%esi
     84d:	53                   	push   %ebx
     84e:	83 ec 1c             	sub    $0x1c,%esp
    int id = thread_self();
     851:	e8 2a 12 00 00       	call   1a80 <thread_self>
     856:	89 c3                	mov    %eax,%ebx
        channel_recv(ch, &msg);
     858:	83 ec 08             	sub    $0x8,%esp
     85b:	56                   	push   %esi
     85c:	ff 75 08             	push   0x8(%ebp)
     85f:	e8 8c 19 00 00       	call   21f0 <channel_recv>
        printf(1, "  [Consumer%d] Receive: %d\n", id, (int)msg);
     864:	ff 75 e4             	push   -0x1c(%ebp)
     867:	53                   	push   %ebx
     868:	68 64 25 00 00       	push   $0x2564
     86d:	6a 01                	push   $0x1
     86f:	e8 5c 0d 00 00       	call   15d0 <printf>
        thread_yield();
     874:	83 c4 20             	add    $0x20,%esp
     877:	e8 54 14 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 3; i++) {
     87c:	83 ef 01             	sub    $0x1,%edi
     87f:	75 d7                	jne    858 <multi_consumer+0x18>
}
     881:	8d 65 f4             	lea    -0xc(%ebp),%esp
     884:	31 c0                	xor    %eax,%eax
     886:	5b                   	pop    %ebx
     887:	5e                   	pop    %esi
     888:	5f                   	pop    %edi
     889:	5d                   	pop    %ebp
     88a:	c3                   	ret
     88b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000890 <channel_receiver>:
void *channel_receiver(void *arg) {
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	8d 75 e4             	lea    -0x1c(%ebp),%esi
     898:	53                   	push   %ebx
     899:	bb 05 00 00 00       	mov    $0x5,%ebx
     89e:	83 ec 1c             	sub    $0x1c,%esp
     8a1:	8b 7d 08             	mov    0x8(%ebp),%edi
    for (i = 0; i < 5; i++) {
     8a4:	eb 14                	jmp    8ba <channel_receiver+0x2a>
     8a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8ad:	00 
     8ae:	66 90                	xchg   %ax,%ax
        thread_yield();
     8b0:	e8 1b 14 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 5; i++) {
     8b5:	83 eb 01             	sub    $0x1,%ebx
     8b8:	74 3b                	je     8f5 <channel_receiver+0x65>
        int ret = channel_recv(ch, &data);
     8ba:	83 ec 08             	sub    $0x8,%esp
     8bd:	56                   	push   %esi
     8be:	57                   	push   %edi
     8bf:	e8 2c 19 00 00       	call   21f0 <channel_recv>
        if (ret == 0) {
     8c4:	83 c4 10             	add    $0x10,%esp
     8c7:	85 c0                	test   %eax,%eax
     8c9:	75 e5                	jne    8b0 <channel_receiver+0x20>
            printf(1, "  [Receiver] Receive: %d\n", *(int*)data);
     8cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8ce:	83 ec 04             	sub    $0x4,%esp
     8d1:	ff 30                	push   (%eax)
     8d3:	68 80 25 00 00       	push   $0x2580
     8d8:	6a 01                	push   $0x1
     8da:	e8 f1 0c 00 00       	call   15d0 <printf>
            free(data);
     8df:	58                   	pop    %eax
     8e0:	ff 75 e4             	push   -0x1c(%ebp)
     8e3:	e8 78 0e 00 00       	call   1760 <free>
     8e8:	83 c4 10             	add    $0x10,%esp
        thread_yield();
     8eb:	e8 e0 13 00 00       	call   1cd0 <thread_yield>
    for (i = 0; i < 5; i++) {
     8f0:	83 eb 01             	sub    $0x1,%ebx
     8f3:	75 c5                	jne    8ba <channel_receiver+0x2a>
}
     8f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8f8:	31 c0                	xor    %eax,%eax
     8fa:	5b                   	pop    %ebx
     8fb:	5e                   	pop    %esi
     8fc:	5f                   	pop    %edi
     8fd:	5d                   	pop    %ebp
     8fe:	c3                   	ret
     8ff:	90                   	nop

00000900 <test_basic_create_exit>:
void test_basic_create_exit(void) {
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 24             	sub    $0x24,%esp
    printf(1, "\n[Test 1.1] Basic Thread Creation and Exit\n");
     909:	68 5c 28 00 00       	push   $0x285c
     90e:	6a 01                	push   $0x1
     910:	e8 bb 0c 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     915:	58                   	pop    %eax
     916:	5a                   	pop    %edx
     917:	68 88 28 00 00       	push   $0x2888
     91c:	6a 01                	push   $0x1
     91e:	e8 ad 0c 00 00       	call   15d0 <printf>
    int tid1 = thread_create(basic_thread, (void*)1);
     923:	59                   	pop    %ecx
     924:	5b                   	pop    %ebx
     925:	6a 01                	push   $0x1
     927:	68 d0 02 00 00       	push   $0x2d0
     92c:	e8 3f 10 00 00       	call   1970 <thread_create>
    int tid2 = thread_create(basic_thread, (void*)2);
     931:	5e                   	pop    %esi
     932:	5f                   	pop    %edi
     933:	6a 02                	push   $0x2
     935:	68 d0 02 00 00       	push   $0x2d0
    int tid1 = thread_create(basic_thread, (void*)1);
     93a:	89 c3                	mov    %eax,%ebx
    int tid2 = thread_create(basic_thread, (void*)2);
     93c:	e8 2f 10 00 00       	call   1970 <thread_create>
    printf(1, "Created 2 threads: tid=%d, tid=%d\n", tid1, tid2);
     941:	50                   	push   %eax
    int tid2 = thread_create(basic_thread, (void*)2);
     942:	89 c7                	mov    %eax,%edi
    printf(1, "Created 2 threads: tid=%d, tid=%d\n", tid1, tid2);
     944:	53                   	push   %ebx
     945:	68 b8 28 00 00       	push   $0x28b8
     94a:	6a 01                	push   $0x1
     94c:	e8 7f 0c 00 00       	call   15d0 <printf>
    void *ret1 = thread_join(tid1);
     951:	83 c4 14             	add    $0x14,%esp
     954:	53                   	push   %ebx
     955:	e8 96 12 00 00       	call   1bf0 <thread_join>
    void *ret2 = thread_join(tid2);
     95a:	89 3c 24             	mov    %edi,(%esp)
    void *ret1 = thread_join(tid1);
     95d:	89 c6                	mov    %eax,%esi
    void *ret2 = thread_join(tid2);
     95f:	e8 8c 12 00 00       	call   1bf0 <thread_join>
     964:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    printf(1, "Thread %d return value: %d (expected: 10)\n", tid1, (int)ret1);
     967:	56                   	push   %esi
     968:	53                   	push   %ebx
     969:	68 dc 28 00 00       	push   $0x28dc
     96e:	6a 01                	push   $0x1
     970:	e8 5b 0c 00 00       	call   15d0 <printf>
    printf(1, "Thread %d return value: %d (expected: 20)\n", tid2, (int)ret2);
     975:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
     978:	83 c4 20             	add    $0x20,%esp
     97b:	53                   	push   %ebx
     97c:	57                   	push   %edi
     97d:	68 08 29 00 00       	push   $0x2908
     982:	6a 01                	push   $0x1
     984:	e8 47 0c 00 00       	call   15d0 <printf>
    if ((int)ret1 == 10 && (int)ret2 == 20) {
     989:	83 c4 10             	add    $0x10,%esp
     98c:	83 fe 0a             	cmp    $0xa,%esi
     98f:	75 1f                	jne    9b0 <test_basic_create_exit+0xb0>
     991:	83 fb 14             	cmp    $0x14,%ebx
     994:	75 1a                	jne    9b0 <test_basic_create_exit+0xb0>
        printf(1, "PASS Test passed\n");
     996:	83 ec 08             	sub    $0x8,%esp
     999:	68 9a 25 00 00       	push   $0x259a
     99e:	6a 01                	push   $0x1
     9a0:	e8 2b 0c 00 00       	call   15d0 <printf>
     9a5:	83 c4 10             	add    $0x10,%esp
}
     9a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9ab:	5b                   	pop    %ebx
     9ac:	5e                   	pop    %esi
     9ad:	5f                   	pop    %edi
     9ae:	5d                   	pop    %ebp
     9af:	c3                   	ret
        printf(1, "FAIL Test failed\n");
     9b0:	83 ec 08             	sub    $0x8,%esp
     9b3:	68 ac 25 00 00       	push   $0x25ac
     9b8:	6a 01                	push   $0x1
     9ba:	e8 11 0c 00 00       	call   15d0 <printf>
     9bf:	83 c4 10             	add    $0x10,%esp
}
     9c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c5:	5b                   	pop    %ebx
     9c6:	5e                   	pop    %esi
     9c7:	5f                   	pop    %edi
     9c8:	5d                   	pop    %ebp
     9c9:	c3                   	ret
     9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009d0 <test_yield_scheduling>:
void test_yield_scheduling(void) {
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	57                   	push   %edi
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	83 ec 14             	sub    $0x14,%esp
    printf(1, "\n[Test 1.2] Thread Yield and Round-Robin Scheduling\n");
     9d9:	68 34 29 00 00       	push   $0x2934
     9de:	6a 01                	push   $0x1
     9e0:	e8 eb 0b 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     9e5:	58                   	pop    %eax
     9e6:	5a                   	pop    %edx
     9e7:	68 88 28 00 00       	push   $0x2888
     9ec:	6a 01                	push   $0x1
     9ee:	e8 dd 0b 00 00       	call   15d0 <printf>
    printf(1, "Expected: Threads should alternate (Round-Robin)\n\n");
     9f3:	59                   	pop    %ecx
     9f4:	5b                   	pop    %ebx
     9f5:	68 6c 29 00 00       	push   $0x296c
     9fa:	6a 01                	push   $0x1
     9fc:	e8 cf 0b 00 00       	call   15d0 <printf>
    int tid1 = thread_create(yield_thread, (void*)1);
     a01:	5e                   	pop    %esi
     a02:	5f                   	pop    %edi
     a03:	6a 01                	push   $0x1
     a05:	68 30 03 00 00       	push   $0x330
     a0a:	e8 61 0f 00 00       	call   1970 <thread_create>
     a0f:	89 c7                	mov    %eax,%edi
    int tid2 = thread_create(yield_thread, (void*)2);
     a11:	58                   	pop    %eax
     a12:	5a                   	pop    %edx
     a13:	6a 02                	push   $0x2
     a15:	68 30 03 00 00       	push   $0x330
     a1a:	e8 51 0f 00 00       	call   1970 <thread_create>
    int tid3 = thread_create(yield_thread, (void*)3);
     a1f:	59                   	pop    %ecx
     a20:	5b                   	pop    %ebx
     a21:	6a 03                	push   $0x3
     a23:	68 30 03 00 00       	push   $0x330
    int tid2 = thread_create(yield_thread, (void*)2);
     a28:	89 c6                	mov    %eax,%esi
    int tid3 = thread_create(yield_thread, (void*)3);
     a2a:	e8 41 0f 00 00       	call   1970 <thread_create>
    thread_join(tid1);
     a2f:	89 3c 24             	mov    %edi,(%esp)
    int tid3 = thread_create(yield_thread, (void*)3);
     a32:	89 c3                	mov    %eax,%ebx
    thread_join(tid1);
     a34:	e8 b7 11 00 00       	call   1bf0 <thread_join>
    thread_join(tid2);
     a39:	89 34 24             	mov    %esi,(%esp)
     a3c:	e8 af 11 00 00       	call   1bf0 <thread_join>
    thread_join(tid3);
     a41:	89 1c 24             	mov    %ebx,(%esp)
     a44:	e8 a7 11 00 00       	call   1bf0 <thread_join>
    printf(1, "PASS Test completed (verify scheduling order from output)\n");
     a49:	5e                   	pop    %esi
     a4a:	5f                   	pop    %edi
     a4b:	68 a0 29 00 00       	push   $0x29a0
     a50:	6a 01                	push   $0x1
     a52:	e8 79 0b 00 00       	call   15d0 <printf>
}
     a57:	83 c4 10             	add    $0x10,%esp
     a5a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a5d:	5b                   	pop    %ebx
     a5e:	5e                   	pop    %esi
     a5f:	5f                   	pop    %edi
     a60:	5d                   	pop    %ebp
     a61:	c3                   	ret
     a62:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     a69:	00 
     a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a70 <test_many_threads>:
void test_many_threads(void) {
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	57                   	push   %edi
     a74:	56                   	push   %esi
     a75:	53                   	push   %ebx
    for (i = 0; i < 10; i++) {
     a76:	31 db                	xor    %ebx,%ebx
void test_many_threads(void) {
     a78:	83 ec 44             	sub    $0x44,%esp
    printf(1, "\n[Test 1.3] Multiple Threads Creation Stress Test\n");
     a7b:	68 dc 29 00 00       	push   $0x29dc
     a80:	6a 01                	push   $0x1
     a82:	e8 49 0b 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     a87:	58                   	pop    %eax
     a88:	5a                   	pop    %edx
     a89:	68 88 28 00 00       	push   $0x2888
     a8e:	6a 01                	push   $0x1
     a90:	e8 3b 0b 00 00       	call   15d0 <printf>
     a95:	83 c4 10             	add    $0x10,%esp
     a98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     a9f:	00 
        tids[i] = thread_create(stress_thread, (void*)i);
     aa0:	83 ec 08             	sub    $0x8,%esp
     aa3:	53                   	push   %ebx
     aa4:	68 10 03 00 00       	push   $0x310
     aa9:	e8 c2 0e 00 00       	call   1970 <thread_create>
    for (i = 0; i < 10; i++) {
     aae:	83 c4 10             	add    $0x10,%esp
        tids[i] = thread_create(stress_thread, (void*)i);
     ab1:	89 44 9d c0          	mov    %eax,-0x40(%ebp,%ebx,4)
    for (i = 0; i < 10; i++) {
     ab5:	83 c3 01             	add    $0x1,%ebx
     ab8:	83 fb 0a             	cmp    $0xa,%ebx
     abb:	75 e3                	jne    aa0 <test_many_threads+0x30>
    printf(1, "Successfully created 10 threads\n");
     abd:	83 ec 08             	sub    $0x8,%esp
     ac0:	8d 5d c0             	lea    -0x40(%ebp),%ebx
     ac3:	8d 7d e8             	lea    -0x18(%ebp),%edi
     ac6:	68 10 2a 00 00       	push   $0x2a10
     acb:	6a 01                	push   $0x1
     acd:	e8 fe 0a 00 00       	call   15d0 <printf>
    for (i = 0; i < 10; i++) {
     ad2:	83 c4 10             	add    $0x10,%esp
     ad5:	8d 76 00             	lea    0x0(%esi),%esi
        void *ret = thread_join(tids[i]);
     ad8:	8b 33                	mov    (%ebx),%esi
     ada:	83 ec 0c             	sub    $0xc,%esp
    for (i = 0; i < 10; i++) {
     add:	83 c3 04             	add    $0x4,%ebx
        void *ret = thread_join(tids[i]);
     ae0:	56                   	push   %esi
     ae1:	e8 0a 11 00 00       	call   1bf0 <thread_join>
        printf(1, "  Thread %d returned: %d\n", tids[i], (int)ret);
     ae6:	50                   	push   %eax
     ae7:	56                   	push   %esi
     ae8:	68 be 25 00 00       	push   $0x25be
     aed:	6a 01                	push   $0x1
     aef:	e8 dc 0a 00 00       	call   15d0 <printf>
    for (i = 0; i < 10; i++) {
     af4:	83 c4 20             	add    $0x20,%esp
     af7:	39 fb                	cmp    %edi,%ebx
     af9:	75 dd                	jne    ad8 <test_many_threads+0x68>
    printf(1, "PASS Test passed\n");
     afb:	83 ec 08             	sub    $0x8,%esp
     afe:	68 9a 25 00 00       	push   $0x259a
     b03:	6a 01                	push   $0x1
     b05:	e8 c6 0a 00 00       	call   15d0 <printf>
}
     b0a:	83 c4 10             	add    $0x10,%esp
     b0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b10:	5b                   	pop    %ebx
     b11:	5e                   	pop    %esi
     b12:	5f                   	pop    %edi
     b13:	5d                   	pop    %ebp
     b14:	c3                   	ret
     b15:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     b1c:	00 
     b1d:	8d 76 00             	lea    0x0(%esi),%esi

00000b20 <test_context_switch>:
void test_context_switch(void) {
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	56                   	push   %esi
     b24:	53                   	push   %ebx
    printf(1, "\n[Test 1.4] Context Switch Correctness\n");
     b25:	83 ec 08             	sub    $0x8,%esp
     b28:	68 34 2a 00 00       	push   $0x2a34
     b2d:	6a 01                	push   $0x1
     b2f:	e8 9c 0a 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     b34:	58                   	pop    %eax
     b35:	5a                   	pop    %edx
     b36:	68 88 28 00 00       	push   $0x2888
     b3b:	6a 01                	push   $0x1
     b3d:	e8 8e 0a 00 00       	call   15d0 <printf>
    printf(1, "Test: Two threads increment different variables, verify context save\n");
     b42:	59                   	pop    %ecx
     b43:	5b                   	pop    %ebx
     b44:	68 5c 2a 00 00       	push   $0x2a5c
     b49:	6a 01                	push   $0x1
     b4b:	e8 80 0a 00 00       	call   15d0 <printf>
    ctx_var1 = 0;
     b50:	c7 05 18 43 00 00 00 	movl   $0x0,0x4318
     b57:	00 00 00 
    ctx_var2 = 0;
     b5a:	c7 05 14 43 00 00 00 	movl   $0x0,0x4314
     b61:	00 00 00 
    int tid1 = thread_create(context_thread1, (void*)0);
     b64:	5e                   	pop    %esi
     b65:	58                   	pop    %eax
     b66:	6a 00                	push   $0x0
     b68:	68 70 03 00 00       	push   $0x370
     b6d:	e8 fe 0d 00 00       	call   1970 <thread_create>
     b72:	89 c6                	mov    %eax,%esi
    int tid2 = thread_create(context_thread2, (void*)0);
     b74:	58                   	pop    %eax
     b75:	5a                   	pop    %edx
     b76:	6a 00                	push   $0x0
     b78:	68 a0 03 00 00       	push   $0x3a0
     b7d:	e8 ee 0d 00 00       	call   1970 <thread_create>
    thread_join(tid1);
     b82:	89 34 24             	mov    %esi,(%esp)
    int tid2 = thread_create(context_thread2, (void*)0);
     b85:	89 c3                	mov    %eax,%ebx
    thread_join(tid1);
     b87:	e8 64 10 00 00       	call   1bf0 <thread_join>
    thread_join(tid2);
     b8c:	89 1c 24             	mov    %ebx,(%esp)
     b8f:	e8 5c 10 00 00       	call   1bf0 <thread_join>
    printf(1, "ctx_var1 = %d (expected: 100)\n", ctx_var1);
     b94:	83 c4 0c             	add    $0xc,%esp
     b97:	ff 35 18 43 00 00    	push   0x4318
     b9d:	68 a4 2a 00 00       	push   $0x2aa4
     ba2:	6a 01                	push   $0x1
     ba4:	e8 27 0a 00 00       	call   15d0 <printf>
    printf(1, "ctx_var2 = %d (expected: 100)\n", ctx_var2);
     ba9:	83 c4 0c             	add    $0xc,%esp
     bac:	ff 35 14 43 00 00    	push   0x4314
     bb2:	68 c4 2a 00 00       	push   $0x2ac4
     bb7:	6a 01                	push   $0x1
     bb9:	e8 12 0a 00 00       	call   15d0 <printf>
    if (ctx_var1 == 100 && ctx_var2 == 100) {
     bbe:	83 c4 10             	add    $0x10,%esp
     bc1:	83 3d 18 43 00 00 64 	cmpl   $0x64,0x4318
     bc8:	75 09                	jne    bd3 <test_context_switch+0xb3>
     bca:	83 3d 14 43 00 00 64 	cmpl   $0x64,0x4314
     bd1:	74 1d                	je     bf0 <test_context_switch+0xd0>
        printf(1, "FAIL Context switch error\n");
     bd3:	83 ec 08             	sub    $0x8,%esp
     bd6:	68 f5 25 00 00       	push   $0x25f5
     bdb:	6a 01                	push   $0x1
     bdd:	e8 ee 09 00 00       	call   15d0 <printf>
     be2:	83 c4 10             	add    $0x10,%esp
}
     be5:	8d 65 f8             	lea    -0x8(%ebp),%esp
     be8:	5b                   	pop    %ebx
     be9:	5e                   	pop    %esi
     bea:	5d                   	pop    %ebp
     beb:	c3                   	ret
     bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "PASS Context switch correct\n");
     bf0:	83 ec 08             	sub    $0x8,%esp
     bf3:	68 d8 25 00 00       	push   $0x25d8
     bf8:	6a 01                	push   $0x1
     bfa:	e8 d1 09 00 00       	call   15d0 <printf>
     bff:	83 c4 10             	add    $0x10,%esp
}
     c02:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c05:	5b                   	pop    %ebx
     c06:	5e                   	pop    %esi
     c07:	5d                   	pop    %ebp
     c08:	c3                   	ret
     c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c10 <test_thread_self>:
void test_thread_self(void) {
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\n[Test 1.5] Thread Self Function\n");
     c16:	68 e4 2a 00 00       	push   $0x2ae4
     c1b:	6a 01                	push   $0x1
     c1d:	e8 ae 09 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     c22:	58                   	pop    %eax
     c23:	5a                   	pop    %edx
     c24:	68 88 28 00 00       	push   $0x2888
     c29:	6a 01                	push   $0x1
     c2b:	e8 a0 09 00 00       	call   15d0 <printf>
    int tid1 = thread_create(self_thread, (void*)0);
     c30:	59                   	pop    %ecx
     c31:	58                   	pop    %eax
     c32:	6a 00                	push   $0x0
     c34:	68 d0 03 00 00       	push   $0x3d0
     c39:	e8 32 0d 00 00       	call   1970 <thread_create>
    thread_join(tid1);
     c3e:	89 04 24             	mov    %eax,(%esp)
     c41:	e8 aa 0f 00 00       	call   1bf0 <thread_join>
    printf(1, "PASS Thread Self test completed\n");
     c46:	58                   	pop    %eax
     c47:	5a                   	pop    %edx
     c48:	68 08 2b 00 00       	push   $0x2b08
     c4d:	6a 01                	push   $0x1
     c4f:	e8 7c 09 00 00       	call   15d0 <printf>
}
     c54:	83 c4 10             	add    $0x10,%esp
     c57:	c9                   	leave
     c58:	c3                   	ret
     c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c60 <test_mutex_basic>:
void test_mutex_basic(void) {
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	56                   	push   %esi
     c64:	53                   	push   %ebx
    printf(1, "\n[Test 2.1] Mutex Basic Lock/Unlock\n");
     c65:	83 ec 08             	sub    $0x8,%esp
     c68:	68 2c 2b 00 00       	push   $0x2b2c
     c6d:	6a 01                	push   $0x1
     c6f:	e8 5c 09 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     c74:	58                   	pop    %eax
     c75:	5a                   	pop    %edx
     c76:	68 88 28 00 00       	push   $0x2888
     c7b:	6a 01                	push   $0x1
     c7d:	e8 4e 09 00 00       	call   15d0 <printf>
    mutex_init(&test_mutex);
     c82:	c7 04 24 08 43 00 00 	movl   $0x4308,(%esp)
     c89:	e8 c2 10 00 00       	call   1d50 <mutex_init>
    protected_counter = 0;
     c8e:	c7 05 04 43 00 00 00 	movl   $0x0,0x4304
     c95:	00 00 00 
    int tid1 = thread_create(mutex_inc_thread, (void*)5);
     c98:	59                   	pop    %ecx
     c99:	5b                   	pop    %ebx
     c9a:	6a 05                	push   $0x5
     c9c:	68 00 04 00 00       	push   $0x400
     ca1:	e8 ca 0c 00 00       	call   1970 <thread_create>
     ca6:	89 c6                	mov    %eax,%esi
    int tid2 = thread_create(mutex_inc_thread, (void*)5);
     ca8:	58                   	pop    %eax
     ca9:	5a                   	pop    %edx
     caa:	6a 05                	push   $0x5
     cac:	68 00 04 00 00       	push   $0x400
     cb1:	e8 ba 0c 00 00       	call   1970 <thread_create>
    thread_join(tid1);
     cb6:	89 34 24             	mov    %esi,(%esp)
    int tid2 = thread_create(mutex_inc_thread, (void*)5);
     cb9:	89 c3                	mov    %eax,%ebx
    thread_join(tid1);
     cbb:	e8 30 0f 00 00       	call   1bf0 <thread_join>
    thread_join(tid2);
     cc0:	89 1c 24             	mov    %ebx,(%esp)
     cc3:	e8 28 0f 00 00       	call   1bf0 <thread_join>
    printf(1, "Final counter = %d (expected: 10)\n", protected_counter);
     cc8:	83 c4 0c             	add    $0xc,%esp
     ccb:	ff 35 04 43 00 00    	push   0x4304
     cd1:	68 54 2b 00 00       	push   $0x2b54
     cd6:	6a 01                	push   $0x1
     cd8:	e8 f3 08 00 00       	call   15d0 <printf>
    if (protected_counter == 10) {
     cdd:	83 c4 10             	add    $0x10,%esp
     ce0:	83 3d 04 43 00 00 0a 	cmpl   $0xa,0x4304
     ce7:	74 1f                	je     d08 <test_mutex_basic+0xa8>
        printf(1, "FAIL Mutex failed to protect critical section\n");
     ce9:	83 ec 08             	sub    $0x8,%esp
     cec:	68 ac 2b 00 00       	push   $0x2bac
     cf1:	6a 01                	push   $0x1
     cf3:	e8 d8 08 00 00       	call   15d0 <printf>
     cf8:	83 c4 10             	add    $0x10,%esp
}
     cfb:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cfe:	5b                   	pop    %ebx
     cff:	5e                   	pop    %esi
     d00:	5d                   	pop    %ebp
     d01:	c3                   	ret
     d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, "PASS Mutex correctly protected critical section\n");
     d08:	83 ec 08             	sub    $0x8,%esp
     d0b:	68 78 2b 00 00       	push   $0x2b78
     d10:	6a 01                	push   $0x1
     d12:	e8 b9 08 00 00       	call   15d0 <printf>
     d17:	83 c4 10             	add    $0x10,%esp
}
     d1a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d1d:	5b                   	pop    %ebx
     d1e:	5e                   	pop    %esi
     d1f:	5d                   	pop    %ebp
     d20:	c3                   	ret
     d21:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d28:	00 
     d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d30 <test_mutex_trylock>:
void test_mutex_trylock(void) {
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	56                   	push   %esi
     d34:	53                   	push   %ebx
    printf(1, "\n[Test 2.2] Mutex Trylock Function\n");
     d35:	83 ec 08             	sub    $0x8,%esp
     d38:	68 dc 2b 00 00       	push   $0x2bdc
     d3d:	6a 01                	push   $0x1
     d3f:	e8 8c 08 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     d44:	58                   	pop    %eax
     d45:	5a                   	pop    %edx
     d46:	68 88 28 00 00       	push   $0x2888
     d4b:	6a 01                	push   $0x1
     d4d:	e8 7e 08 00 00       	call   15d0 <printf>
    mutex_init(&test_mutex);
     d52:	c7 04 24 08 43 00 00 	movl   $0x4308,(%esp)
     d59:	e8 f2 0f 00 00       	call   1d50 <mutex_init>
    protected_counter = 0;
     d5e:	c7 05 04 43 00 00 00 	movl   $0x0,0x4304
     d65:	00 00 00 
    int tid1 = thread_create(trylock_thread, (void*)0);
     d68:	59                   	pop    %ecx
     d69:	5b                   	pop    %ebx
     d6a:	6a 00                	push   $0x0
     d6c:	68 70 04 00 00       	push   $0x470
     d71:	e8 fa 0b 00 00       	call   1970 <thread_create>
     d76:	89 c6                	mov    %eax,%esi
    int tid2 = thread_create(trylock_thread, (void*)0);
     d78:	58                   	pop    %eax
     d79:	5a                   	pop    %edx
     d7a:	6a 00                	push   $0x0
     d7c:	68 70 04 00 00       	push   $0x470
     d81:	e8 ea 0b 00 00       	call   1970 <thread_create>
    thread_join(tid1);
     d86:	89 34 24             	mov    %esi,(%esp)
    int tid2 = thread_create(trylock_thread, (void*)0);
     d89:	89 c3                	mov    %eax,%ebx
    thread_join(tid1);
     d8b:	e8 60 0e 00 00       	call   1bf0 <thread_join>
    thread_join(tid2);
     d90:	89 1c 24             	mov    %ebx,(%esp)
     d93:	e8 58 0e 00 00       	call   1bf0 <thread_join>
    printf(1, "PASS Trylock test completed\n");
     d98:	59                   	pop    %ecx
     d99:	5b                   	pop    %ebx
     d9a:	68 10 26 00 00       	push   $0x2610
     d9f:	6a 01                	push   $0x1
     da1:	e8 2a 08 00 00       	call   15d0 <printf>
}
     da6:	83 c4 10             	add    $0x10,%esp
     da9:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dac:	5b                   	pop    %ebx
     dad:	5e                   	pop    %esi
     dae:	5d                   	pop    %ebp
     daf:	c3                   	ret

00000db0 <test_condition_variable>:
void test_condition_variable(void) {
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	57                   	push   %edi
     db4:	56                   	push   %esi
     db5:	53                   	push   %ebx
     db6:	83 ec 24             	sub    $0x24,%esp
    printf(1, "\n[Test 2.3] Condition Variable - Producer Consumer\n");
     db9:	68 00 2c 00 00       	push   $0x2c00
     dbe:	6a 01                	push   $0x1
     dc0:	e8 0b 08 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     dc5:	58                   	pop    %eax
     dc6:	5a                   	pop    %edx
     dc7:	68 88 28 00 00       	push   $0x2888
     dcc:	6a 01                	push   $0x1
     dce:	e8 fd 07 00 00       	call   15d0 <printf>
    mutex_init(&pc_mutex);
     dd3:	c7 04 24 e0 42 00 00 	movl   $0x42e0,(%esp)
     dda:	e8 71 0f 00 00       	call   1d50 <mutex_init>
    cond_init(&not_empty);
     ddf:	c7 04 24 dc 42 00 00 	movl   $0x42dc,(%esp)
     de6:	e8 55 10 00 00       	call   1e40 <cond_init>
    cond_init(&not_full);
     deb:	c7 04 24 d8 42 00 00 	movl   $0x42d8,(%esp)
     df2:	e8 49 10 00 00       	call   1e40 <cond_init>
    count = 0;
     df7:	c7 05 ec 42 00 00 00 	movl   $0x0,0x42ec
     dfe:	00 00 00 
    int prod1 = thread_create(producer_thread, (void*)1);
     e01:	59                   	pop    %ecx
     e02:	5b                   	pop    %ebx
     e03:	6a 01                	push   $0x1
     e05:	68 80 05 00 00       	push   $0x580
     e0a:	e8 61 0b 00 00       	call   1970 <thread_create>
     e0f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    int cons1 = thread_create(consumer_thread, (void*)1);
     e12:	5e                   	pop    %esi
     e13:	5f                   	pop    %edi
     e14:	6a 01                	push   $0x1
     e16:	68 40 06 00 00       	push   $0x640
     e1b:	e8 50 0b 00 00       	call   1970 <thread_create>
     e20:	89 c6                	mov    %eax,%esi
    int prod2 = thread_create(producer_thread, (void*)2);
     e22:	58                   	pop    %eax
     e23:	5a                   	pop    %edx
     e24:	6a 02                	push   $0x2
     e26:	68 80 05 00 00       	push   $0x580
     e2b:	e8 40 0b 00 00       	call   1970 <thread_create>
    int cons2 = thread_create(consumer_thread, (void*)2);
     e30:	59                   	pop    %ecx
     e31:	5b                   	pop    %ebx
     e32:	6a 02                	push   $0x2
     e34:	68 40 06 00 00       	push   $0x640
    int prod2 = thread_create(producer_thread, (void*)2);
     e39:	89 c7                	mov    %eax,%edi
    int cons2 = thread_create(consumer_thread, (void*)2);
     e3b:	e8 30 0b 00 00       	call   1970 <thread_create>
    thread_join(prod1);
     e40:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    int cons2 = thread_create(consumer_thread, (void*)2);
     e43:	89 c3                	mov    %eax,%ebx
    thread_join(prod1);
     e45:	89 14 24             	mov    %edx,(%esp)
     e48:	e8 a3 0d 00 00       	call   1bf0 <thread_join>
    thread_join(prod2);
     e4d:	89 3c 24             	mov    %edi,(%esp)
     e50:	e8 9b 0d 00 00       	call   1bf0 <thread_join>
    thread_join(cons1);
     e55:	89 34 24             	mov    %esi,(%esp)
     e58:	e8 93 0d 00 00       	call   1bf0 <thread_join>
    thread_join(cons2);
     e5d:	89 1c 24             	mov    %ebx,(%esp)
     e60:	e8 8b 0d 00 00       	call   1bf0 <thread_join>
    printf(1, "Final count = %d (expected: 0)\n", count);
     e65:	83 c4 0c             	add    $0xc,%esp
     e68:	ff 35 ec 42 00 00    	push   0x42ec
     e6e:	68 34 2c 00 00       	push   $0x2c34
     e73:	6a 01                	push   $0x1
     e75:	e8 56 07 00 00       	call   15d0 <printf>
    printf(1, "PASS Condition variable test completed\n");
     e7a:	5e                   	pop    %esi
     e7b:	5f                   	pop    %edi
     e7c:	68 54 2c 00 00       	push   $0x2c54
     e81:	6a 01                	push   $0x1
     e83:	e8 48 07 00 00       	call   15d0 <printf>
}
     e88:	83 c4 10             	add    $0x10,%esp
     e8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e8e:	5b                   	pop    %ebx
     e8f:	5e                   	pop    %esi
     e90:	5f                   	pop    %edi
     e91:	5d                   	pop    %ebp
     e92:	c3                   	ret
     e93:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e9a:	00 
     e9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000ea0 <test_cond_broadcast>:
void test_cond_broadcast(void) {
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	57                   	push   %edi
     ea4:	56                   	push   %esi
     ea5:	53                   	push   %ebx
     ea6:	83 ec 24             	sub    $0x24,%esp
    printf(1, "\n[Test 2.4] Condition Variable Broadcast\n");
     ea9:	68 7c 2c 00 00       	push   $0x2c7c
     eae:	6a 01                	push   $0x1
     eb0:	e8 1b 07 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     eb5:	58                   	pop    %eax
     eb6:	5a                   	pop    %edx
     eb7:	68 88 28 00 00       	push   $0x2888
     ebc:	6a 01                	push   $0x1
     ebe:	e8 0d 07 00 00       	call   15d0 <printf>
    mutex_init(&broadcast_mutex);
     ec3:	c7 04 24 c8 42 00 00 	movl   $0x42c8,(%esp)
     eca:	e8 81 0e 00 00       	call   1d50 <mutex_init>
    cond_init(&broadcast_cond);
     ecf:	c7 04 24 d4 42 00 00 	movl   $0x42d4,(%esp)
     ed6:	e8 65 0f 00 00       	call   1e40 <cond_init>
    broadcast_ready = 0;
     edb:	c7 05 c4 42 00 00 00 	movl   $0x0,0x42c4
     ee2:	00 00 00 
    wakeup_count = 0;
     ee5:	c7 05 c0 42 00 00 00 	movl   $0x0,0x42c0
     eec:	00 00 00 
    int tid1 = thread_create(wait_broadcast_thread, (void*)1);
     eef:	59                   	pop    %ecx
     ef0:	5b                   	pop    %ebx
     ef1:	6a 01                	push   $0x1
     ef3:	68 00 05 00 00       	push   $0x500
     ef8:	e8 73 0a 00 00       	call   1970 <thread_create>
     efd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    int tid2 = thread_create(wait_broadcast_thread, (void*)2);
     f00:	5e                   	pop    %esi
     f01:	5f                   	pop    %edi
     f02:	6a 02                	push   $0x2
     f04:	68 00 05 00 00       	push   $0x500
     f09:	e8 62 0a 00 00       	call   1970 <thread_create>
     f0e:	89 c7                	mov    %eax,%edi
    int tid3 = thread_create(wait_broadcast_thread, (void*)3);
     f10:	58                   	pop    %eax
     f11:	5a                   	pop    %edx
     f12:	6a 03                	push   $0x3
     f14:	68 00 05 00 00       	push   $0x500
     f19:	e8 52 0a 00 00       	call   1970 <thread_create>
    int tid4 = thread_create(wait_broadcast_thread, (void*)4);
     f1e:	59                   	pop    %ecx
     f1f:	5b                   	pop    %ebx
     f20:	6a 04                	push   $0x4
     f22:	68 00 05 00 00       	push   $0x500
    int tid3 = thread_create(wait_broadcast_thread, (void*)3);
     f27:	89 c6                	mov    %eax,%esi
    int tid4 = thread_create(wait_broadcast_thread, (void*)4);
     f29:	e8 42 0a 00 00       	call   1970 <thread_create>
     f2e:	89 c3                	mov    %eax,%ebx
    thread_yield();
     f30:	e8 9b 0d 00 00       	call   1cd0 <thread_yield>
    thread_yield();
     f35:	e8 96 0d 00 00       	call   1cd0 <thread_yield>
    printf(1, "  [Main] Sending broadcast signal...\n");
     f3a:	58                   	pop    %eax
     f3b:	5a                   	pop    %edx
     f3c:	68 a8 2c 00 00       	push   $0x2ca8
     f41:	6a 01                	push   $0x1
     f43:	e8 88 06 00 00       	call   15d0 <printf>
    mutex_lock(&broadcast_mutex);
     f48:	c7 04 24 c8 42 00 00 	movl   $0x42c8,(%esp)
     f4f:	e8 1c 0e 00 00       	call   1d70 <mutex_lock>
    broadcast_ready = 1;
     f54:	c7 05 c4 42 00 00 01 	movl   $0x1,0x42c4
     f5b:	00 00 00 
    cond_broadcast(&broadcast_cond);
     f5e:	c7 04 24 d4 42 00 00 	movl   $0x42d4,(%esp)
     f65:	e8 a6 0f 00 00       	call   1f10 <cond_broadcast>
    mutex_unlock(&broadcast_mutex);
     f6a:	c7 04 24 c8 42 00 00 	movl   $0x42c8,(%esp)
     f71:	e8 3a 0e 00 00       	call   1db0 <mutex_unlock>
    thread_join(tid1);
     f76:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     f79:	89 14 24             	mov    %edx,(%esp)
     f7c:	e8 6f 0c 00 00       	call   1bf0 <thread_join>
    thread_join(tid2);
     f81:	89 3c 24             	mov    %edi,(%esp)
     f84:	e8 67 0c 00 00       	call   1bf0 <thread_join>
    thread_join(tid3);
     f89:	89 34 24             	mov    %esi,(%esp)
     f8c:	e8 5f 0c 00 00       	call   1bf0 <thread_join>
    thread_join(tid4);
     f91:	89 1c 24             	mov    %ebx,(%esp)
     f94:	e8 57 0c 00 00       	call   1bf0 <thread_join>
    printf(1, "Woken threads: %d (expected: 4)\n", wakeup_count);
     f99:	83 c4 0c             	add    $0xc,%esp
     f9c:	ff 35 c0 42 00 00    	push   0x42c0
     fa2:	68 d0 2c 00 00       	push   $0x2cd0
     fa7:	6a 01                	push   $0x1
     fa9:	e8 22 06 00 00       	call   15d0 <printf>
    printf(1, "PASS Broadcast test completed\n");
     fae:	59                   	pop    %ecx
     faf:	5b                   	pop    %ebx
     fb0:	68 f4 2c 00 00       	push   $0x2cf4
     fb5:	6a 01                	push   $0x1
     fb7:	e8 14 06 00 00       	call   15d0 <printf>
}
     fbc:	83 c4 10             	add    $0x10,%esp
     fbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fc2:	5b                   	pop    %ebx
     fc3:	5e                   	pop    %esi
     fc4:	5f                   	pop    %edi
     fc5:	5d                   	pop    %ebp
     fc6:	c3                   	ret
     fc7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     fce:	00 
     fcf:	90                   	nop

00000fd0 <test_channel_basic>:
void test_channel_basic(void) {
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	57                   	push   %edi
     fd4:	56                   	push   %esi
     fd5:	53                   	push   %ebx
     fd6:	83 ec 14             	sub    $0x14,%esp
    printf(1, "\n[Test 2.5] Channel Basic Send/Receive\n");
     fd9:	68 14 2d 00 00       	push   $0x2d14
     fde:	6a 01                	push   $0x1
     fe0:	e8 eb 05 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
     fe5:	58                   	pop    %eax
     fe6:	5a                   	pop    %edx
     fe7:	68 88 28 00 00       	push   $0x2888
     fec:	6a 01                	push   $0x1
     fee:	e8 dd 05 00 00       	call   15d0 <printf>
    channel_t *ch = channel_create(3);
     ff3:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
     ffa:	e8 31 0f 00 00       	call   1f30 <channel_create>
    int sender = thread_create(channel_sender, (void*)ch);
     fff:	59                   	pop    %ecx
    1000:	5e                   	pop    %esi
    1001:	50                   	push   %eax
    channel_t *ch = channel_create(3);
    1002:	89 c3                	mov    %eax,%ebx
    int sender = thread_create(channel_sender, (void*)ch);
    1004:	68 f0 06 00 00       	push   $0x6f0
    1009:	e8 62 09 00 00       	call   1970 <thread_create>
    100e:	89 c7                	mov    %eax,%edi
    int receiver = thread_create(channel_receiver, (void*)ch);
    1010:	58                   	pop    %eax
    1011:	5a                   	pop    %edx
    1012:	53                   	push   %ebx
    1013:	68 90 08 00 00       	push   $0x890
    1018:	e8 53 09 00 00       	call   1970 <thread_create>
    thread_join(sender);
    101d:	89 3c 24             	mov    %edi,(%esp)
    int receiver = thread_create(channel_receiver, (void*)ch);
    1020:	89 c6                	mov    %eax,%esi
    thread_join(sender);
    1022:	e8 c9 0b 00 00       	call   1bf0 <thread_join>
    thread_join(receiver);
    1027:	89 34 24             	mov    %esi,(%esp)
    102a:	e8 c1 0b 00 00       	call   1bf0 <thread_join>
    channel_destroy(ch);
    102f:	89 1c 24             	mov    %ebx,(%esp)
    1032:	e8 e9 13 00 00       	call   2420 <channel_destroy>
    printf(1, "PASS Channel basic function test completed\n");
    1037:	59                   	pop    %ecx
    1038:	5b                   	pop    %ebx
    1039:	68 3c 2d 00 00       	push   $0x2d3c
    103e:	6a 01                	push   $0x1
    1040:	e8 8b 05 00 00       	call   15d0 <printf>
}
    1045:	83 c4 10             	add    $0x10,%esp
    1048:	8d 65 f4             	lea    -0xc(%ebp),%esp
    104b:	5b                   	pop    %ebx
    104c:	5e                   	pop    %esi
    104d:	5f                   	pop    %edi
    104e:	5d                   	pop    %ebp
    104f:	c3                   	ret

00001050 <test_channel_blocking>:
void test_channel_blocking(void) {
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	57                   	push   %edi
    1054:	56                   	push   %esi
    1055:	53                   	push   %ebx
    1056:	83 ec 14             	sub    $0x14,%esp
    printf(1, "\n[Test 2.6] Channel Blocking and Wakeup\n");
    1059:	68 68 2d 00 00       	push   $0x2d68
    105e:	6a 01                	push   $0x1
    1060:	e8 6b 05 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
    1065:	58                   	pop    %eax
    1066:	5a                   	pop    %edx
    1067:	68 88 28 00 00       	push   $0x2888
    106c:	6a 01                	push   $0x1
    106e:	e8 5d 05 00 00       	call   15d0 <printf>
    printf(1, "Fast sender will block when buffer is full\n\n");
    1073:	59                   	pop    %ecx
    1074:	5b                   	pop    %ebx
    1075:	68 94 2d 00 00       	push   $0x2d94
    107a:	6a 01                	push   $0x1
    107c:	e8 4f 05 00 00       	call   15d0 <printf>
    channel_t *ch = channel_create(3);
    1081:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    1088:	e8 a3 0e 00 00       	call   1f30 <channel_create>
    int sender = thread_create(channel_fast_sender, (void*)ch);
    108d:	5e                   	pop    %esi
    108e:	5f                   	pop    %edi
    108f:	50                   	push   %eax
    channel_t *ch = channel_create(3);
    1090:	89 c3                	mov    %eax,%ebx
    int sender = thread_create(channel_fast_sender, (void*)ch);
    1092:	68 50 07 00 00       	push   $0x750
    1097:	e8 d4 08 00 00       	call   1970 <thread_create>
    109c:	89 c7                	mov    %eax,%edi
    int receiver = thread_create(channel_slow_receiver, (void*)ch);
    109e:	58                   	pop    %eax
    109f:	5a                   	pop    %edx
    10a0:	53                   	push   %ebx
    10a1:	68 f0 07 00 00       	push   $0x7f0
    10a6:	e8 c5 08 00 00       	call   1970 <thread_create>
    thread_join(sender);
    10ab:	89 3c 24             	mov    %edi,(%esp)
    int receiver = thread_create(channel_slow_receiver, (void*)ch);
    10ae:	89 c6                	mov    %eax,%esi
    thread_join(sender);
    10b0:	e8 3b 0b 00 00       	call   1bf0 <thread_join>
    thread_join(receiver);
    10b5:	89 34 24             	mov    %esi,(%esp)
    10b8:	e8 33 0b 00 00       	call   1bf0 <thread_join>
    channel_destroy(ch);
    10bd:	89 1c 24             	mov    %ebx,(%esp)
    10c0:	e8 5b 13 00 00       	call   2420 <channel_destroy>
    printf(1, "PASS Channel blocking test completed\n");
    10c5:	59                   	pop    %ecx
    10c6:	5b                   	pop    %ebx
    10c7:	68 c4 2d 00 00       	push   $0x2dc4
    10cc:	6a 01                	push   $0x1
    10ce:	e8 fd 04 00 00       	call   15d0 <printf>
}
    10d3:	83 c4 10             	add    $0x10,%esp
    10d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10d9:	5b                   	pop    %ebx
    10da:	5e                   	pop    %esi
    10db:	5f                   	pop    %edi
    10dc:	5d                   	pop    %ebp
    10dd:	c3                   	ret
    10de:	66 90                	xchg   %ax,%ax

000010e0 <test_channel_multi>:
void test_channel_multi(void) {
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	56                   	push   %esi
    10e5:	53                   	push   %ebx
    10e6:	83 ec 24             	sub    $0x24,%esp
    printf(1, "\n[Test 2.7] Multiple Producer-Consumer Channel\n");
    10e9:	68 ec 2d 00 00       	push   $0x2dec
    10ee:	6a 01                	push   $0x1
    10f0:	e8 db 04 00 00       	call   15d0 <printf>
    printf(1, "----------------------------------------------\n");
    10f5:	58                   	pop    %eax
    10f6:	5a                   	pop    %edx
    10f7:	68 88 28 00 00       	push   $0x2888
    10fc:	6a 01                	push   $0x1
    10fe:	e8 cd 04 00 00       	call   15d0 <printf>
    channel_t *ch = channel_create(5);
    1103:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    110a:	e8 21 0e 00 00       	call   1f30 <channel_create>
    int p1 = thread_create(multi_producer, (void*)ch);
    110f:	59                   	pop    %ecx
    1110:	5e                   	pop    %esi
    1111:	50                   	push   %eax
    channel_t *ch = channel_create(5);
    1112:	89 c3                	mov    %eax,%ebx
    int p1 = thread_create(multi_producer, (void*)ch);
    1114:	68 a0 07 00 00       	push   $0x7a0
    1119:	e8 52 08 00 00       	call   1970 <thread_create>
    111e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    int p2 = thread_create(multi_producer, (void*)ch);
    1121:	5f                   	pop    %edi
    1122:	58                   	pop    %eax
    1123:	53                   	push   %ebx
    1124:	68 a0 07 00 00       	push   $0x7a0
    1129:	e8 42 08 00 00       	call   1970 <thread_create>
    112e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    int c1 = thread_create(multi_consumer, (void*)ch);
    1131:	58                   	pop    %eax
    1132:	5a                   	pop    %edx
    1133:	53                   	push   %ebx
    1134:	68 40 08 00 00       	push   $0x840
    1139:	e8 32 08 00 00       	call   1970 <thread_create>
    int c2 = thread_create(multi_consumer, (void*)ch);
    113e:	59                   	pop    %ecx
    113f:	5e                   	pop    %esi
    1140:	53                   	push   %ebx
    1141:	68 40 08 00 00       	push   $0x840
    int c1 = thread_create(multi_consumer, (void*)ch);
    1146:	89 c7                	mov    %eax,%edi
    int c2 = thread_create(multi_consumer, (void*)ch);
    1148:	e8 23 08 00 00       	call   1970 <thread_create>
    thread_join(p1);
    114d:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    int c2 = thread_create(multi_consumer, (void*)ch);
    1150:	89 c6                	mov    %eax,%esi
    thread_join(p1);
    1152:	89 0c 24             	mov    %ecx,(%esp)
    1155:	e8 96 0a 00 00       	call   1bf0 <thread_join>
    thread_join(p2);
    115a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    115d:	89 14 24             	mov    %edx,(%esp)
    1160:	e8 8b 0a 00 00       	call   1bf0 <thread_join>
    thread_join(c1);
    1165:	89 3c 24             	mov    %edi,(%esp)
    1168:	e8 83 0a 00 00       	call   1bf0 <thread_join>
    thread_join(c2);
    116d:	89 34 24             	mov    %esi,(%esp)
    1170:	e8 7b 0a 00 00       	call   1bf0 <thread_join>
    channel_destroy(ch);
    1175:	89 1c 24             	mov    %ebx,(%esp)
    1178:	e8 a3 12 00 00       	call   2420 <channel_destroy>
    printf(1, "PASS Multiple producer-consumer test completed\n");
    117d:	5f                   	pop    %edi
    117e:	58                   	pop    %eax
    117f:	68 1c 2e 00 00       	push   $0x2e1c
    1184:	6a 01                	push   $0x1
    1186:	e8 45 04 00 00       	call   15d0 <printf>
}
    118b:	83 c4 10             	add    $0x10,%esp
    118e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1191:	5b                   	pop    %ebx
    1192:	5e                   	pop    %esi
    1193:	5f                   	pop    %edi
    1194:	5d                   	pop    %ebp
    1195:	c3                   	ret
    1196:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    119d:	00 
    119e:	66 90                	xchg   %ax,%ax

000011a0 <test_part3_examples>:
void test_part3_examples(void) {
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	83 ec 10             	sub    $0x10,%esp
    printf(1, "\n========================================================\n");
    11a6:	68 4c 2e 00 00       	push   $0x2e4c
    11ab:	6a 01                	push   $0x1
    11ad:	e8 1e 04 00 00       	call   15d0 <printf>
    printf(1, "Part 3 tests the same logic as standalone examples:\n");
    11b2:	58                   	pop    %eax
    11b3:	5a                   	pop    %edx
    11b4:	68 88 2e 00 00       	push   $0x2e88
    11b9:	6a 01                	push   $0x1
    11bb:	e8 10 04 00 00       	call   15d0 <printf>
    printf(1, "  - examples/producer_consumer.c (3 producers, 2 consumers)\n");
    11c0:	59                   	pop    %ecx
    11c1:	58                   	pop    %eax
    11c2:	68 c0 2e 00 00       	push   $0x2ec0
    11c7:	6a 01                	push   $0x1
    11c9:	e8 02 04 00 00       	call   15d0 <printf>
    printf(1, "  - examples/reader_writer.c (5 readers, 2 writers)\n");
    11ce:	58                   	pop    %eax
    11cf:	5a                   	pop    %edx
    11d0:	68 00 2f 00 00       	push   $0x2f00
    11d5:	6a 01                	push   $0x1
    11d7:	e8 f4 03 00 00       	call   15d0 <printf>
    printf(1, "\nTo run full examples separately:\n");
    11dc:	59                   	pop    %ecx
    11dd:	58                   	pop    %eax
    11de:	68 38 2f 00 00       	push   $0x2f38
    11e3:	6a 01                	push   $0x1
    11e5:	e8 e6 03 00 00       	call   15d0 <printf>
    printf(1, "  $ producer_consumer\n");
    11ea:	58                   	pop    %eax
    11eb:	5a                   	pop    %edx
    11ec:	68 2d 26 00 00       	push   $0x262d
    11f1:	6a 01                	push   $0x1
    11f3:	e8 d8 03 00 00       	call   15d0 <printf>
    printf(1, "  $ reader_writer\n");
    11f8:	59                   	pop    %ecx
    11f9:	58                   	pop    %eax
    11fa:	68 44 26 00 00       	push   $0x2644
    11ff:	6a 01                	push   $0x1
    1201:	e8 ca 03 00 00       	call   15d0 <printf>
    printf(1, "========================================================\n");
    1206:	58                   	pop    %eax
    1207:	5a                   	pop    %edx
    1208:	68 5c 2f 00 00       	push   $0x2f5c
    120d:	6a 01                	push   $0x1
    120f:	e8 bc 03 00 00       	call   15d0 <printf>
}
    1214:	83 c4 10             	add    $0x10,%esp
    1217:	c9                   	leave
    1218:	c3                   	ret
    1219:	66 90                	xchg   %ax,%ax
    121b:	66 90                	xchg   %ax,%ax
    121d:	66 90                	xchg   %ax,%ax
    121f:	90                   	nop

00001220 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1220:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1221:	31 c0                	xor    %eax,%eax
{
    1223:	89 e5                	mov    %esp,%ebp
    1225:	53                   	push   %ebx
    1226:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1229:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1230:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1234:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1237:	83 c0 01             	add    $0x1,%eax
    123a:	84 d2                	test   %dl,%dl
    123c:	75 f2                	jne    1230 <strcpy+0x10>
    ;
  return os;
}
    123e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1241:	89 c8                	mov    %ecx,%eax
    1243:	c9                   	leave
    1244:	c3                   	ret
    1245:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    124c:	00 
    124d:	8d 76 00             	lea    0x0(%esi),%esi

00001250 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	8b 55 08             	mov    0x8(%ebp),%edx
    1257:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    125a:	0f b6 02             	movzbl (%edx),%eax
    125d:	84 c0                	test   %al,%al
    125f:	75 17                	jne    1278 <strcmp+0x28>
    1261:	eb 3a                	jmp    129d <strcmp+0x4d>
    1263:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    1268:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    126c:	83 c2 01             	add    $0x1,%edx
    126f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    1272:	84 c0                	test   %al,%al
    1274:	74 1a                	je     1290 <strcmp+0x40>
    1276:	89 d9                	mov    %ebx,%ecx
    1278:	0f b6 19             	movzbl (%ecx),%ebx
    127b:	38 c3                	cmp    %al,%bl
    127d:	74 e9                	je     1268 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    127f:	29 d8                	sub    %ebx,%eax
}
    1281:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1284:	c9                   	leave
    1285:	c3                   	ret
    1286:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    128d:	00 
    128e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
    1290:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1294:	31 c0                	xor    %eax,%eax
    1296:	29 d8                	sub    %ebx,%eax
}
    1298:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    129b:	c9                   	leave
    129c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
    129d:	0f b6 19             	movzbl (%ecx),%ebx
    12a0:	31 c0                	xor    %eax,%eax
    12a2:	eb db                	jmp    127f <strcmp+0x2f>
    12a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    12ab:	00 
    12ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012b0 <strlen>:

uint
strlen(const char *s)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    12b6:	80 3a 00             	cmpb   $0x0,(%edx)
    12b9:	74 15                	je     12d0 <strlen+0x20>
    12bb:	31 c0                	xor    %eax,%eax
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    12c0:	83 c0 01             	add    $0x1,%eax
    12c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    12c7:	89 c1                	mov    %eax,%ecx
    12c9:	75 f5                	jne    12c0 <strlen+0x10>
    ;
  return n;
}
    12cb:	89 c8                	mov    %ecx,%eax
    12cd:	5d                   	pop    %ebp
    12ce:	c3                   	ret
    12cf:	90                   	nop
  for(n = 0; s[n]; n++)
    12d0:	31 c9                	xor    %ecx,%ecx
}
    12d2:	5d                   	pop    %ebp
    12d3:	89 c8                	mov    %ecx,%eax
    12d5:	c3                   	ret
    12d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    12dd:	00 
    12de:	66 90                	xchg   %ax,%ax

000012e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	57                   	push   %edi
    12e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    12e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    12ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    12ed:	89 d7                	mov    %edx,%edi
    12ef:	fc                   	cld
    12f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    12f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    12f5:	89 d0                	mov    %edx,%eax
    12f7:	c9                   	leave
    12f8:	c3                   	ret
    12f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001300 <strchr>:

char*
strchr(const char *s, char c)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	8b 45 08             	mov    0x8(%ebp),%eax
    1306:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    130a:	0f b6 10             	movzbl (%eax),%edx
    130d:	84 d2                	test   %dl,%dl
    130f:	75 12                	jne    1323 <strchr+0x23>
    1311:	eb 1d                	jmp    1330 <strchr+0x30>
    1313:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    1318:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    131c:	83 c0 01             	add    $0x1,%eax
    131f:	84 d2                	test   %dl,%dl
    1321:	74 0d                	je     1330 <strchr+0x30>
    if(*s == c)
    1323:	38 d1                	cmp    %dl,%cl
    1325:	75 f1                	jne    1318 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1327:	5d                   	pop    %ebp
    1328:	c3                   	ret
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1330:	31 c0                	xor    %eax,%eax
}
    1332:	5d                   	pop    %ebp
    1333:	c3                   	ret
    1334:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    133b:	00 
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001340 <gets>:

char*
gets(char *buf, int max)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    1345:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
    1348:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    1349:	31 db                	xor    %ebx,%ebx
{
    134b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    134e:	eb 27                	jmp    1377 <gets+0x37>
    cc = read(0, &c, 1);
    1350:	83 ec 04             	sub    $0x4,%esp
    1353:	6a 01                	push   $0x1
    1355:	56                   	push   %esi
    1356:	6a 00                	push   $0x0
    1358:	e8 1e 01 00 00       	call   147b <read>
    if(cc < 1)
    135d:	83 c4 10             	add    $0x10,%esp
    1360:	85 c0                	test   %eax,%eax
    1362:	7e 1d                	jle    1381 <gets+0x41>
      break;
    buf[i++] = c;
    1364:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1368:	8b 55 08             	mov    0x8(%ebp),%edx
    136b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    136f:	3c 0a                	cmp    $0xa,%al
    1371:	74 10                	je     1383 <gets+0x43>
    1373:	3c 0d                	cmp    $0xd,%al
    1375:	74 0c                	je     1383 <gets+0x43>
  for(i=0; i+1 < max; ){
    1377:	89 df                	mov    %ebx,%edi
    1379:	83 c3 01             	add    $0x1,%ebx
    137c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    137f:	7c cf                	jl     1350 <gets+0x10>
    1381:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
    1383:	8b 45 08             	mov    0x8(%ebp),%eax
    1386:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
    138a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    138d:	5b                   	pop    %ebx
    138e:	5e                   	pop    %esi
    138f:	5f                   	pop    %edi
    1390:	5d                   	pop    %ebp
    1391:	c3                   	ret
    1392:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1399:	00 
    139a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013a0 <stat>:

int
stat(const char *n, struct stat *st)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	56                   	push   %esi
    13a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    13a5:	83 ec 08             	sub    $0x8,%esp
    13a8:	6a 00                	push   $0x0
    13aa:	ff 75 08             	push   0x8(%ebp)
    13ad:	e8 f1 00 00 00       	call   14a3 <open>
  if(fd < 0)
    13b2:	83 c4 10             	add    $0x10,%esp
    13b5:	85 c0                	test   %eax,%eax
    13b7:	78 27                	js     13e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    13b9:	83 ec 08             	sub    $0x8,%esp
    13bc:	ff 75 0c             	push   0xc(%ebp)
    13bf:	89 c3                	mov    %eax,%ebx
    13c1:	50                   	push   %eax
    13c2:	e8 f4 00 00 00       	call   14bb <fstat>
  close(fd);
    13c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    13ca:	89 c6                	mov    %eax,%esi
  close(fd);
    13cc:	e8 ba 00 00 00       	call   148b <close>
  return r;
    13d1:	83 c4 10             	add    $0x10,%esp
}
    13d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    13d7:	89 f0                	mov    %esi,%eax
    13d9:	5b                   	pop    %ebx
    13da:	5e                   	pop    %esi
    13db:	5d                   	pop    %ebp
    13dc:	c3                   	ret
    13dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    13e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    13e5:	eb ed                	jmp    13d4 <stat+0x34>
    13e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    13ee:	00 
    13ef:	90                   	nop

000013f0 <atoi>:

int
atoi(const char *s)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	53                   	push   %ebx
    13f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13f7:	0f be 02             	movsbl (%edx),%eax
    13fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
    13fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1400:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1405:	77 1e                	ja     1425 <atoi+0x35>
    1407:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    140e:	00 
    140f:	90                   	nop
    n = n*10 + *s++ - '0';
    1410:	83 c2 01             	add    $0x1,%edx
    1413:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1416:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    141a:	0f be 02             	movsbl (%edx),%eax
    141d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1420:	80 fb 09             	cmp    $0x9,%bl
    1423:	76 eb                	jbe    1410 <atoi+0x20>
  return n;
}
    1425:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1428:	89 c8                	mov    %ecx,%eax
    142a:	c9                   	leave
    142b:	c3                   	ret
    142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001430 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	8b 45 10             	mov    0x10(%ebp),%eax
    1437:	8b 55 08             	mov    0x8(%ebp),%edx
    143a:	56                   	push   %esi
    143b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    143e:	85 c0                	test   %eax,%eax
    1440:	7e 13                	jle    1455 <memmove+0x25>
    1442:	01 d0                	add    %edx,%eax
  dst = vdst;
    1444:	89 d7                	mov    %edx,%edi
    1446:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    144d:	00 
    144e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
    1450:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1451:	39 f8                	cmp    %edi,%eax
    1453:	75 fb                	jne    1450 <memmove+0x20>
  return vdst;
}
    1455:	5e                   	pop    %esi
    1456:	89 d0                	mov    %edx,%eax
    1458:	5f                   	pop    %edi
    1459:	5d                   	pop    %ebp
    145a:	c3                   	ret

0000145b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    145b:	b8 01 00 00 00       	mov    $0x1,%eax
    1460:	cd 40                	int    $0x40
    1462:	c3                   	ret

00001463 <exit>:
SYSCALL(exit)
    1463:	b8 02 00 00 00       	mov    $0x2,%eax
    1468:	cd 40                	int    $0x40
    146a:	c3                   	ret

0000146b <wait>:
SYSCALL(wait)
    146b:	b8 03 00 00 00       	mov    $0x3,%eax
    1470:	cd 40                	int    $0x40
    1472:	c3                   	ret

00001473 <pipe>:
SYSCALL(pipe)
    1473:	b8 04 00 00 00       	mov    $0x4,%eax
    1478:	cd 40                	int    $0x40
    147a:	c3                   	ret

0000147b <read>:
SYSCALL(read)
    147b:	b8 05 00 00 00       	mov    $0x5,%eax
    1480:	cd 40                	int    $0x40
    1482:	c3                   	ret

00001483 <write>:
SYSCALL(write)
    1483:	b8 10 00 00 00       	mov    $0x10,%eax
    1488:	cd 40                	int    $0x40
    148a:	c3                   	ret

0000148b <close>:
SYSCALL(close)
    148b:	b8 15 00 00 00       	mov    $0x15,%eax
    1490:	cd 40                	int    $0x40
    1492:	c3                   	ret

00001493 <kill>:
SYSCALL(kill)
    1493:	b8 06 00 00 00       	mov    $0x6,%eax
    1498:	cd 40                	int    $0x40
    149a:	c3                   	ret

0000149b <exec>:
SYSCALL(exec)
    149b:	b8 07 00 00 00       	mov    $0x7,%eax
    14a0:	cd 40                	int    $0x40
    14a2:	c3                   	ret

000014a3 <open>:
SYSCALL(open)
    14a3:	b8 0f 00 00 00       	mov    $0xf,%eax
    14a8:	cd 40                	int    $0x40
    14aa:	c3                   	ret

000014ab <mknod>:
SYSCALL(mknod)
    14ab:	b8 11 00 00 00       	mov    $0x11,%eax
    14b0:	cd 40                	int    $0x40
    14b2:	c3                   	ret

000014b3 <unlink>:
SYSCALL(unlink)
    14b3:	b8 12 00 00 00       	mov    $0x12,%eax
    14b8:	cd 40                	int    $0x40
    14ba:	c3                   	ret

000014bb <fstat>:
SYSCALL(fstat)
    14bb:	b8 08 00 00 00       	mov    $0x8,%eax
    14c0:	cd 40                	int    $0x40
    14c2:	c3                   	ret

000014c3 <link>:
SYSCALL(link)
    14c3:	b8 13 00 00 00       	mov    $0x13,%eax
    14c8:	cd 40                	int    $0x40
    14ca:	c3                   	ret

000014cb <mkdir>:
SYSCALL(mkdir)
    14cb:	b8 14 00 00 00       	mov    $0x14,%eax
    14d0:	cd 40                	int    $0x40
    14d2:	c3                   	ret

000014d3 <chdir>:
SYSCALL(chdir)
    14d3:	b8 09 00 00 00       	mov    $0x9,%eax
    14d8:	cd 40                	int    $0x40
    14da:	c3                   	ret

000014db <dup>:
SYSCALL(dup)
    14db:	b8 0a 00 00 00       	mov    $0xa,%eax
    14e0:	cd 40                	int    $0x40
    14e2:	c3                   	ret

000014e3 <getpid>:
SYSCALL(getpid)
    14e3:	b8 0b 00 00 00       	mov    $0xb,%eax
    14e8:	cd 40                	int    $0x40
    14ea:	c3                   	ret

000014eb <sbrk>:
SYSCALL(sbrk)
    14eb:	b8 0c 00 00 00       	mov    $0xc,%eax
    14f0:	cd 40                	int    $0x40
    14f2:	c3                   	ret

000014f3 <sleep>:
SYSCALL(sleep)
    14f3:	b8 0d 00 00 00       	mov    $0xd,%eax
    14f8:	cd 40                	int    $0x40
    14fa:	c3                   	ret

000014fb <uptime>:
SYSCALL(uptime)
    14fb:	b8 0e 00 00 00       	mov    $0xe,%eax
    1500:	cd 40                	int    $0x40
    1502:	c3                   	ret

00001503 <getnice>:
SYSCALL(getnice)
    1503:	b8 16 00 00 00       	mov    $0x16,%eax
    1508:	cd 40                	int    $0x40
    150a:	c3                   	ret

0000150b <lock>:
SYSCALL(lock)
    150b:	b8 17 00 00 00       	mov    $0x17,%eax
    1510:	cd 40                	int    $0x40
    1512:	c3                   	ret

00001513 <release>:
SYSCALL(release)
    1513:	b8 18 00 00 00       	mov    $0x18,%eax
    1518:	cd 40                	int    $0x40
    151a:	c3                   	ret

0000151b <setnice>:
SYSCALL(setnice)
    151b:	b8 19 00 00 00       	mov    $0x19,%eax
    1520:	cd 40                	int    $0x40
    1522:	c3                   	ret
    1523:	66 90                	xchg   %ax,%ax
    1525:	66 90                	xchg   %ax,%ax
    1527:	66 90                	xchg   %ax,%ax
    1529:	66 90                	xchg   %ax,%ax
    152b:	66 90                	xchg   %ax,%ax
    152d:	66 90                	xchg   %ax,%ax
    152f:	90                   	nop

00001530 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1530:	55                   	push   %ebp
    1531:	89 e5                	mov    %esp,%ebp
    1533:	57                   	push   %edi
    1534:	56                   	push   %esi
    1535:	53                   	push   %ebx
    1536:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1538:	89 d1                	mov    %edx,%ecx
{
    153a:	83 ec 3c             	sub    $0x3c,%esp
    153d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    1540:	85 d2                	test   %edx,%edx
    1542:	0f 89 80 00 00 00    	jns    15c8 <printint+0x98>
    1548:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    154c:	74 7a                	je     15c8 <printint+0x98>
    x = -xx;
    154e:	f7 d9                	neg    %ecx
    neg = 1;
    1550:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    1555:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    1558:	31 f6                	xor    %esi,%esi
    155a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1560:	89 c8                	mov    %ecx,%eax
    1562:	31 d2                	xor    %edx,%edx
    1564:	89 f7                	mov    %esi,%edi
    1566:	f7 f3                	div    %ebx
    1568:	8d 76 01             	lea    0x1(%esi),%esi
    156b:	0f b6 92 6c 37 00 00 	movzbl 0x376c(%edx),%edx
    1572:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    1576:	89 ca                	mov    %ecx,%edx
    1578:	89 c1                	mov    %eax,%ecx
    157a:	39 da                	cmp    %ebx,%edx
    157c:	73 e2                	jae    1560 <printint+0x30>
  if(neg)
    157e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1581:	85 c0                	test   %eax,%eax
    1583:	74 07                	je     158c <printint+0x5c>
    buf[i++] = '-';
    1585:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
    158a:	89 f7                	mov    %esi,%edi
    158c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    158f:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1592:	01 df                	add    %ebx,%edi
    1594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    1598:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    159b:	83 ec 04             	sub    $0x4,%esp
    159e:	88 45 d7             	mov    %al,-0x29(%ebp)
    15a1:	8d 45 d7             	lea    -0x29(%ebp),%eax
    15a4:	6a 01                	push   $0x1
    15a6:	50                   	push   %eax
    15a7:	56                   	push   %esi
    15a8:	e8 d6 fe ff ff       	call   1483 <write>
  while(--i >= 0)
    15ad:	89 f8                	mov    %edi,%eax
    15af:	83 c4 10             	add    $0x10,%esp
    15b2:	83 ef 01             	sub    $0x1,%edi
    15b5:	39 c3                	cmp    %eax,%ebx
    15b7:	75 df                	jne    1598 <printint+0x68>
}
    15b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15bc:	5b                   	pop    %ebx
    15bd:	5e                   	pop    %esi
    15be:	5f                   	pop    %edi
    15bf:	5d                   	pop    %ebp
    15c0:	c3                   	ret
    15c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    15c8:	31 c0                	xor    %eax,%eax
    15ca:	eb 89                	jmp    1555 <printint+0x25>
    15cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000015d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    15d0:	55                   	push   %ebp
    15d1:	89 e5                	mov    %esp,%ebp
    15d3:	57                   	push   %edi
    15d4:	56                   	push   %esi
    15d5:	53                   	push   %ebx
    15d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15d9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    15dc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    15df:	0f b6 1e             	movzbl (%esi),%ebx
    15e2:	83 c6 01             	add    $0x1,%esi
    15e5:	84 db                	test   %bl,%bl
    15e7:	74 67                	je     1650 <printf+0x80>
    15e9:	8d 4d 10             	lea    0x10(%ebp),%ecx
    15ec:	31 d2                	xor    %edx,%edx
    15ee:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    15f1:	eb 34                	jmp    1627 <printf+0x57>
    15f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    15f8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    15fb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1600:	83 f8 25             	cmp    $0x25,%eax
    1603:	74 18                	je     161d <printf+0x4d>
  write(fd, &c, 1);
    1605:	83 ec 04             	sub    $0x4,%esp
    1608:	8d 45 e7             	lea    -0x19(%ebp),%eax
    160b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    160e:	6a 01                	push   $0x1
    1610:	50                   	push   %eax
    1611:	57                   	push   %edi
    1612:	e8 6c fe ff ff       	call   1483 <write>
    1617:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    161a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    161d:	0f b6 1e             	movzbl (%esi),%ebx
    1620:	83 c6 01             	add    $0x1,%esi
    1623:	84 db                	test   %bl,%bl
    1625:	74 29                	je     1650 <printf+0x80>
    c = fmt[i] & 0xff;
    1627:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    162a:	85 d2                	test   %edx,%edx
    162c:	74 ca                	je     15f8 <printf+0x28>
      }
    } else if(state == '%'){
    162e:	83 fa 25             	cmp    $0x25,%edx
    1631:	75 ea                	jne    161d <printf+0x4d>
      if(c == 'd'){
    1633:	83 f8 25             	cmp    $0x25,%eax
    1636:	0f 84 04 01 00 00    	je     1740 <printf+0x170>
    163c:	83 e8 63             	sub    $0x63,%eax
    163f:	83 f8 15             	cmp    $0x15,%eax
    1642:	77 1c                	ja     1660 <printf+0x90>
    1644:	ff 24 85 14 37 00 00 	jmp    *0x3714(,%eax,4)
    164b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1650:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1653:	5b                   	pop    %ebx
    1654:	5e                   	pop    %esi
    1655:	5f                   	pop    %edi
    1656:	5d                   	pop    %ebp
    1657:	c3                   	ret
    1658:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    165f:	00 
  write(fd, &c, 1);
    1660:	83 ec 04             	sub    $0x4,%esp
    1663:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1666:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    166a:	6a 01                	push   $0x1
    166c:	52                   	push   %edx
    166d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1670:	57                   	push   %edi
    1671:	e8 0d fe ff ff       	call   1483 <write>
    1676:	83 c4 0c             	add    $0xc,%esp
    1679:	88 5d e7             	mov    %bl,-0x19(%ebp)
    167c:	6a 01                	push   $0x1
    167e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1681:	52                   	push   %edx
    1682:	57                   	push   %edi
    1683:	e8 fb fd ff ff       	call   1483 <write>
        putc(fd, c);
    1688:	83 c4 10             	add    $0x10,%esp
      state = 0;
    168b:	31 d2                	xor    %edx,%edx
    168d:	eb 8e                	jmp    161d <printf+0x4d>
    168f:	90                   	nop
        printint(fd, *ap, 16, 0);
    1690:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1693:	83 ec 0c             	sub    $0xc,%esp
    1696:	b9 10 00 00 00       	mov    $0x10,%ecx
    169b:	8b 13                	mov    (%ebx),%edx
    169d:	6a 00                	push   $0x0
    169f:	89 f8                	mov    %edi,%eax
        ap++;
    16a1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    16a4:	e8 87 fe ff ff       	call   1530 <printint>
        ap++;
    16a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    16ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
    16af:	31 d2                	xor    %edx,%edx
    16b1:	e9 67 ff ff ff       	jmp    161d <printf+0x4d>
        s = (char*)*ap;
    16b6:	8b 45 d0             	mov    -0x30(%ebp),%eax
    16b9:	8b 18                	mov    (%eax),%ebx
        ap++;
    16bb:	83 c0 04             	add    $0x4,%eax
    16be:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    16c1:	85 db                	test   %ebx,%ebx
    16c3:	0f 84 87 00 00 00    	je     1750 <printf+0x180>
        while(*s != 0){
    16c9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    16cc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    16ce:	84 c0                	test   %al,%al
    16d0:	0f 84 47 ff ff ff    	je     161d <printf+0x4d>
    16d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    16d9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    16dc:	89 de                	mov    %ebx,%esi
    16de:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
    16e0:	83 ec 04             	sub    $0x4,%esp
    16e3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    16e6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    16e9:	6a 01                	push   $0x1
    16eb:	53                   	push   %ebx
    16ec:	57                   	push   %edi
    16ed:	e8 91 fd ff ff       	call   1483 <write>
        while(*s != 0){
    16f2:	0f b6 06             	movzbl (%esi),%eax
    16f5:	83 c4 10             	add    $0x10,%esp
    16f8:	84 c0                	test   %al,%al
    16fa:	75 e4                	jne    16e0 <printf+0x110>
      state = 0;
    16fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    16ff:	31 d2                	xor    %edx,%edx
    1701:	e9 17 ff ff ff       	jmp    161d <printf+0x4d>
        printint(fd, *ap, 10, 1);
    1706:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1709:	83 ec 0c             	sub    $0xc,%esp
    170c:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1711:	8b 13                	mov    (%ebx),%edx
    1713:	6a 01                	push   $0x1
    1715:	eb 88                	jmp    169f <printf+0xcf>
        putc(fd, *ap);
    1717:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    171a:	83 ec 04             	sub    $0x4,%esp
    171d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    1720:	8b 03                	mov    (%ebx),%eax
        ap++;
    1722:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    1725:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1728:	6a 01                	push   $0x1
    172a:	52                   	push   %edx
    172b:	57                   	push   %edi
    172c:	e8 52 fd ff ff       	call   1483 <write>
        ap++;
    1731:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1734:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1737:	31 d2                	xor    %edx,%edx
    1739:	e9 df fe ff ff       	jmp    161d <printf+0x4d>
    173e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    1740:	83 ec 04             	sub    $0x4,%esp
    1743:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1746:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1749:	6a 01                	push   $0x1
    174b:	e9 31 ff ff ff       	jmp    1681 <printf+0xb1>
    1750:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1755:	bb 73 26 00 00       	mov    $0x2673,%ebx
    175a:	e9 77 ff ff ff       	jmp    16d6 <printf+0x106>
    175f:	90                   	nop

00001760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1761:	a1 24 43 00 00       	mov    0x4324,%eax
{
    1766:	89 e5                	mov    %esp,%ebp
    1768:	57                   	push   %edi
    1769:	56                   	push   %esi
    176a:	53                   	push   %ebx
    176b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    176e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1778:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    177a:	39 c8                	cmp    %ecx,%eax
    177c:	73 32                	jae    17b0 <free+0x50>
    177e:	39 d1                	cmp    %edx,%ecx
    1780:	72 04                	jb     1786 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1782:	39 d0                	cmp    %edx,%eax
    1784:	72 32                	jb     17b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1786:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1789:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    178c:	39 fa                	cmp    %edi,%edx
    178e:	74 30                	je     17c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1790:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1793:	8b 50 04             	mov    0x4(%eax),%edx
    1796:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1799:	39 f1                	cmp    %esi,%ecx
    179b:	74 3a                	je     17d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    179d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    179f:	5b                   	pop    %ebx
  freep = p;
    17a0:	a3 24 43 00 00       	mov    %eax,0x4324
}
    17a5:	5e                   	pop    %esi
    17a6:	5f                   	pop    %edi
    17a7:	5d                   	pop    %ebp
    17a8:	c3                   	ret
    17a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17b0:	39 d0                	cmp    %edx,%eax
    17b2:	72 04                	jb     17b8 <free+0x58>
    17b4:	39 d1                	cmp    %edx,%ecx
    17b6:	72 ce                	jb     1786 <free+0x26>
{
    17b8:	89 d0                	mov    %edx,%eax
    17ba:	eb bc                	jmp    1778 <free+0x18>
    17bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    17c0:	03 72 04             	add    0x4(%edx),%esi
    17c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    17c6:	8b 10                	mov    (%eax),%edx
    17c8:	8b 12                	mov    (%edx),%edx
    17ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    17cd:	8b 50 04             	mov    0x4(%eax),%edx
    17d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    17d3:	39 f1                	cmp    %esi,%ecx
    17d5:	75 c6                	jne    179d <free+0x3d>
    p->s.size += bp->s.size;
    17d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    17da:	a3 24 43 00 00       	mov    %eax,0x4324
    p->s.size += bp->s.size;
    17df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    17e2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    17e5:	89 08                	mov    %ecx,(%eax)
}
    17e7:	5b                   	pop    %ebx
    17e8:	5e                   	pop    %esi
    17e9:	5f                   	pop    %edi
    17ea:	5d                   	pop    %ebp
    17eb:	c3                   	ret
    17ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000017f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    17f0:	55                   	push   %ebp
    17f1:	89 e5                	mov    %esp,%ebp
    17f3:	57                   	push   %edi
    17f4:	56                   	push   %esi
    17f5:	53                   	push   %ebx
    17f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    17fc:	8b 15 24 43 00 00    	mov    0x4324,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1802:	8d 78 07             	lea    0x7(%eax),%edi
    1805:	c1 ef 03             	shr    $0x3,%edi
    1808:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    180b:	85 d2                	test   %edx,%edx
    180d:	0f 84 8d 00 00 00    	je     18a0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1813:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1815:	8b 48 04             	mov    0x4(%eax),%ecx
    1818:	39 f9                	cmp    %edi,%ecx
    181a:	73 64                	jae    1880 <malloc+0x90>
  if(nu < 4096)
    181c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1821:	39 df                	cmp    %ebx,%edi
    1823:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1826:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    182d:	eb 0a                	jmp    1839 <malloc+0x49>
    182f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1830:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1832:	8b 48 04             	mov    0x4(%eax),%ecx
    1835:	39 f9                	cmp    %edi,%ecx
    1837:	73 47                	jae    1880 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1839:	89 c2                	mov    %eax,%edx
    183b:	3b 05 24 43 00 00    	cmp    0x4324,%eax
    1841:	75 ed                	jne    1830 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    1843:	83 ec 0c             	sub    $0xc,%esp
    1846:	56                   	push   %esi
    1847:	e8 9f fc ff ff       	call   14eb <sbrk>
  if(p == (char*)-1)
    184c:	83 c4 10             	add    $0x10,%esp
    184f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1852:	74 1c                	je     1870 <malloc+0x80>
  hp->s.size = nu;
    1854:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1857:	83 ec 0c             	sub    $0xc,%esp
    185a:	83 c0 08             	add    $0x8,%eax
    185d:	50                   	push   %eax
    185e:	e8 fd fe ff ff       	call   1760 <free>
  return freep;
    1863:	8b 15 24 43 00 00    	mov    0x4324,%edx
      if((p = morecore(nunits)) == 0)
    1869:	83 c4 10             	add    $0x10,%esp
    186c:	85 d2                	test   %edx,%edx
    186e:	75 c0                	jne    1830 <malloc+0x40>
        return 0;
  }
}
    1870:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1873:	31 c0                	xor    %eax,%eax
}
    1875:	5b                   	pop    %ebx
    1876:	5e                   	pop    %esi
    1877:	5f                   	pop    %edi
    1878:	5d                   	pop    %ebp
    1879:	c3                   	ret
    187a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1880:	39 cf                	cmp    %ecx,%edi
    1882:	74 4c                	je     18d0 <malloc+0xe0>
        p->s.size -= nunits;
    1884:	29 f9                	sub    %edi,%ecx
    1886:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1889:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    188c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    188f:	89 15 24 43 00 00    	mov    %edx,0x4324
}
    1895:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1898:	83 c0 08             	add    $0x8,%eax
}
    189b:	5b                   	pop    %ebx
    189c:	5e                   	pop    %esi
    189d:	5f                   	pop    %edi
    189e:	5d                   	pop    %ebp
    189f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    18a0:	c7 05 24 43 00 00 28 	movl   $0x4328,0x4324
    18a7:	43 00 00 
    base.s.size = 0;
    18aa:	b8 28 43 00 00       	mov    $0x4328,%eax
    base.s.ptr = freep = prevp = &base;
    18af:	c7 05 28 43 00 00 28 	movl   $0x4328,0x4328
    18b6:	43 00 00 
    base.s.size = 0;
    18b9:	c7 05 2c 43 00 00 00 	movl   $0x0,0x432c
    18c0:	00 00 00 
    if(p->s.size >= nunits){
    18c3:	e9 54 ff ff ff       	jmp    181c <malloc+0x2c>
    18c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    18cf:	00 
        prevp->s.ptr = p->s.ptr;
    18d0:	8b 08                	mov    (%eax),%ecx
    18d2:	89 0a                	mov    %ecx,(%edx)
    18d4:	eb b9                	jmp    188f <malloc+0x9f>
    18d6:	66 90                	xchg   %ax,%ax
    18d8:	66 90                	xchg   %ax,%ax
    18da:	66 90                	xchg   %ax,%ax
    18dc:	66 90                	xchg   %ax,%ax
    18de:	66 90                	xchg   %ax,%ax

000018e0 <thread_init>:
    if (threads[tid].state == T_UNUSED)
        return 0;
    return &threads[tid];
}

void thread_init(void) {
    18e0:	55                   	push   %ebp
    18e1:	b8 60 43 00 00       	mov    $0x4360,%eax
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
    18e6:	31 d2                	xor    %edx,%edx
void thread_init(void) {
    18e8:	89 e5                	mov    %esp,%ebp
    18ea:	83 ec 08             	sub    $0x8,%esp
    18ed:	8d 76 00             	lea    0x0(%esi),%esi
        threads[i].state = T_UNUSED;
        threads[i].tid = i;
    18f0:	89 10                	mov    %edx,(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
    18f2:	83 c2 01             	add    $0x1,%edx
    18f5:	83 c0 44             	add    $0x44,%eax
        threads[i].state = T_UNUSED;
    18f8:	c7 40 c0 00 00 00 00 	movl   $0x0,-0x40(%eax)
        threads[i].stack = 0;
    18ff:	c7 40 c4 00 00 00 00 	movl   $0x0,-0x3c(%eax)
        threads[i].start_routine = 0;
    1906:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
        threads[i].arg = 0;
    190d:	c7 40 f0 00 00 00 00 	movl   $0x0,-0x10(%eax)
        threads[i].retval = 0;
    1914:	c7 40 f4 00 00 00 00 	movl   $0x0,-0xc(%eax)
        threads[i].join_waiter = 0;
    191b:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
        threads[i].sleep_chan = 0;
    1922:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
    1929:	83 fa 40             	cmp    $0x40,%edx
    192c:	75 c2                	jne    18f0 <thread_init+0x10>
    }
    
    threads[0].state = T_RUNNING;
    192e:	c7 05 64 43 00 00 02 	movl   $0x2,0x4364
    1935:	00 00 00 
    threads[0].tid = 0;
    current_thread = &threads[0];
    next_tid = 1;
    
    printf(1, "[uthreads] Thread library initialized, main thread tid=0\n");
    1938:	83 ec 08             	sub    $0x8,%esp
    193b:	68 f4 33 00 00       	push   $0x33f4
    1940:	6a 01                	push   $0x1
    threads[0].tid = 0;
    1942:	c7 05 60 43 00 00 00 	movl   $0x0,0x4360
    1949:	00 00 00 
    current_thread = &threads[0];
    194c:	c7 05 44 43 00 00 60 	movl   $0x4360,0x4344
    1953:	43 00 00 
    next_tid = 1;
    1956:	c7 05 40 43 00 00 01 	movl   $0x1,0x4340
    195d:	00 00 00 
    printf(1, "[uthreads] Thread library initialized, main thread tid=0\n");
    1960:	e8 6b fc ff ff       	call   15d0 <printf>
}
    1965:	83 c4 10             	add    $0x10,%esp
    1968:	c9                   	leave
    1969:	c3                   	ret
    196a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001970 <thread_create>:

int thread_create(void *(*start_routine)(void*), void *arg) {
    1970:	55                   	push   %ebp
    1971:	89 e5                	mov    %esp,%ebp
    1973:	57                   	push   %edi
    1974:	56                   	push   %esi
    1975:	53                   	push   %ebx
    1976:	83 ec 0c             	sub    $0xc,%esp
    1979:	8b 75 08             	mov    0x8(%ebp),%esi
    thread_t *t;
    int i;
    uint *sp;
    
    if (!start_routine)
    197c:	85 f6                	test   %esi,%esi
    197e:	0f 84 d6 00 00 00    	je     1a5a <thread_create+0xea>
    1984:	b8 64 43 00 00       	mov    $0x4364,%eax
        return -1;
    
    t = 0;
    for (i = 0; i < MAX_THREADS; i++) {
    1989:	31 db                	xor    %ebx,%ebx
    198b:	eb 12                	jmp    199f <thread_create+0x2f>
    198d:	8d 76 00             	lea    0x0(%esi),%esi
    1990:	83 c3 01             	add    $0x1,%ebx
    1993:	83 c0 44             	add    $0x44,%eax
    1996:	83 fb 40             	cmp    $0x40,%ebx
    1999:	0f 84 a9 00 00 00    	je     1a48 <thread_create+0xd8>
        if (threads[i].state == T_UNUSED) {
    199f:	8b 10                	mov    (%eax),%edx
    19a1:	85 d2                	test   %edx,%edx
    19a3:	75 eb                	jne    1990 <thread_create+0x20>
    if (!t) {
        printf(2, "[uthreads] Error: Thread limit reached\n");
        return -1;
    }
    
    t->stack = malloc(STACK_SIZE);
    19a5:	83 ec 0c             	sub    $0xc,%esp
    19a8:	6b db 44             	imul   $0x44,%ebx,%ebx
    19ab:	68 00 10 00 00       	push   $0x1000
    19b0:	8d bb 60 43 00 00    	lea    0x4360(%ebx),%edi
    19b6:	e8 35 fe ff ff       	call   17f0 <malloc>
    if (!t->stack) {
    19bb:	83 c4 10             	add    $0x10,%esp
    t->stack = malloc(STACK_SIZE);
    19be:	89 47 08             	mov    %eax,0x8(%edi)
    if (!t->stack) {
    19c1:	85 c0                	test   %eax,%eax
    19c3:	0f 84 9e 00 00 00    	je     1a67 <thread_create+0xf7>
        return -1;
    }
    
    t->state = T_RUNNABLE;
    t->start_routine = start_routine;
    t->arg = arg;
    19c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    t->retval = 0;
    t->join_waiter = 0;
    t->sleep_chan = 0;
    
    memset(&t->context, 0, sizeof(thread_context_t));
    19cc:	83 ec 04             	sub    $0x4,%esp
    t->start_routine = start_routine;
    19cf:	89 77 30             	mov    %esi,0x30(%edi)
    t->state = T_RUNNABLE;
    19d2:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
    t->arg = arg;
    19d9:	89 47 34             	mov    %eax,0x34(%edi)
    memset(&t->context, 0, sizeof(thread_context_t));
    19dc:	8d 83 6c 43 00 00    	lea    0x436c(%ebx),%eax
    t->retval = 0;
    19e2:	c7 47 38 00 00 00 00 	movl   $0x0,0x38(%edi)
    t->join_waiter = 0;
    19e9:	c7 47 3c 00 00 00 00 	movl   $0x0,0x3c(%edi)
    t->sleep_chan = 0;
    19f0:	c7 47 40 00 00 00 00 	movl   $0x0,0x40(%edi)
    memset(&t->context, 0, sizeof(thread_context_t));
    19f7:	6a 24                	push   $0x24
    19f9:	6a 00                	push   $0x0
    19fb:	50                   	push   %eax
    19fc:	e8 df f8 ff ff       	call   12e0 <memset>
    
    sp = (uint*)((char*)t->stack + STACK_SIZE);
    1a01:	8b 47 08             	mov    0x8(%edi),%eax
    *sp = (uint)thread_entry;
    
    t->context.esp = (uint)sp;
    t->context.eip = (uint)thread_entry;
    
    printf(1, "[uthreads] Created thread tid=%d\n", t->tid);
    1a04:	83 c4 0c             	add    $0xc,%esp
    *sp = (uint)thread_entry;
    1a07:	c7 80 fc 0f 00 00 d0 	movl   $0x1bd0,0xffc(%eax)
    1a0e:	1b 00 00 
    sp--;
    1a11:	05 fc 0f 00 00       	add    $0xffc,%eax
    1a16:	89 47 28             	mov    %eax,0x28(%edi)
    t->context.eip = (uint)thread_entry;
    1a19:	c7 47 2c d0 1b 00 00 	movl   $0x1bd0,0x2c(%edi)
    printf(1, "[uthreads] Created thread tid=%d\n", t->tid);
    1a20:	ff b3 60 43 00 00    	push   0x4360(%ebx)
    1a26:	68 84 34 00 00       	push   $0x3484
    1a2b:	6a 01                	push   $0x1
    1a2d:	e8 9e fb ff ff       	call   15d0 <printf>
    return t->tid;
    1a32:	8b 83 60 43 00 00    	mov    0x4360(%ebx),%eax
    1a38:	83 c4 10             	add    $0x10,%esp
}
    1a3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a3e:	5b                   	pop    %ebx
    1a3f:	5e                   	pop    %esi
    1a40:	5f                   	pop    %edi
    1a41:	5d                   	pop    %ebp
    1a42:	c3                   	ret
    1a43:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "[uthreads] Error: Thread limit reached\n");
    1a48:	83 ec 08             	sub    $0x8,%esp
    1a4b:	68 30 34 00 00       	push   $0x3430
    1a50:	6a 02                	push   $0x2
    1a52:	e8 79 fb ff ff       	call   15d0 <printf>
        return -1;
    1a57:	83 c4 10             	add    $0x10,%esp
}
    1a5a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
    1a5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1a62:	5b                   	pop    %ebx
    1a63:	5e                   	pop    %esi
    1a64:	5f                   	pop    %edi
    1a65:	5d                   	pop    %ebp
    1a66:	c3                   	ret
        printf(2, "[uthreads] Error: Stack allocation failed\n");
    1a67:	83 ec 08             	sub    $0x8,%esp
    1a6a:	68 58 34 00 00       	push   $0x3458
    1a6f:	6a 02                	push   $0x2
    1a71:	e8 5a fb ff ff       	call   15d0 <printf>
        return -1;
    1a76:	83 c4 10             	add    $0x10,%esp
    1a79:	eb df                	jmp    1a5a <thread_create+0xea>
    1a7b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00001a80 <thread_self>:
    current_thread->state = T_RUNNABLE;
    thread_schedule();
}

int thread_self(void) {
    return current_thread->tid;
    1a80:	a1 44 43 00 00       	mov    0x4344,%eax
    1a85:	8b 00                	mov    (%eax),%eax
}
    1a87:	c3                   	ret
    1a88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1a8f:	00 

00001a90 <thread_schedule>:

void thread_schedule(void) {
    1a90:	55                   	push   %ebp
    1a91:	89 e5                	mov    %esp,%ebp
    1a93:	57                   	push   %edi
    1a94:	56                   	push   %esi
    1a95:	53                   	push   %ebx
    1a96:	83 ec 0c             	sub    $0xc,%esp
    thread_t *old_thread, *new_thread;
    int start, i, idx;
    
    old_thread = current_thread;
    1a99:	8b 35 44 43 00 00    	mov    0x4344,%esi
    new_thread = 0;
    
    start = (current_thread->tid + 1) % MAX_THREADS;
    1a9f:	8b 06                	mov    (%esi),%eax
    1aa1:	8d 50 01             	lea    0x1(%eax),%edx
    1aa4:	89 d0                	mov    %edx,%eax
    1aa6:	c1 f8 1f             	sar    $0x1f,%eax
    1aa9:	c1 e8 1a             	shr    $0x1a,%eax
    1aac:	01 c2                	add    %eax,%edx
    1aae:	83 e2 3f             	and    $0x3f,%edx
    1ab1:	29 c2                	sub    %eax,%edx
    1ab3:	8d 5a 40             	lea    0x40(%edx),%ebx
    1ab6:	eb 0f                	jmp    1ac7 <thread_schedule+0x37>
    1ab8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1abf:	00 
    for (i = 0; i < MAX_THREADS; i++) {
    1ac0:	83 c2 01             	add    $0x1,%edx
    1ac3:	39 da                	cmp    %ebx,%edx
    1ac5:	74 71                	je     1b38 <thread_schedule+0xa8>
        idx = (start + i) % MAX_THREADS;
    1ac7:	89 d1                	mov    %edx,%ecx
    1ac9:	c1 f9 1f             	sar    $0x1f,%ecx
    1acc:	c1 e9 1a             	shr    $0x1a,%ecx
    1acf:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
    1ad2:	83 e0 3f             	and    $0x3f,%eax
    1ad5:	29 c8                	sub    %ecx,%eax
        if (threads[idx].state == T_RUNNABLE) {
    1ad7:	6b c8 44             	imul   $0x44,%eax,%ecx
    1ada:	83 b9 64 43 00 00 01 	cmpl   $0x1,0x4364(%ecx)
    1ae1:	8d b9 60 43 00 00    	lea    0x4360(%ecx),%edi
    1ae7:	75 d7                	jne    1ac0 <thread_schedule+0x30>
        
        printf(1, "[uthreads] All threads finished or blocked\n");
        exit();
    }
    
    if (new_thread == old_thread) {
    1ae9:	39 fe                	cmp    %edi,%esi
    1aeb:	74 6b                	je     1b58 <thread_schedule+0xc8>
            old_thread->state = T_RUNNING;
        }
        return;
    }
    
    if (old_thread->state == T_RUNNING) {
    1aed:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
    1af1:	74 35                	je     1b28 <thread_schedule+0x98>
        old_thread->state = T_RUNNABLE;
    }
    new_thread->state = T_RUNNING;
    1af3:	6b c0 44             	imul   $0x44,%eax,%eax
    current_thread = new_thread;
    
    thread_switch(&old_thread->context, &new_thread->context);
    1af6:	83 ec 08             	sub    $0x8,%esp
    1af9:	81 c1 6c 43 00 00    	add    $0x436c,%ecx
    1aff:	83 c6 0c             	add    $0xc,%esi
    current_thread = new_thread;
    1b02:	89 3d 44 43 00 00    	mov    %edi,0x4344
    new_thread->state = T_RUNNING;
    1b08:	c7 80 64 43 00 00 02 	movl   $0x2,0x4364(%eax)
    1b0f:	00 00 00 
    thread_switch(&old_thread->context, &new_thread->context);
    1b12:	51                   	push   %ecx
    1b13:	56                   	push   %esi
    1b14:	e8 3c 09 00 00       	call   2455 <thread_switch>
    1b19:	83 c4 10             	add    $0x10,%esp
}
    1b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b1f:	5b                   	pop    %ebx
    1b20:	5e                   	pop    %esi
    1b21:	5f                   	pop    %edi
    1b22:	5d                   	pop    %ebp
    1b23:	c3                   	ret
    1b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        old_thread->state = T_RUNNABLE;
    1b28:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
    1b2f:	eb c2                	jmp    1af3 <thread_schedule+0x63>
    1b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (current_thread->state == T_RUNNING) {
    1b38:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
    1b3c:	74 de                	je     1b1c <thread_schedule+0x8c>
        printf(1, "[uthreads] All threads finished or blocked\n");
    1b3e:	50                   	push   %eax
    1b3f:	50                   	push   %eax
    1b40:	68 a8 34 00 00       	push   $0x34a8
    1b45:	6a 01                	push   $0x1
    1b47:	e8 84 fa ff ff       	call   15d0 <printf>
        exit();
    1b4c:	e8 12 f9 ff ff       	call   1463 <exit>
    1b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            old_thread->state = T_RUNNING;
    1b58:	c7 46 04 02 00 00 00 	movl   $0x2,0x4(%esi)
    1b5f:	eb bb                	jmp    1b1c <thread_schedule+0x8c>
    1b61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1b68:	00 
    1b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001b70 <thread_exit>:
void thread_exit(void *retval) {
    1b70:	55                   	push   %ebp
    1b71:	89 e5                	mov    %esp,%ebp
    1b73:	83 ec 0c             	sub    $0xc,%esp
    current_thread->retval = retval;
    1b76:	a1 44 43 00 00       	mov    0x4344,%eax
    1b7b:	8b 55 08             	mov    0x8(%ebp),%edx
    current_thread->state = T_ZOMBIE;
    1b7e:	c7 40 04 04 00 00 00 	movl   $0x4,0x4(%eax)
    current_thread->retval = retval;
    1b85:	89 50 38             	mov    %edx,0x38(%eax)
    printf(1, "[uthreads] Thread tid=%d exiting\n", current_thread->tid);
    1b88:	ff 30                	push   (%eax)
    1b8a:	68 d4 34 00 00       	push   $0x34d4
    1b8f:	6a 01                	push   $0x1
    1b91:	e8 3a fa ff ff       	call   15d0 <printf>
    if (current_thread->join_waiter) {
    1b96:	a1 44 43 00 00       	mov    0x4344,%eax
    1b9b:	83 c4 10             	add    $0x10,%esp
    1b9e:	8b 50 3c             	mov    0x3c(%eax),%edx
    1ba1:	85 d2                	test   %edx,%edx
    1ba3:	74 11                	je     1bb6 <thread_exit+0x46>
        current_thread->join_waiter->state = T_RUNNABLE;
    1ba5:	c7 42 04 01 00 00 00 	movl   $0x1,0x4(%edx)
        current_thread->join_waiter->sleep_chan = 0;
    1bac:	8b 40 3c             	mov    0x3c(%eax),%eax
    1baf:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
    thread_schedule();
    1bb6:	e8 d5 fe ff ff       	call   1a90 <thread_schedule>
    printf(2, "[uthreads] Error: thread_exit should not return\n");
    1bbb:	83 ec 08             	sub    $0x8,%esp
    1bbe:	68 f8 34 00 00       	push   $0x34f8
    1bc3:	6a 02                	push   $0x2
    1bc5:	e8 06 fa ff ff       	call   15d0 <printf>
    exit();
    1bca:	e8 94 f8 ff ff       	call   1463 <exit>
    1bcf:	90                   	nop

00001bd0 <thread_entry>:
static void thread_entry(void) {
    1bd0:	55                   	push   %ebp
    1bd1:	89 e5                	mov    %esp,%ebp
    1bd3:	83 ec 14             	sub    $0x14,%esp
    void *ret = current_thread->start_routine(current_thread->arg);
    1bd6:	a1 44 43 00 00       	mov    0x4344,%eax
    1bdb:	ff 70 34             	push   0x34(%eax)
    1bde:	ff 50 30             	call   *0x30(%eax)
    thread_exit(ret);
    1be1:	89 04 24             	mov    %eax,(%esp)
    1be4:	e8 87 ff ff ff       	call   1b70 <thread_exit>
    1be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001bf0 <thread_join>:
void *thread_join(int tid) {
    1bf0:	55                   	push   %ebp
    1bf1:	89 e5                	mov    %esp,%ebp
    1bf3:	57                   	push   %edi
    1bf4:	56                   	push   %esi
    1bf5:	53                   	push   %ebx
    1bf6:	83 ec 0c             	sub    $0xc,%esp
    1bf9:	8b 75 08             	mov    0x8(%ebp),%esi
    if (tid < 0 || tid >= MAX_THREADS)
    1bfc:	83 fe 3f             	cmp    $0x3f,%esi
    1bff:	77 67                	ja     1c68 <thread_join+0x78>
    if (threads[tid].state == T_UNUSED)
    1c01:	6b de 44             	imul   $0x44,%esi,%ebx
    1c04:	81 c3 60 43 00 00    	add    $0x4360,%ebx
    1c0a:	8b 43 04             	mov    0x4(%ebx),%eax
    1c0d:	85 c0                	test   %eax,%eax
    1c0f:	74 57                	je     1c68 <thread_join+0x78>
    if (!t || t == current_thread) {
    1c11:	39 1d 44 43 00 00    	cmp    %ebx,0x4344
    1c17:	74 4f                	je     1c68 <thread_join+0x78>
    while (t->state != T_ZOMBIE) {
    1c19:	83 f8 04             	cmp    $0x4,%eax
    1c1c:	75 1f                	jne    1c3d <thread_join+0x4d>
    1c1e:	eb 60                	jmp    1c80 <thread_join+0x90>
        t->join_waiter = current_thread;
    1c20:	a1 44 43 00 00       	mov    0x4344,%eax
    1c25:	89 43 3c             	mov    %eax,0x3c(%ebx)
        current_thread->sleep_chan = t;
    1c28:	89 58 40             	mov    %ebx,0x40(%eax)
        current_thread->state = T_SLEEPING;
    1c2b:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
        thread_schedule();
    1c32:	e8 59 fe ff ff       	call   1a90 <thread_schedule>
    while (t->state != T_ZOMBIE) {
    1c37:	83 7b 04 04          	cmpl   $0x4,0x4(%ebx)
    1c3b:	74 43                	je     1c80 <thread_join+0x90>
        if (t->join_waiter) {
    1c3d:	8b 43 3c             	mov    0x3c(%ebx),%eax
    1c40:	85 c0                	test   %eax,%eax
    1c42:	74 dc                	je     1c20 <thread_join+0x30>
            printf(2, "[uthreads] Error: Thread tid=%d already being joined\n", tid);
    1c44:	83 ec 04             	sub    $0x4,%esp
    1c47:	56                   	push   %esi
    1c48:	68 5c 35 00 00       	push   $0x355c
    1c4d:	6a 02                	push   $0x2
    1c4f:	e8 7c f9 ff ff       	call   15d0 <printf>
            return 0;
    1c54:	83 c4 10             	add    $0x10,%esp
}
    1c57:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1c5a:	31 ff                	xor    %edi,%edi
}
    1c5c:	5b                   	pop    %ebx
    1c5d:	89 f8                	mov    %edi,%eax
    1c5f:	5e                   	pop    %esi
    1c60:	5f                   	pop    %edi
    1c61:	5d                   	pop    %ebp
    1c62:	c3                   	ret
    1c63:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "[uthreads] Error: Invalid join target tid=%d\n", tid);
    1c68:	83 ec 04             	sub    $0x4,%esp
    1c6b:	56                   	push   %esi
    1c6c:	68 2c 35 00 00       	push   $0x352c
    1c71:	6a 02                	push   $0x2
    1c73:	e8 58 f9 ff ff       	call   15d0 <printf>
        return 0;
    1c78:	83 c4 10             	add    $0x10,%esp
    1c7b:	eb da                	jmp    1c57 <thread_join+0x67>
    1c7d:	8d 76 00             	lea    0x0(%esi),%esi
    retval = t->retval;
    1c80:	6b de 44             	imul   $0x44,%esi,%ebx
    1c83:	81 c3 60 43 00 00    	add    $0x4360,%ebx
    if (t->stack) {
    1c89:	8b 43 08             	mov    0x8(%ebx),%eax
    retval = t->retval;
    1c8c:	8b 7b 38             	mov    0x38(%ebx),%edi
    if (t->stack) {
    1c8f:	85 c0                	test   %eax,%eax
    1c91:	74 13                	je     1ca6 <thread_join+0xb6>
        free(t->stack);
    1c93:	83 ec 0c             	sub    $0xc,%esp
    1c96:	50                   	push   %eax
    1c97:	e8 c4 fa ff ff       	call   1760 <free>
        t->stack = 0;
    1c9c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    1ca3:	83 c4 10             	add    $0x10,%esp
    t->state = T_UNUSED;
    1ca6:	6b c6 44             	imul   $0x44,%esi,%eax
    printf(1, "[uthreads] Thread tid=%d joined\n", tid);
    1ca9:	83 ec 04             	sub    $0x4,%esp
    t->state = T_UNUSED;
    1cac:	c7 80 64 43 00 00 00 	movl   $0x0,0x4364(%eax)
    1cb3:	00 00 00 
    printf(1, "[uthreads] Thread tid=%d joined\n", tid);
    1cb6:	56                   	push   %esi
    1cb7:	68 94 35 00 00       	push   $0x3594
    1cbc:	6a 01                	push   $0x1
    1cbe:	e8 0d f9 ff ff       	call   15d0 <printf>
    return retval;
    1cc3:	83 c4 10             	add    $0x10,%esp
}
    1cc6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cc9:	89 f8                	mov    %edi,%eax
    1ccb:	5b                   	pop    %ebx
    1ccc:	5e                   	pop    %esi
    1ccd:	5f                   	pop    %edi
    1cce:	5d                   	pop    %ebp
    1ccf:	c3                   	ret

00001cd0 <thread_yield>:
    current_thread->state = T_RUNNABLE;
    1cd0:	a1 44 43 00 00       	mov    0x4344,%eax
    1cd5:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    thread_schedule();
    1cdc:	e9 af fd ff ff       	jmp    1a90 <thread_schedule>
    1ce1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1ce8:	00 
    1ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001cf0 <thread_sleep>:

void thread_sleep(void *chan) {
    1cf0:	55                   	push   %ebp
    current_thread->sleep_chan = chan;
    1cf1:	a1 44 43 00 00       	mov    0x4344,%eax
    current_thread->state = T_SLEEPING;
    1cf6:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
void thread_sleep(void *chan) {
    1cfd:	89 e5                	mov    %esp,%ebp
    current_thread->sleep_chan = chan;
    1cff:	8b 55 08             	mov    0x8(%ebp),%edx
    1d02:	89 50 40             	mov    %edx,0x40(%eax)
    thread_schedule();
}
    1d05:	5d                   	pop    %ebp
    thread_schedule();
    1d06:	e9 85 fd ff ff       	jmp    1a90 <thread_schedule>
    1d0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00001d10 <thread_wakeup>:

void thread_wakeup(void *chan) {
    1d10:	55                   	push   %ebp
    1d11:	b8 64 43 00 00       	mov    $0x4364,%eax
    1d16:	ba 64 54 00 00       	mov    $0x5464,%edx
    1d1b:	89 e5                	mov    %esp,%ebp
    1d1d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1d20:	eb 0d                	jmp    1d2f <thread_wakeup+0x1f>
    1d22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
    1d28:	83 c0 44             	add    $0x44,%eax
    1d2b:	39 c2                	cmp    %eax,%edx
    1d2d:	74 1e                	je     1d4d <thread_wakeup+0x3d>
        if (threads[i].state == T_SLEEPING && threads[i].sleep_chan == chan) {
    1d2f:	83 38 03             	cmpl   $0x3,(%eax)
    1d32:	75 f4                	jne    1d28 <thread_wakeup+0x18>
    1d34:	39 48 3c             	cmp    %ecx,0x3c(%eax)
    1d37:	75 ef                	jne    1d28 <thread_wakeup+0x18>
            threads[i].state = T_RUNNABLE;
    1d39:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
    1d3f:	83 c0 44             	add    $0x44,%eax
            threads[i].sleep_chan = 0;
    1d42:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
    1d49:	39 c2                	cmp    %eax,%edx
    1d4b:	75 e2                	jne    1d2f <thread_wakeup+0x1f>
        }
    }
}
    1d4d:	5d                   	pop    %ebp
    1d4e:	c3                   	ret
    1d4f:	90                   	nop

00001d50 <mutex_init>:
#include "types.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

void mutex_init(mutex_t *m) {
    1d50:	55                   	push   %ebp
    1d51:	89 e5                	mov    %esp,%ebp
    1d53:	8b 45 08             	mov    0x8(%ebp),%eax
    m->locked = 0;
    1d56:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    m->owner = -1;
    1d5c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    m->wait_chan = m;
    1d63:	89 40 08             	mov    %eax,0x8(%eax)
}
    1d66:	5d                   	pop    %ebp
    1d67:	c3                   	ret
    1d68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1d6f:	00 

00001d70 <mutex_lock>:

void mutex_lock(mutex_t *m) {
    1d70:	55                   	push   %ebp
    1d71:	89 e5                	mov    %esp,%ebp
    1d73:	53                   	push   %ebx
    1d74:	83 ec 04             	sub    $0x4,%esp
    1d77:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    1d7a:	8b 13                	mov    (%ebx),%edx
    1d7c:	85 d2                	test   %edx,%edx
    1d7e:	74 14                	je     1d94 <mutex_lock+0x24>
        thread_sleep(m->wait_chan);
    1d80:	83 ec 0c             	sub    $0xc,%esp
    1d83:	ff 73 08             	push   0x8(%ebx)
    1d86:	e8 65 ff ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    1d8b:	8b 03                	mov    (%ebx),%eax
    1d8d:	83 c4 10             	add    $0x10,%esp
    1d90:	85 c0                	test   %eax,%eax
    1d92:	75 ec                	jne    1d80 <mutex_lock+0x10>
    }
    
    m->locked = 1;
    1d94:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
    1d9a:	e8 e1 fc ff ff       	call   1a80 <thread_self>
    1d9f:	89 43 04             	mov    %eax,0x4(%ebx)
}
    1da2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1da5:	c9                   	leave
    1da6:	c3                   	ret
    1da7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1dae:	00 
    1daf:	90                   	nop

00001db0 <mutex_unlock>:

void mutex_unlock(mutex_t *m) {
    1db0:	55                   	push   %ebp
    1db1:	89 e5                	mov    %esp,%ebp
    1db3:	56                   	push   %esi
    1db4:	53                   	push   %ebx
    1db5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (m->owner != thread_self()) {
    1db8:	8b 73 04             	mov    0x4(%ebx),%esi
    1dbb:	e8 c0 fc ff ff       	call   1a80 <thread_self>
    1dc0:	39 c6                	cmp    %eax,%esi
    1dc2:	74 1c                	je     1de0 <mutex_unlock+0x30>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    1dc4:	83 ec 08             	sub    $0x8,%esp
    1dc7:	68 b8 35 00 00       	push   $0x35b8
    1dcc:	6a 02                	push   $0x2
    1dce:	e8 fd f7 ff ff       	call   15d0 <printf>
        return;
    1dd3:	83 c4 10             	add    $0x10,%esp
    
    m->locked = 0;
    m->owner = -1;
    
    thread_wakeup(m->wait_chan);
}
    1dd6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1dd9:	5b                   	pop    %ebx
    1dda:	5e                   	pop    %esi
    1ddb:	5d                   	pop    %ebp
    1ddc:	c3                   	ret
    1ddd:	8d 76 00             	lea    0x0(%esi),%esi
    thread_wakeup(m->wait_chan);
    1de0:	8b 43 08             	mov    0x8(%ebx),%eax
    m->locked = 0;
    1de3:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    m->owner = -1;
    1de9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
    thread_wakeup(m->wait_chan);
    1df0:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1df3:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1df6:	5b                   	pop    %ebx
    1df7:	5e                   	pop    %esi
    1df8:	5d                   	pop    %ebp
    thread_wakeup(m->wait_chan);
    1df9:	e9 12 ff ff ff       	jmp    1d10 <thread_wakeup>
    1dfe:	66 90                	xchg   %ax,%ax

00001e00 <mutex_trylock>:

int mutex_trylock(mutex_t *m) {
    1e00:	55                   	push   %ebp
    1e01:	89 e5                	mov    %esp,%ebp
    1e03:	53                   	push   %ebx
    1e04:	83 ec 04             	sub    $0x4,%esp
    1e07:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (m->locked) {
    1e0a:	8b 03                	mov    (%ebx),%eax
    1e0c:	85 c0                	test   %eax,%eax
    1e0e:	74 10                	je     1e20 <mutex_trylock+0x20>
    }
    
    m->locked = 1;
    m->owner = thread_self();
    return 1;
}
    1e10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1e13:	31 c0                	xor    %eax,%eax
    1e15:	c9                   	leave
    1e16:	c3                   	ret
    1e17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1e1e:	00 
    1e1f:	90                   	nop
    m->locked = 1;
    1e20:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
    1e26:	e8 55 fc ff ff       	call   1a80 <thread_self>
    1e2b:	89 43 04             	mov    %eax,0x4(%ebx)
    return 1;
    1e2e:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1e33:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1e36:	c9                   	leave
    1e37:	c3                   	ret
    1e38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1e3f:	00 

00001e40 <cond_init>:

void cond_init(cond_t *c) {
    1e40:	55                   	push   %ebp
    1e41:	89 e5                	mov    %esp,%ebp
    1e43:	8b 45 08             	mov    0x8(%ebp),%eax
    c->wait_chan = c;
    1e46:	89 00                	mov    %eax,(%eax)
}
    1e48:	5d                   	pop    %ebp
    1e49:	c3                   	ret
    1e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001e50 <cond_wait>:

void cond_wait(cond_t *c, mutex_t *m) {
    1e50:	55                   	push   %ebp
    1e51:	89 e5                	mov    %esp,%ebp
    1e53:	57                   	push   %edi
    1e54:	56                   	push   %esi
    1e55:	53                   	push   %ebx
    1e56:	83 ec 0c             	sub    $0xc,%esp
    1e59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    1e5c:	8b 7d 08             	mov    0x8(%ebp),%edi
    if (m->owner != thread_self()) {
    1e5f:	8b 73 04             	mov    0x4(%ebx),%esi
    1e62:	e8 19 fc ff ff       	call   1a80 <thread_self>
    1e67:	39 c6                	cmp    %eax,%esi
    1e69:	74 1d                	je     1e88 <cond_wait+0x38>
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
    1e6b:	c7 45 0c 00 36 00 00 	movl   $0x3600,0xc(%ebp)
    1e72:	c7 45 08 02 00 00 00 	movl   $0x2,0x8(%ebp)
    thread_wakeup(m->wait_chan);
    
    thread_sleep(c->wait_chan);
    
    mutex_lock(m);
}
    1e79:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1e7c:	5b                   	pop    %ebx
    1e7d:	5e                   	pop    %esi
    1e7e:	5f                   	pop    %edi
    1e7f:	5d                   	pop    %ebp
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
    1e80:	e9 4b f7 ff ff       	jmp    15d0 <printf>
    1e85:	8d 76 00             	lea    0x0(%esi),%esi
    thread_wakeup(m->wait_chan);
    1e88:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1e8b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    m->owner = -1;
    1e91:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
    thread_wakeup(m->wait_chan);
    1e98:	ff 73 08             	push   0x8(%ebx)
    1e9b:	e8 70 fe ff ff       	call   1d10 <thread_wakeup>
    thread_sleep(c->wait_chan);
    1ea0:	5a                   	pop    %edx
    1ea1:	ff 37                	push   (%edi)
    1ea3:	e8 48 fe ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    1ea8:	8b 0b                	mov    (%ebx),%ecx
    1eaa:	83 c4 10             	add    $0x10,%esp
    1ead:	85 c9                	test   %ecx,%ecx
    1eaf:	74 1b                	je     1ecc <cond_wait+0x7c>
    1eb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    1eb8:	83 ec 0c             	sub    $0xc,%esp
    1ebb:	ff 73 08             	push   0x8(%ebx)
    1ebe:	e8 2d fe ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    1ec3:	8b 03                	mov    (%ebx),%eax
    1ec5:	83 c4 10             	add    $0x10,%esp
    1ec8:	85 c0                	test   %eax,%eax
    1eca:	75 ec                	jne    1eb8 <cond_wait+0x68>
    m->locked = 1;
    1ecc:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
    1ed2:	e8 a9 fb ff ff       	call   1a80 <thread_self>
    1ed7:	89 43 04             	mov    %eax,0x4(%ebx)
}
    1eda:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1edd:	5b                   	pop    %ebx
    1ede:	5e                   	pop    %esi
    1edf:	5f                   	pop    %edi
    1ee0:	5d                   	pop    %ebp
    1ee1:	c3                   	ret
    1ee2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1ee9:	00 
    1eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001ef0 <cond_signal>:

void cond_signal(cond_t *c) {
    1ef0:	55                   	push   %ebp
    1ef1:	89 e5                	mov    %esp,%ebp
    thread_wakeup(c->wait_chan);
    1ef3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ef6:	8b 00                	mov    (%eax),%eax
    1ef8:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1efb:	5d                   	pop    %ebp
    thread_wakeup(c->wait_chan);
    1efc:	e9 0f fe ff ff       	jmp    1d10 <thread_wakeup>
    1f01:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1f08:	00 
    1f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001f10 <cond_broadcast>:

void cond_broadcast(cond_t *c) {
    1f10:	55                   	push   %ebp
    1f11:	89 e5                	mov    %esp,%ebp
    1f13:	8b 45 08             	mov    0x8(%ebp),%eax
    1f16:	8b 00                	mov    (%eax),%eax
    1f18:	89 45 08             	mov    %eax,0x8(%ebp)
    1f1b:	5d                   	pop    %ebp
    1f1c:	e9 ef fd ff ff       	jmp    1d10 <thread_wakeup>
    1f21:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1f28:	00 
    1f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001f30 <channel_create>:
    thread_wakeup(c->wait_chan);
}

channel_t *channel_create(int capacity) {
    1f30:	55                   	push   %ebp
    1f31:	89 e5                	mov    %esp,%ebp
    1f33:	56                   	push   %esi
    1f34:	53                   	push   %ebx
    1f35:	8b 75 08             	mov    0x8(%ebp),%esi
    channel_t *ch;
    
    if (capacity <= 0) {
    1f38:	85 f6                	test   %esi,%esi
    1f3a:	0f 8e 90 00 00 00    	jle    1fd0 <channel_create+0xa0>
        printf(2, "[uthreads] Error: Channel capacity must be greater than 0\n");
        return 0;
    }
    
    ch = (channel_t*)malloc(sizeof(channel_t));
    1f40:	83 ec 0c             	sub    $0xc,%esp
    1f43:	6a 2c                	push   $0x2c
    1f45:	e8 a6 f8 ff ff       	call   17f0 <malloc>
    if (!ch) {
    1f4a:	83 c4 10             	add    $0x10,%esp
    ch = (channel_t*)malloc(sizeof(channel_t));
    1f4d:	89 c3                	mov    %eax,%ebx
    if (!ch) {
    1f4f:	85 c0                	test   %eax,%eax
    1f51:	0f 84 99 00 00 00    	je     1ff0 <channel_create+0xc0>
        printf(2, "[uthreads] Error: Channel allocation failed\n");
        return 0;
    }
    
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
    1f57:	83 ec 0c             	sub    $0xc,%esp
    1f5a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
    1f61:	50                   	push   %eax
    1f62:	e8 89 f8 ff ff       	call   17f0 <malloc>
    if (!ch->buffer) {
    1f67:	83 c4 10             	add    $0x10,%esp
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
    1f6a:	89 03                	mov    %eax,(%ebx)
    if (!ch->buffer) {
    1f6c:	85 c0                	test   %eax,%eax
    1f6e:	0f 84 9c 00 00 00    	je     2010 <channel_create+0xe0>
    ch->count = 0;
    ch->read_idx = 0;
    ch->write_idx = 0;
    ch->is_closed = 0;
    
    mutex_init(&ch->lock);
    1f74:	8d 43 18             	lea    0x18(%ebx),%eax
    cond_init(&ch->not_empty);
    cond_init(&ch->not_full);
    
    printf(1, "[uthreads] Channel created successfully, capacity=%d\n", capacity);
    1f77:	83 ec 04             	sub    $0x4,%esp
    ch->capacity = capacity;
    1f7a:	89 73 04             	mov    %esi,0x4(%ebx)
    mutex_init(&ch->lock);
    1f7d:	89 43 20             	mov    %eax,0x20(%ebx)
    cond_init(&ch->not_empty);
    1f80:	8d 43 24             	lea    0x24(%ebx),%eax
    1f83:	89 43 24             	mov    %eax,0x24(%ebx)
    cond_init(&ch->not_full);
    1f86:	8d 43 28             	lea    0x28(%ebx),%eax
    ch->count = 0;
    1f89:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    ch->read_idx = 0;
    1f90:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    ch->write_idx = 0;
    1f97:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    ch->is_closed = 0;
    1f9e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    m->locked = 0;
    1fa5:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    1fac:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    cond_init(&ch->not_full);
    1fb3:	89 43 28             	mov    %eax,0x28(%ebx)
    printf(1, "[uthreads] Channel created successfully, capacity=%d\n", capacity);
    1fb6:	56                   	push   %esi
    1fb7:	68 dc 36 00 00       	push   $0x36dc
    1fbc:	6a 01                	push   $0x1
    1fbe:	e8 0d f6 ff ff       	call   15d0 <printf>
    return ch;
    1fc3:	83 c4 10             	add    $0x10,%esp
}
    1fc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1fc9:	89 d8                	mov    %ebx,%eax
    1fcb:	5b                   	pop    %ebx
    1fcc:	5e                   	pop    %esi
    1fcd:	5d                   	pop    %ebp
    1fce:	c3                   	ret
    1fcf:	90                   	nop
        printf(2, "[uthreads] Error: Channel capacity must be greater than 0\n");
    1fd0:	83 ec 08             	sub    $0x8,%esp
        return 0;
    1fd3:	31 db                	xor    %ebx,%ebx
        printf(2, "[uthreads] Error: Channel capacity must be greater than 0\n");
    1fd5:	68 3c 36 00 00       	push   $0x363c
    1fda:	6a 02                	push   $0x2
    1fdc:	e8 ef f5 ff ff       	call   15d0 <printf>
        return 0;
    1fe1:	83 c4 10             	add    $0x10,%esp
    1fe4:	eb e0                	jmp    1fc6 <channel_create+0x96>
    1fe6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1fed:	00 
    1fee:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] Error: Channel allocation failed\n");
    1ff0:	83 ec 08             	sub    $0x8,%esp
        return 0;
    1ff3:	31 db                	xor    %ebx,%ebx
        printf(2, "[uthreads] Error: Channel allocation failed\n");
    1ff5:	68 78 36 00 00       	push   $0x3678
    1ffa:	6a 02                	push   $0x2
    1ffc:	e8 cf f5 ff ff       	call   15d0 <printf>
        return 0;
    2001:	83 c4 10             	add    $0x10,%esp
    2004:	eb c0                	jmp    1fc6 <channel_create+0x96>
    2006:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    200d:	00 
    200e:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] Error: Channel buffer allocation failed\n");
    2010:	83 ec 08             	sub    $0x8,%esp
    2013:	68 a8 36 00 00       	push   $0x36a8
    2018:	6a 02                	push   $0x2
    201a:	e8 b1 f5 ff ff       	call   15d0 <printf>
        free(ch);
    201f:	89 1c 24             	mov    %ebx,(%esp)
        return 0;
    2022:	31 db                	xor    %ebx,%ebx
        free(ch);
    2024:	e8 37 f7 ff ff       	call   1760 <free>
        return 0;
    2029:	83 c4 10             	add    $0x10,%esp
    202c:	eb 98                	jmp    1fc6 <channel_create+0x96>
    202e:	66 90                	xchg   %ax,%ax

00002030 <channel_send>:

int channel_send(channel_t *ch, void *data) {
    2030:	55                   	push   %ebp
    2031:	89 e5                	mov    %esp,%ebp
    2033:	57                   	push   %edi
    2034:	56                   	push   %esi
    2035:	53                   	push   %ebx
    2036:	83 ec 0c             	sub    $0xc,%esp
    2039:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    203c:	8b 7b 18             	mov    0x18(%ebx),%edi
    203f:	85 ff                	test   %edi,%edi
    2041:	74 1a                	je     205d <channel_send+0x2d>
    2043:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    2048:	83 ec 0c             	sub    $0xc,%esp
    204b:	ff 73 20             	push   0x20(%ebx)
    204e:	e8 9d fc ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    2053:	8b 73 18             	mov    0x18(%ebx),%esi
    2056:	83 c4 10             	add    $0x10,%esp
    2059:	85 f6                	test   %esi,%esi
    205b:	75 eb                	jne    2048 <channel_send+0x18>
    m->locked = 1;
    205d:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    2064:	e8 17 fa ff ff       	call   1a80 <thread_self>
    mutex_lock(&ch->lock);
    
    if (ch->is_closed) {
    2069:	8b 73 14             	mov    0x14(%ebx),%esi
    m->owner = thread_self();
    206c:	89 43 1c             	mov    %eax,0x1c(%ebx)
    206f:	89 c7                	mov    %eax,%edi
    if (ch->is_closed) {
    2071:	85 f6                	test   %esi,%esi
    2073:	0f 85 56 01 00 00    	jne    21cf <channel_send+0x19f>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    while (ch->count == ch->capacity && !ch->is_closed) {
    2079:	8b 43 04             	mov    0x4(%ebx),%eax
    207c:	39 43 08             	cmp    %eax,0x8(%ebx)
    207f:	74 34                	je     20b5 <channel_send+0x85>
    2081:	e9 9d 00 00 00       	jmp    2123 <channel_send+0xf3>
    2086:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    208d:	00 
    208e:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
    2090:	83 ec 08             	sub    $0x8,%esp
    2093:	68 00 36 00 00       	push   $0x3600
    2098:	6a 02                	push   $0x2
    209a:	e8 31 f5 ff ff       	call   15d0 <printf>
        cond_wait(&ch->not_full, &ch->lock);
    }
    
    if (ch->is_closed) {
    209f:	8b 43 14             	mov    0x14(%ebx),%eax
    while (ch->count == ch->capacity && !ch->is_closed) {
    20a2:	8b 4b 04             	mov    0x4(%ebx),%ecx
        return;
    20a5:	83 c4 10             	add    $0x10,%esp
    while (ch->count == ch->capacity && !ch->is_closed) {
    20a8:	39 4b 08             	cmp    %ecx,0x8(%ebx)
    20ab:	75 72                	jne    211f <channel_send+0xef>
    20ad:	85 c0                	test   %eax,%eax
    20af:	0f 85 eb 00 00 00    	jne    21a0 <channel_send+0x170>
    if (m->owner != thread_self()) {
    20b5:	8b 7b 1c             	mov    0x1c(%ebx),%edi
    20b8:	e8 c3 f9 ff ff       	call   1a80 <thread_self>
    20bd:	39 c7                	cmp    %eax,%edi
    20bf:	75 cf                	jne    2090 <channel_send+0x60>
    thread_wakeup(m->wait_chan);
    20c1:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    20c4:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    20cb:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    20d2:	ff 73 20             	push   0x20(%ebx)
    20d5:	e8 36 fc ff ff       	call   1d10 <thread_wakeup>
    thread_sleep(c->wait_chan);
    20da:	5a                   	pop    %edx
    20db:	ff 73 28             	push   0x28(%ebx)
    20de:	e8 0d fc ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    20e3:	8b 4b 18             	mov    0x18(%ebx),%ecx
    20e6:	83 c4 10             	add    $0x10,%esp
    20e9:	85 c9                	test   %ecx,%ecx
    20eb:	74 18                	je     2105 <channel_send+0xd5>
    20ed:	8d 76 00             	lea    0x0(%esi),%esi
        thread_sleep(m->wait_chan);
    20f0:	83 ec 0c             	sub    $0xc,%esp
    20f3:	ff 73 20             	push   0x20(%ebx)
    20f6:	e8 f5 fb ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    20fb:	8b 43 18             	mov    0x18(%ebx),%eax
    20fe:	83 c4 10             	add    $0x10,%esp
    2101:	85 c0                	test   %eax,%eax
    2103:	75 eb                	jne    20f0 <channel_send+0xc0>
    m->locked = 1;
    2105:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    210c:	e8 6f f9 ff ff       	call   1a80 <thread_self>
    while (ch->count == ch->capacity && !ch->is_closed) {
    2111:	8b 4b 04             	mov    0x4(%ebx),%ecx
    m->owner = thread_self();
    2114:	89 43 1c             	mov    %eax,0x1c(%ebx)
    if (ch->is_closed) {
    2117:	8b 43 14             	mov    0x14(%ebx),%eax
    while (ch->count == ch->capacity && !ch->is_closed) {
    211a:	39 4b 08             	cmp    %ecx,0x8(%ebx)
    211d:	74 8e                	je     20ad <channel_send+0x7d>
    if (ch->is_closed) {
    211f:	85 c0                	test   %eax,%eax
    2121:	75 7d                	jne    21a0 <channel_send+0x170>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    ch->buffer[ch->write_idx] = data;
    2123:	8b 53 10             	mov    0x10(%ebx),%edx
    2126:	8b 03                	mov    (%ebx),%eax
    thread_wakeup(c->wait_chan);
    2128:	83 ec 0c             	sub    $0xc,%esp
    ch->buffer[ch->write_idx] = data;
    212b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    212e:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    2131:	8b 43 10             	mov    0x10(%ebx),%eax
    ch->count++;
    2134:	83 43 08 01          	addl   $0x1,0x8(%ebx)
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    2138:	83 c0 01             	add    $0x1,%eax
    213b:	99                   	cltd
    213c:	f7 7b 04             	idivl  0x4(%ebx)
    213f:	89 53 10             	mov    %edx,0x10(%ebx)
    thread_wakeup(c->wait_chan);
    2142:	ff 73 24             	push   0x24(%ebx)
    2145:	e8 c6 fb ff ff       	call   1d10 <thread_wakeup>
    if (m->owner != thread_self()) {
    214a:	8b 7b 1c             	mov    0x1c(%ebx),%edi
    214d:	e8 2e f9 ff ff       	call   1a80 <thread_self>
    2152:	83 c4 10             	add    $0x10,%esp
    2155:	39 c7                	cmp    %eax,%edi
    2157:	75 27                	jne    2180 <channel_send+0x150>
    thread_wakeup(m->wait_chan);
    2159:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    215c:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    2163:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    216a:	ff 73 20             	push   0x20(%ebx)
    216d:	e8 9e fb ff ff       	call   1d10 <thread_wakeup>
    2172:	83 c4 10             	add    $0x10,%esp
    
    cond_signal(&ch->not_empty);
    
    mutex_unlock(&ch->lock);
    return 0;
}
    2175:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2178:	89 f0                	mov    %esi,%eax
    217a:	5b                   	pop    %ebx
    217b:	5e                   	pop    %esi
    217c:	5f                   	pop    %edi
    217d:	5d                   	pop    %ebp
    217e:	c3                   	ret
    217f:	90                   	nop
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    2180:	83 ec 08             	sub    $0x8,%esp
    2183:	68 b8 35 00 00       	push   $0x35b8
    2188:	6a 02                	push   $0x2
    218a:	e8 41 f4 ff ff       	call   15d0 <printf>
        return;
    218f:	83 c4 10             	add    $0x10,%esp
}
    2192:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2195:	89 f0                	mov    %esi,%eax
    2197:	5b                   	pop    %ebx
    2198:	5e                   	pop    %esi
    2199:	5f                   	pop    %edi
    219a:	5d                   	pop    %ebp
    219b:	c3                   	ret
    219c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (m->owner != thread_self()) {
    21a0:	8b 73 1c             	mov    0x1c(%ebx),%esi
    21a3:	e8 d8 f8 ff ff       	call   1a80 <thread_self>
    21a8:	39 c6                	cmp    %eax,%esi
    21aa:	75 2c                	jne    21d8 <channel_send+0x1a8>
    thread_wakeup(m->wait_chan);
    21ac:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    21af:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    21b6:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    21bd:	ff 73 20             	push   0x20(%ebx)
    21c0:	e8 4b fb ff ff       	call   1d10 <thread_wakeup>
    21c5:	83 c4 10             	add    $0x10,%esp
        return -1;
    21c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
    21cd:	eb a6                	jmp    2175 <channel_send+0x145>
    if (m->owner != thread_self()) {
    21cf:	e8 ac f8 ff ff       	call   1a80 <thread_self>
    21d4:	39 c7                	cmp    %eax,%edi
    21d6:	74 d4                	je     21ac <channel_send+0x17c>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    21d8:	83 ec 08             	sub    $0x8,%esp
    21db:	68 b8 35 00 00       	push   $0x35b8
    21e0:	6a 02                	push   $0x2
    21e2:	e8 e9 f3 ff ff       	call   15d0 <printf>
        return;
    21e7:	83 c4 10             	add    $0x10,%esp
    21ea:	eb dc                	jmp    21c8 <channel_send+0x198>
    21ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000021f0 <channel_recv>:

int channel_recv(channel_t *ch, void **data) {
    21f0:	55                   	push   %ebp
    21f1:	89 e5                	mov    %esp,%ebp
    21f3:	56                   	push   %esi
    21f4:	53                   	push   %ebx
    21f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    21f8:	8b 43 18             	mov    0x18(%ebx),%eax
    21fb:	85 c0                	test   %eax,%eax
    21fd:	74 16                	je     2215 <channel_recv+0x25>
    21ff:	90                   	nop
        thread_sleep(m->wait_chan);
    2200:	83 ec 0c             	sub    $0xc,%esp
    2203:	ff 73 20             	push   0x20(%ebx)
    2206:	e8 e5 fa ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    220b:	8b 43 18             	mov    0x18(%ebx),%eax
    220e:	83 c4 10             	add    $0x10,%esp
    2211:	85 c0                	test   %eax,%eax
    2213:	75 eb                	jne    2200 <channel_recv+0x10>
    m->locked = 1;
    2215:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    221c:	e8 5f f8 ff ff       	call   1a80 <thread_self>
    2221:	89 43 1c             	mov    %eax,0x1c(%ebx)
    mutex_lock(&ch->lock);
    
    while (ch->count == 0 && !ch->is_closed) {
    2224:	8b 43 08             	mov    0x8(%ebx),%eax
    2227:	85 c0                	test   %eax,%eax
    2229:	74 1e                	je     2249 <channel_recv+0x59>
    222b:	e9 8b 00 00 00       	jmp    22bb <channel_recv+0xcb>
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
    2230:	83 ec 08             	sub    $0x8,%esp
    2233:	68 00 36 00 00       	push   $0x3600
    2238:	6a 02                	push   $0x2
    223a:	e8 91 f3 ff ff       	call   15d0 <printf>
    while (ch->count == 0 && !ch->is_closed) {
    223f:	8b 53 08             	mov    0x8(%ebx),%edx
        return;
    2242:	83 c4 10             	add    $0x10,%esp
    while (ch->count == 0 && !ch->is_closed) {
    2245:	85 d2                	test   %edx,%edx
    2247:	75 72                	jne    22bb <channel_recv+0xcb>
    2249:	8b 43 14             	mov    0x14(%ebx),%eax
    if (m->owner != thread_self()) {
    224c:	8b 73 1c             	mov    0x1c(%ebx),%esi
    while (ch->count == 0 && !ch->is_closed) {
    224f:	85 c0                	test   %eax,%eax
    2251:	0f 85 d9 00 00 00    	jne    2330 <channel_recv+0x140>
    if (m->owner != thread_self()) {
    2257:	e8 24 f8 ff ff       	call   1a80 <thread_self>
    225c:	39 c6                	cmp    %eax,%esi
    225e:	75 d0                	jne    2230 <channel_recv+0x40>
    thread_wakeup(m->wait_chan);
    2260:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    2263:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    226a:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    2271:	ff 73 20             	push   0x20(%ebx)
    2274:	e8 97 fa ff ff       	call   1d10 <thread_wakeup>
    thread_sleep(c->wait_chan);
    2279:	5e                   	pop    %esi
    227a:	ff 73 24             	push   0x24(%ebx)
    227d:	e8 6e fa ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    2282:	8b 43 18             	mov    0x18(%ebx),%eax
    2285:	83 c4 10             	add    $0x10,%esp
    2288:	85 c0                	test   %eax,%eax
    228a:	74 19                	je     22a5 <channel_recv+0xb5>
    228c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    2290:	83 ec 0c             	sub    $0xc,%esp
    2293:	ff 73 20             	push   0x20(%ebx)
    2296:	e8 55 fa ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    229b:	8b 4b 18             	mov    0x18(%ebx),%ecx
    229e:	83 c4 10             	add    $0x10,%esp
    22a1:	85 c9                	test   %ecx,%ecx
    22a3:	75 eb                	jne    2290 <channel_recv+0xa0>
    m->locked = 1;
    22a5:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    22ac:	e8 cf f7 ff ff       	call   1a80 <thread_self>
    while (ch->count == 0 && !ch->is_closed) {
    22b1:	8b 53 08             	mov    0x8(%ebx),%edx
    m->owner = thread_self();
    22b4:	89 43 1c             	mov    %eax,0x1c(%ebx)
    while (ch->count == 0 && !ch->is_closed) {
    22b7:	85 d2                	test   %edx,%edx
    22b9:	74 8e                	je     2249 <channel_recv+0x59>
    if (ch->is_closed && ch->count == 0) {
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    *data = ch->buffer[ch->read_idx];
    22bb:	8b 53 0c             	mov    0xc(%ebx),%edx
    22be:	8b 03                	mov    (%ebx),%eax
    thread_wakeup(c->wait_chan);
    22c0:	83 ec 0c             	sub    $0xc,%esp
    *data = ch->buffer[ch->read_idx];
    22c3:	8b 14 90             	mov    (%eax,%edx,4),%edx
    22c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    22c9:	89 10                	mov    %edx,(%eax)
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    22cb:	8b 43 0c             	mov    0xc(%ebx),%eax
    ch->count--;
    22ce:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    22d2:	83 c0 01             	add    $0x1,%eax
    22d5:	99                   	cltd
    22d6:	f7 7b 04             	idivl  0x4(%ebx)
    22d9:	89 53 0c             	mov    %edx,0xc(%ebx)
    thread_wakeup(c->wait_chan);
    22dc:	ff 73 28             	push   0x28(%ebx)
    22df:	e8 2c fa ff ff       	call   1d10 <thread_wakeup>
    if (m->owner != thread_self()) {
    22e4:	8b 73 1c             	mov    0x1c(%ebx),%esi
    22e7:	e8 94 f7 ff ff       	call   1a80 <thread_self>
    22ec:	83 c4 10             	add    $0x10,%esp
    22ef:	39 c6                	cmp    %eax,%esi
    22f1:	74 1d                	je     2310 <channel_recv+0x120>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    22f3:	83 ec 08             	sub    $0x8,%esp
    22f6:	68 b8 35 00 00       	push   $0x35b8
    22fb:	6a 02                	push   $0x2
    22fd:	e8 ce f2 ff ff       	call   15d0 <printf>
        return;
    2302:	83 c4 10             	add    $0x10,%esp
    
    cond_signal(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    return 0;
    2305:	31 c0                	xor    %eax,%eax
}
    2307:	8d 65 f8             	lea    -0x8(%ebp),%esp
    230a:	5b                   	pop    %ebx
    230b:	5e                   	pop    %esi
    230c:	5d                   	pop    %ebp
    230d:	c3                   	ret
    230e:	66 90                	xchg   %ax,%ax
    thread_wakeup(m->wait_chan);
    2310:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    2313:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    231a:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    2321:	ff 73 20             	push   0x20(%ebx)
    2324:	e8 e7 f9 ff ff       	call   1d10 <thread_wakeup>
    2329:	83 c4 10             	add    $0x10,%esp
    232c:	eb d7                	jmp    2305 <channel_recv+0x115>
    232e:	66 90                	xchg   %ax,%ax
    if (m->owner != thread_self()) {
    2330:	e8 4b f7 ff ff       	call   1a80 <thread_self>
    2335:	39 c6                	cmp    %eax,%esi
    2337:	74 19                	je     2352 <channel_recv+0x162>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    2339:	83 ec 08             	sub    $0x8,%esp
    233c:	68 b8 35 00 00       	push   $0x35b8
    2341:	6a 02                	push   $0x2
    2343:	e8 88 f2 ff ff       	call   15d0 <printf>
        return;
    2348:	83 c4 10             	add    $0x10,%esp
        return -1;
    234b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2350:	eb b5                	jmp    2307 <channel_recv+0x117>
    thread_wakeup(m->wait_chan);
    2352:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    2355:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    235c:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    2363:	ff 73 20             	push   0x20(%ebx)
    2366:	e8 a5 f9 ff ff       	call   1d10 <thread_wakeup>
    236b:	83 c4 10             	add    $0x10,%esp
    236e:	eb db                	jmp    234b <channel_recv+0x15b>

00002370 <channel_close>:

void channel_close(channel_t *ch) {
    2370:	55                   	push   %ebp
    2371:	89 e5                	mov    %esp,%ebp
    2373:	56                   	push   %esi
    2374:	53                   	push   %ebx
    2375:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    2378:	8b 4b 18             	mov    0x18(%ebx),%ecx
    237b:	85 c9                	test   %ecx,%ecx
    237d:	74 16                	je     2395 <channel_close+0x25>
    237f:	90                   	nop
        thread_sleep(m->wait_chan);
    2380:	83 ec 0c             	sub    $0xc,%esp
    2383:	ff 73 20             	push   0x20(%ebx)
    2386:	e8 65 f9 ff ff       	call   1cf0 <thread_sleep>
    while (m->locked) {
    238b:	8b 53 18             	mov    0x18(%ebx),%edx
    238e:	83 c4 10             	add    $0x10,%esp
    2391:	85 d2                	test   %edx,%edx
    2393:	75 eb                	jne    2380 <channel_close+0x10>
    m->locked = 1;
    2395:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    239c:	e8 df f6 ff ff       	call   1a80 <thread_self>
    thread_wakeup(c->wait_chan);
    23a1:	83 ec 0c             	sub    $0xc,%esp
    mutex_lock(&ch->lock);
    
    ch->is_closed = 1;
    23a4:	c7 43 14 01 00 00 00 	movl   $0x1,0x14(%ebx)
    m->owner = thread_self();
    23ab:	89 43 1c             	mov    %eax,0x1c(%ebx)
    thread_wakeup(c->wait_chan);
    23ae:	ff 73 24             	push   0x24(%ebx)
    23b1:	e8 5a f9 ff ff       	call   1d10 <thread_wakeup>
    23b6:	58                   	pop    %eax
    23b7:	ff 73 28             	push   0x28(%ebx)
    23ba:	e8 51 f9 ff ff       	call   1d10 <thread_wakeup>
    if (m->owner != thread_self()) {
    23bf:	8b 73 1c             	mov    0x1c(%ebx),%esi
    23c2:	e8 b9 f6 ff ff       	call   1a80 <thread_self>
    23c7:	83 c4 10             	add    $0x10,%esp
    23ca:	39 c6                	cmp    %eax,%esi
    23cc:	74 32                	je     2400 <channel_close+0x90>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    23ce:	83 ec 08             	sub    $0x8,%esp
    23d1:	68 b8 35 00 00       	push   $0x35b8
    23d6:	6a 02                	push   $0x2
    23d8:	e8 f3 f1 ff ff       	call   15d0 <printf>
        return;
    23dd:	83 c4 10             	add    $0x10,%esp
    cond_broadcast(&ch->not_empty);
    cond_broadcast(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    
    printf(1, "[uthreads] Channel closed\n");
    23e0:	83 ec 08             	sub    $0x8,%esp
    23e3:	68 7a 26 00 00       	push   $0x267a
    23e8:	6a 01                	push   $0x1
    23ea:	e8 e1 f1 ff ff       	call   15d0 <printf>
}
    23ef:	83 c4 10             	add    $0x10,%esp
    23f2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    23f5:	5b                   	pop    %ebx
    23f6:	5e                   	pop    %esi
    23f7:	5d                   	pop    %ebp
    23f8:	c3                   	ret
    23f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    thread_wakeup(m->wait_chan);
    2400:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    2403:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    240a:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    2411:	ff 73 20             	push   0x20(%ebx)
    2414:	e8 f7 f8 ff ff       	call   1d10 <thread_wakeup>
    2419:	83 c4 10             	add    $0x10,%esp
    241c:	eb c2                	jmp    23e0 <channel_close+0x70>
    241e:	66 90                	xchg   %ax,%ax

00002420 <channel_destroy>:

void channel_destroy(channel_t *ch) {
    2420:	55                   	push   %ebp
    2421:	89 e5                	mov    %esp,%ebp
    2423:	53                   	push   %ebx
    2424:	83 ec 04             	sub    $0x4,%esp
    2427:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (!ch)
    242a:	85 db                	test   %ebx,%ebx
    242c:	74 22                	je     2450 <channel_destroy+0x30>
        return;
    
    if (ch->buffer) {
    242e:	8b 03                	mov    (%ebx),%eax
    2430:	85 c0                	test   %eax,%eax
    2432:	74 0c                	je     2440 <channel_destroy+0x20>
        free(ch->buffer);
    2434:	83 ec 0c             	sub    $0xc,%esp
    2437:	50                   	push   %eax
    2438:	e8 23 f3 ff ff       	call   1760 <free>
    243d:	83 c4 10             	add    $0x10,%esp
    }
    free(ch);
    2440:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    2443:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2446:	c9                   	leave
    free(ch);
    2447:	e9 14 f3 ff ff       	jmp    1760 <free>
    244c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
    2450:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2453:	c9                   	leave
    2454:	c3                   	ret

00002455 <thread_switch>:
.text
.globl thread_switch
thread_switch:
    movl 4(%esp), %eax
    2455:	8b 44 24 04          	mov    0x4(%esp),%eax
    movl 8(%esp), %edx
    2459:	8b 54 24 08          	mov    0x8(%esp),%edx
    
    movl %ebx, 4(%eax)
    245d:	89 58 04             	mov    %ebx,0x4(%eax)
    movl %ecx, 8(%eax)
    2460:	89 48 08             	mov    %ecx,0x8(%eax)
    movl %esi, 16(%eax)
    2463:	89 70 10             	mov    %esi,0x10(%eax)
    movl %edi, 20(%eax)
    2466:	89 78 14             	mov    %edi,0x14(%eax)
    movl %ebp, 24(%eax)
    2469:	89 68 18             	mov    %ebp,0x18(%eax)
    movl %esp, 28(%eax)
    246c:	89 60 1c             	mov    %esp,0x1c(%eax)
    
    movl (%esp), %ecx
    246f:	8b 0c 24             	mov    (%esp),%ecx
    movl %ecx, 32(%eax)
    2472:	89 48 20             	mov    %ecx,0x20(%eax)
    
    movl 4(%edx), %ebx
    2475:	8b 5a 04             	mov    0x4(%edx),%ebx
    movl 8(%edx), %ecx
    2478:	8b 4a 08             	mov    0x8(%edx),%ecx
    movl 16(%edx), %esi
    247b:	8b 72 10             	mov    0x10(%edx),%esi
    movl 20(%edx), %edi
    247e:	8b 7a 14             	mov    0x14(%edx),%edi
    movl 24(%edx), %ebp
    2481:	8b 6a 18             	mov    0x18(%edx),%ebp
    movl 28(%edx), %esp
    2484:	8b 62 1c             	mov    0x1c(%edx),%esp
    
    movl 32(%edx), %eax
    2487:	8b 42 20             	mov    0x20(%edx),%eax
    movl %eax, (%esp)
    248a:	89 04 24             	mov    %eax,(%esp)
    
    ret
    248d:	c3                   	ret
