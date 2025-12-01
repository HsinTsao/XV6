
_reader_writer:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    
    printf(1, "[Writer%d] Finished\n", id);
    return 0;
}

int main(int argc, char *argv[]) {
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	57                   	push   %edi
       e:	56                   	push   %esi
       f:	53                   	push   %ebx
    printf(1, "========================================\n\n");
    
    thread_init();
    rwlock_init(&rwlock);
    
    for (i = 0; i < NUM_READERS; i++) {
      10:	31 db                	xor    %ebx,%ebx
int main(int argc, char *argv[]) {
      12:	51                   	push   %ecx
      13:	83 ec 40             	sub    $0x40,%esp
    printf(1, "========================================\n");
      16:	68 dc 18 00 00       	push   $0x18dc
      1b:	6a 01                	push   $0x1
      1d:	e8 8e 08 00 00       	call   8b0 <printf>
    printf(1, "  Writer-Priority Reader-Writer Lock Example\n");
      22:	5e                   	pop    %esi
      23:	5f                   	pop    %edi
      24:	68 08 19 00 00       	push   $0x1908
      29:	6a 01                	push   $0x1
      2b:	e8 80 08 00 00       	call   8b0 <printf>
    printf(1, "========================================\n\n");
      30:	58                   	pop    %eax
      31:	5a                   	pop    %edx
      32:	68 38 19 00 00       	push   $0x1938
      37:	6a 01                	push   $0x1
      39:	e8 72 08 00 00       	call   8b0 <printf>
    thread_init();
      3e:	e8 7d 0b 00 00       	call   bc0 <thread_init>
    rwlock_init(&rwlock);
      43:	c7 04 24 00 25 00 00 	movl   $0x2500,(%esp)
      4a:	e8 01 02 00 00       	call   250 <rwlock_init>
      4f:	83 c4 10             	add    $0x10,%esp
      52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        reader_tids[i] = thread_create(reader, (void*)i);
      58:	83 ec 08             	sub    $0x8,%esp
      5b:	53                   	push   %ebx
      5c:	68 20 01 00 00       	push   $0x120
      61:	e8 ea 0b 00 00       	call   c50 <thread_create>
    for (i = 0; i < NUM_READERS; i++) {
      66:	83 c4 10             	add    $0x10,%esp
        reader_tids[i] = thread_create(reader, (void*)i);
      69:	89 44 9d d4          	mov    %eax,-0x2c(%ebp,%ebx,4)
    for (i = 0; i < NUM_READERS; i++) {
      6d:	83 c3 01             	add    $0x1,%ebx
      70:	83 fb 05             	cmp    $0x5,%ebx
      73:	75 e3                	jne    58 <main+0x58>
    }
    
    for (i = 0; i < NUM_WRITERS; i++) {
        writer_tids[i] = thread_create(writer, (void*)i);
      75:	83 ec 08             	sub    $0x8,%esp
      78:	8d 75 d4             	lea    -0x2c(%ebp),%esi
      7b:	6a 00                	push   $0x0
      7d:	68 a0 03 00 00       	push   $0x3a0
      82:	e8 c9 0b 00 00       	call   c50 <thread_create>
      87:	89 c7                	mov    %eax,%edi
      89:	58                   	pop    %eax
      8a:	5a                   	pop    %edx
      8b:	6a 01                	push   $0x1
      8d:	68 a0 03 00 00       	push   $0x3a0
      92:	e8 b9 0b 00 00       	call   c50 <thread_create>
    }
    
    printf(1, "All threads created, starting execution...\n\n");
      97:	59                   	pop    %ecx
      98:	5b                   	pop    %ebx
      99:	68 64 19 00 00       	push   $0x1964
      9e:	6a 01                	push   $0x1
      a0:	8d 5d e8             	lea    -0x18(%ebp),%ebx
        writer_tids[i] = thread_create(writer, (void*)i);
      a3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    printf(1, "All threads created, starting execution...\n\n");
      a6:	e8 05 08 00 00       	call   8b0 <printf>
    
    for (i = 0; i < NUM_READERS; i++) {
      ab:	83 c4 10             	add    $0x10,%esp
      ae:	66 90                	xchg   %ax,%ax
        thread_join(reader_tids[i]);
      b0:	83 ec 0c             	sub    $0xc,%esp
      b3:	ff 36                	push   (%esi)
    for (i = 0; i < NUM_READERS; i++) {
      b5:	83 c6 04             	add    $0x4,%esi
        thread_join(reader_tids[i]);
      b8:	e8 13 0e 00 00       	call   ed0 <thread_join>
    for (i = 0; i < NUM_READERS; i++) {
      bd:	83 c4 10             	add    $0x10,%esp
      c0:	39 f3                	cmp    %esi,%ebx
      c2:	75 ec                	jne    b0 <main+0xb0>
    }
    
    for (i = 0; i < NUM_WRITERS; i++) {
        thread_join(writer_tids[i]);
      c4:	83 ec 0c             	sub    $0xc,%esp
      c7:	57                   	push   %edi
      c8:	e8 03 0e 00 00       	call   ed0 <thread_join>
      cd:	58                   	pop    %eax
      ce:	ff 75 c4             	push   -0x3c(%ebp)
      d1:	e8 fa 0d 00 00       	call   ed0 <thread_join>
    }
    
    printf(1, "\n========================================\n");
      d6:	5a                   	pop    %edx
      d7:	59                   	pop    %ecx
      d8:	68 94 19 00 00       	push   $0x1994
      dd:	6a 01                	push   $0x1
      df:	e8 cc 07 00 00       	call   8b0 <printf>
    printf(1, "All threads finished!\n");
      e4:	5b                   	pop    %ebx
      e5:	5e                   	pop    %esi
      e6:	68 dc 17 00 00       	push   $0x17dc
      eb:	6a 01                	push   $0x1
      ed:	e8 be 07 00 00       	call   8b0 <printf>
    printf(1, "Final data value: %d (expected: %d)\n", shared_data, NUM_WRITERS * WRITE_TIMES);
      f2:	6a 06                	push   $0x6
      f4:	ff 35 e0 24 00 00    	push   0x24e0
      fa:	68 c0 19 00 00       	push   $0x19c0
      ff:	6a 01                	push   $0x1
     101:	e8 aa 07 00 00       	call   8b0 <printf>
    printf(1, "========================================\n");
     106:	83 c4 18             	add    $0x18,%esp
     109:	68 dc 18 00 00       	push   $0x18dc
     10e:	6a 01                	push   $0x1
     110:	e8 9b 07 00 00       	call   8b0 <printf>
    
    exit();
     115:	e8 29 06 00 00       	call   743 <exit>
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <reader>:
void *reader(void *arg) {
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	56                   	push   %esi
    printf(1, "[Reader%d] Start\n", id);
     124:	be 03 00 00 00       	mov    $0x3,%esi
void *reader(void *arg) {
     129:	53                   	push   %ebx
     12a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    printf(1, "[Reader%d] Start\n", id);
     12d:	83 ec 04             	sub    $0x4,%esp
     130:	53                   	push   %ebx
     131:	68 70 17 00 00       	push   $0x1770
     136:	6a 01                	push   $0x1
     138:	e8 73 07 00 00       	call   8b0 <printf>
     13d:	83 c4 10             	add    $0x10,%esp
        printf(1, "[Reader%d] Request read lock...\n", id);
     140:	83 ec 04             	sub    $0x4,%esp
     143:	53                   	push   %ebx
     144:	68 18 18 00 00       	push   $0x1818
     149:	6a 01                	push   $0x1
     14b:	e8 60 07 00 00       	call   8b0 <printf>
    mutex_lock(&rw->lock);
     150:	c7 04 24 00 25 00 00 	movl   $0x2500,(%esp)
     157:	e8 f4 0e 00 00       	call   1050 <mutex_lock>
    while (rw->active_writers > 0 || rw->waiting_writers > 0) {
     15c:	83 c4 10             	add    $0x10,%esp
     15f:	eb 1c                	jmp    17d <reader+0x5d>
     161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        cond_wait(&rw->can_read, &rw->lock);
     168:	83 ec 08             	sub    $0x8,%esp
     16b:	68 00 25 00 00       	push   $0x2500
     170:	68 0c 25 00 00       	push   $0x250c
     175:	e8 b6 0f 00 00       	call   1130 <cond_wait>
     17a:	83 c4 10             	add    $0x10,%esp
    while (rw->active_writers > 0 || rw->waiting_writers > 0) {
     17d:	8b 15 18 25 00 00    	mov    0x2518,%edx
     183:	85 d2                	test   %edx,%edx
     185:	7f e1                	jg     168 <reader+0x48>
     187:	a1 1c 25 00 00       	mov    0x251c,%eax
     18c:	85 c0                	test   %eax,%eax
     18e:	7f d8                	jg     168 <reader+0x48>
    mutex_unlock(&rw->lock);
     190:	83 ec 0c             	sub    $0xc,%esp
    rw->active_readers++;
     193:	83 05 14 25 00 00 01 	addl   $0x1,0x2514
    mutex_unlock(&rw->lock);
     19a:	68 00 25 00 00       	push   $0x2500
     19f:	e8 ec 0e 00 00       	call   1090 <mutex_unlock>
        printf(1, "[Reader%d] Got read lock, data = %d\n", id, shared_data);
     1a4:	ff 35 e0 24 00 00    	push   0x24e0
     1aa:	53                   	push   %ebx
     1ab:	68 3c 18 00 00       	push   $0x183c
     1b0:	6a 01                	push   $0x1
     1b2:	e8 f9 06 00 00       	call   8b0 <printf>
        thread_yield();
     1b7:	83 c4 20             	add    $0x20,%esp
     1ba:	e8 f1 0d 00 00       	call   fb0 <thread_yield>
    mutex_lock(&rw->lock);
     1bf:	83 ec 0c             	sub    $0xc,%esp
     1c2:	68 00 25 00 00       	push   $0x2500
     1c7:	e8 84 0e 00 00       	call   1050 <mutex_lock>
    rw->active_readers--;
     1cc:	a1 14 25 00 00       	mov    0x2514,%eax
    if (rw->active_readers == 0) {
     1d1:	83 c4 10             	add    $0x10,%esp
    rw->active_readers--;
     1d4:	83 e8 01             	sub    $0x1,%eax
     1d7:	a3 14 25 00 00       	mov    %eax,0x2514
    if (rw->active_readers == 0) {
     1dc:	85 c0                	test   %eax,%eax
     1de:	74 50                	je     230 <reader+0x110>
    mutex_unlock(&rw->lock);
     1e0:	83 ec 0c             	sub    $0xc,%esp
     1e3:	68 00 25 00 00       	push   $0x2500
     1e8:	e8 a3 0e 00 00       	call   1090 <mutex_unlock>
        printf(1, "[Reader%d] Release read lock\n", id);
     1ed:	83 c4 0c             	add    $0xc,%esp
     1f0:	53                   	push   %ebx
     1f1:	68 82 17 00 00       	push   $0x1782
     1f6:	6a 01                	push   $0x1
     1f8:	e8 b3 06 00 00       	call   8b0 <printf>
        thread_yield();
     1fd:	e8 ae 0d 00 00       	call   fb0 <thread_yield>
    for (i = 0; i < READ_TIMES; i++) {
     202:	83 c4 10             	add    $0x10,%esp
     205:	83 ee 01             	sub    $0x1,%esi
     208:	0f 85 32 ff ff ff    	jne    140 <reader+0x20>
    printf(1, "[Reader%d] Finished\n", id);
     20e:	83 ec 04             	sub    $0x4,%esp
     211:	53                   	push   %ebx
     212:	68 a0 17 00 00       	push   $0x17a0
     217:	6a 01                	push   $0x1
     219:	e8 92 06 00 00       	call   8b0 <printf>
}
     21e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     221:	31 c0                	xor    %eax,%eax
     223:	5b                   	pop    %ebx
     224:	5e                   	pop    %esi
     225:	5d                   	pop    %ebp
     226:	c3                   	ret
     227:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     22e:	00 
     22f:	90                   	nop
        cond_signal(&rw->can_write);
     230:	83 ec 0c             	sub    $0xc,%esp
     233:	68 10 25 00 00       	push   $0x2510
     238:	e8 93 0f 00 00       	call   11d0 <cond_signal>
     23d:	83 c4 10             	add    $0x10,%esp
     240:	eb 9e                	jmp    1e0 <reader+0xc0>
     242:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     249:	00 
     24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000250 <rwlock_init>:
void rwlock_init(rwlock_t *rw) {
     250:	55                   	push   %ebp
     251:	89 e5                	mov    %esp,%ebp
     253:	53                   	push   %ebx
     254:	83 ec 10             	sub    $0x10,%esp
     257:	8b 5d 08             	mov    0x8(%ebp),%ebx
    mutex_init(&rw->lock);
     25a:	53                   	push   %ebx
     25b:	e8 d0 0d 00 00       	call   1030 <mutex_init>
    cond_init(&rw->can_read);
     260:	8d 43 0c             	lea    0xc(%ebx),%eax
     263:	89 04 24             	mov    %eax,(%esp)
     266:	e8 b5 0e 00 00       	call   1120 <cond_init>
    cond_init(&rw->can_write);
     26b:	8d 43 10             	lea    0x10(%ebx),%eax
     26e:	89 04 24             	mov    %eax,(%esp)
     271:	e8 aa 0e 00 00       	call   1120 <cond_init>
    rw->active_readers = 0;
     276:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
}
     27d:	83 c4 10             	add    $0x10,%esp
    rw->active_writers = 0;
     280:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    rw->waiting_writers = 0;
     287:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
}
     28e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     291:	c9                   	leave
     292:	c3                   	ret
     293:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     29a:	00 
     29b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000002a0 <reader_lock>:
void reader_lock(rwlock_t *rw) {
     2a0:	55                   	push   %ebp
     2a1:	89 e5                	mov    %esp,%ebp
     2a3:	56                   	push   %esi
     2a4:	53                   	push   %ebx
     2a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
        cond_wait(&rw->can_read, &rw->lock);
     2a8:	8d 73 0c             	lea    0xc(%ebx),%esi
    mutex_lock(&rw->lock);
     2ab:	83 ec 0c             	sub    $0xc,%esp
     2ae:	53                   	push   %ebx
     2af:	e8 9c 0d 00 00       	call   1050 <mutex_lock>
    while (rw->active_writers > 0 || rw->waiting_writers > 0) {
     2b4:	83 c4 10             	add    $0x10,%esp
     2b7:	eb 14                	jmp    2cd <reader_lock+0x2d>
     2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        cond_wait(&rw->can_read, &rw->lock);
     2c0:	83 ec 08             	sub    $0x8,%esp
     2c3:	53                   	push   %ebx
     2c4:	56                   	push   %esi
     2c5:	e8 66 0e 00 00       	call   1130 <cond_wait>
     2ca:	83 c4 10             	add    $0x10,%esp
    while (rw->active_writers > 0 || rw->waiting_writers > 0) {
     2cd:	8b 53 18             	mov    0x18(%ebx),%edx
     2d0:	85 d2                	test   %edx,%edx
     2d2:	7f ec                	jg     2c0 <reader_lock+0x20>
     2d4:	8b 43 1c             	mov    0x1c(%ebx),%eax
     2d7:	85 c0                	test   %eax,%eax
     2d9:	7f e5                	jg     2c0 <reader_lock+0x20>
    rw->active_readers++;
     2db:	83 43 14 01          	addl   $0x1,0x14(%ebx)
    mutex_unlock(&rw->lock);
     2df:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     2e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2e5:	5b                   	pop    %ebx
     2e6:	5e                   	pop    %esi
     2e7:	5d                   	pop    %ebp
    mutex_unlock(&rw->lock);
     2e8:	e9 a3 0d 00 00       	jmp    1090 <mutex_unlock>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <reader_unlock>:
void reader_unlock(rwlock_t *rw) {
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	53                   	push   %ebx
     2f4:	83 ec 10             	sub    $0x10,%esp
     2f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    mutex_lock(&rw->lock);
     2fa:	53                   	push   %ebx
     2fb:	e8 50 0d 00 00       	call   1050 <mutex_lock>
    rw->active_readers--;
     300:	8b 43 14             	mov    0x14(%ebx),%eax
    if (rw->active_readers == 0) {
     303:	83 c4 10             	add    $0x10,%esp
    rw->active_readers--;
     306:	83 e8 01             	sub    $0x1,%eax
     309:	89 43 14             	mov    %eax,0x14(%ebx)
    if (rw->active_readers == 0) {
     30c:	85 c0                	test   %eax,%eax
     30e:	74 10                	je     320 <reader_unlock+0x30>
    mutex_unlock(&rw->lock);
     310:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     313:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     316:	c9                   	leave
    mutex_unlock(&rw->lock);
     317:	e9 74 0d 00 00       	jmp    1090 <mutex_unlock>
     31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cond_signal(&rw->can_write);
     320:	83 ec 0c             	sub    $0xc,%esp
     323:	8d 43 10             	lea    0x10(%ebx),%eax
     326:	50                   	push   %eax
     327:	e8 a4 0e 00 00       	call   11d0 <cond_signal>
     32c:	83 c4 10             	add    $0x10,%esp
    mutex_unlock(&rw->lock);
     32f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     332:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     335:	c9                   	leave
    mutex_unlock(&rw->lock);
     336:	e9 55 0d 00 00       	jmp    1090 <mutex_unlock>
     33b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000340 <writer_lock>:
void writer_lock(rwlock_t *rw) {
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	56                   	push   %esi
     344:	53                   	push   %ebx
     345:	8b 5d 08             	mov    0x8(%ebp),%ebx
        cond_wait(&rw->can_write, &rw->lock);
     348:	8d 73 10             	lea    0x10(%ebx),%esi
    mutex_lock(&rw->lock);
     34b:	83 ec 0c             	sub    $0xc,%esp
     34e:	53                   	push   %ebx
     34f:	e8 fc 0c 00 00       	call   1050 <mutex_lock>
    rw->waiting_writers++;
     354:	83 43 1c 01          	addl   $0x1,0x1c(%ebx)
    while (rw->active_readers > 0 || rw->active_writers > 0) {
     358:	83 c4 10             	add    $0x10,%esp
     35b:	eb 10                	jmp    36d <writer_lock+0x2d>
     35d:	8d 76 00             	lea    0x0(%esi),%esi
        cond_wait(&rw->can_write, &rw->lock);
     360:	83 ec 08             	sub    $0x8,%esp
     363:	53                   	push   %ebx
     364:	56                   	push   %esi
     365:	e8 c6 0d 00 00       	call   1130 <cond_wait>
     36a:	83 c4 10             	add    $0x10,%esp
    while (rw->active_readers > 0 || rw->active_writers > 0) {
     36d:	8b 43 14             	mov    0x14(%ebx),%eax
     370:	85 c0                	test   %eax,%eax
     372:	7f ec                	jg     360 <writer_lock+0x20>
     374:	8b 43 18             	mov    0x18(%ebx),%eax
     377:	85 c0                	test   %eax,%eax
     379:	7f e5                	jg     360 <writer_lock+0x20>
    rw->waiting_writers--;
     37b:	83 6b 1c 01          	subl   $0x1,0x1c(%ebx)
    rw->active_writers++;
     37f:	83 c0 01             	add    $0x1,%eax
     382:	89 43 18             	mov    %eax,0x18(%ebx)
    mutex_unlock(&rw->lock);
     385:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     388:	8d 65 f8             	lea    -0x8(%ebp),%esp
     38b:	5b                   	pop    %ebx
     38c:	5e                   	pop    %esi
     38d:	5d                   	pop    %ebp
    mutex_unlock(&rw->lock);
     38e:	e9 fd 0c 00 00       	jmp    1090 <mutex_unlock>
     393:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     39a:	00 
     39b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003a0 <writer>:
void *writer(void *arg) {
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	56                   	push   %esi
    printf(1, "[Writer%d] Start\n", id);
     3a4:	be 03 00 00 00       	mov    $0x3,%esi
void *writer(void *arg) {
     3a9:	53                   	push   %ebx
     3aa:	8b 5d 08             	mov    0x8(%ebp),%ebx
    printf(1, "[Writer%d] Start\n", id);
     3ad:	83 ec 04             	sub    $0x4,%esp
     3b0:	53                   	push   %ebx
     3b1:	68 b5 17 00 00       	push   $0x17b5
     3b6:	6a 01                	push   $0x1
     3b8:	e8 f3 04 00 00       	call   8b0 <printf>
     3bd:	83 c4 10             	add    $0x10,%esp
        printf(1, "[Writer%d] Request write lock...\n", id);
     3c0:	83 ec 04             	sub    $0x4,%esp
     3c3:	53                   	push   %ebx
     3c4:	68 64 18 00 00       	push   $0x1864
     3c9:	6a 01                	push   $0x1
     3cb:	e8 e0 04 00 00       	call   8b0 <printf>
        writer_lock(&rwlock);
     3d0:	c7 04 24 00 25 00 00 	movl   $0x2500,(%esp)
     3d7:	e8 64 ff ff ff       	call   340 <writer_lock>
        shared_data++;
     3dc:	a1 e0 24 00 00       	mov    0x24e0,%eax
     3e1:	83 c0 01             	add    $0x1,%eax
     3e4:	a3 e0 24 00 00       	mov    %eax,0x24e0
        printf(1, "[Writer%d] *** Got write lock, wrote data = %d ***\n", id, shared_data);
     3e9:	50                   	push   %eax
     3ea:	53                   	push   %ebx
     3eb:	68 88 18 00 00       	push   $0x1888
     3f0:	6a 01                	push   $0x1
     3f2:	e8 b9 04 00 00       	call   8b0 <printf>
        thread_yield();
     3f7:	83 c4 20             	add    $0x20,%esp
     3fa:	e8 b1 0b 00 00       	call   fb0 <thread_yield>
    mutex_lock(&rw->lock);
     3ff:	83 ec 0c             	sub    $0xc,%esp
     402:	68 00 25 00 00       	push   $0x2500
     407:	e8 44 0c 00 00       	call   1050 <mutex_lock>
    if (rw->waiting_writers > 0) {
     40c:	a1 1c 25 00 00       	mov    0x251c,%eax
    rw->active_writers--;
     411:	83 2d 18 25 00 00 01 	subl   $0x1,0x2518
    if (rw->waiting_writers > 0) {
     418:	83 c4 10             	add    $0x10,%esp
     41b:	85 c0                	test   %eax,%eax
     41d:	7e 61                	jle    480 <writer+0xe0>
        cond_signal(&rw->can_write);
     41f:	83 ec 0c             	sub    $0xc,%esp
     422:	68 10 25 00 00       	push   $0x2510
     427:	e8 a4 0d 00 00       	call   11d0 <cond_signal>
     42c:	83 c4 10             	add    $0x10,%esp
    mutex_unlock(&rw->lock);
     42f:	83 ec 0c             	sub    $0xc,%esp
     432:	68 00 25 00 00       	push   $0x2500
     437:	e8 54 0c 00 00       	call   1090 <mutex_unlock>
        printf(1, "[Writer%d] Release write lock\n", id);
     43c:	83 c4 0c             	add    $0xc,%esp
     43f:	53                   	push   %ebx
     440:	68 bc 18 00 00       	push   $0x18bc
     445:	6a 01                	push   $0x1
     447:	e8 64 04 00 00       	call   8b0 <printf>
        thread_yield();
     44c:	e8 5f 0b 00 00       	call   fb0 <thread_yield>
    for (i = 0; i < WRITE_TIMES; i++) {
     451:	83 c4 10             	add    $0x10,%esp
     454:	83 ee 01             	sub    $0x1,%esi
     457:	0f 85 63 ff ff ff    	jne    3c0 <writer+0x20>
    printf(1, "[Writer%d] Finished\n", id);
     45d:	83 ec 04             	sub    $0x4,%esp
     460:	53                   	push   %ebx
     461:	68 c7 17 00 00       	push   $0x17c7
     466:	6a 01                	push   $0x1
     468:	e8 43 04 00 00       	call   8b0 <printf>
}
     46d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     470:	31 c0                	xor    %eax,%eax
     472:	5b                   	pop    %ebx
     473:	5e                   	pop    %esi
     474:	5d                   	pop    %ebp
     475:	c3                   	ret
     476:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     47d:	00 
     47e:	66 90                	xchg   %ax,%ax
        cond_broadcast(&rw->can_read);
     480:	83 ec 0c             	sub    $0xc,%esp
     483:	68 0c 25 00 00       	push   $0x250c
     488:	e8 63 0d 00 00       	call   11f0 <cond_broadcast>
     48d:	83 c4 10             	add    $0x10,%esp
     490:	eb 9d                	jmp    42f <writer+0x8f>
     492:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     499:	00 
     49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004a0 <writer_unlock>:
void writer_unlock(rwlock_t *rw) {
     4a0:	55                   	push   %ebp
     4a1:	89 e5                	mov    %esp,%ebp
     4a3:	53                   	push   %ebx
     4a4:	83 ec 10             	sub    $0x10,%esp
     4a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    mutex_lock(&rw->lock);
     4aa:	53                   	push   %ebx
     4ab:	e8 a0 0b 00 00       	call   1050 <mutex_lock>
    if (rw->waiting_writers > 0) {
     4b0:	8b 43 1c             	mov    0x1c(%ebx),%eax
    rw->active_writers--;
     4b3:	83 6b 18 01          	subl   $0x1,0x18(%ebx)
    if (rw->waiting_writers > 0) {
     4b7:	83 c4 10             	add    $0x10,%esp
     4ba:	85 c0                	test   %eax,%eax
     4bc:	7e 22                	jle    4e0 <writer_unlock+0x40>
        cond_signal(&rw->can_write);
     4be:	83 ec 0c             	sub    $0xc,%esp
     4c1:	8d 43 10             	lea    0x10(%ebx),%eax
     4c4:	50                   	push   %eax
     4c5:	e8 06 0d 00 00       	call   11d0 <cond_signal>
     4ca:	83 c4 10             	add    $0x10,%esp
    mutex_unlock(&rw->lock);
     4cd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     4d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4d3:	c9                   	leave
    mutex_unlock(&rw->lock);
     4d4:	e9 b7 0b 00 00       	jmp    1090 <mutex_unlock>
     4d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        cond_broadcast(&rw->can_read);
     4e0:	83 ec 0c             	sub    $0xc,%esp
     4e3:	8d 43 0c             	lea    0xc(%ebx),%eax
     4e6:	50                   	push   %eax
     4e7:	e8 04 0d 00 00       	call   11f0 <cond_broadcast>
     4ec:	83 c4 10             	add    $0x10,%esp
    mutex_unlock(&rw->lock);
     4ef:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     4f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4f5:	c9                   	leave
    mutex_unlock(&rw->lock);
     4f6:	e9 95 0b 00 00       	jmp    1090 <mutex_unlock>
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
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     501:	31 c0                	xor    %eax,%eax
{
     503:	89 e5                	mov    %esp,%ebp
     505:	53                   	push   %ebx
     506:	8b 4d 08             	mov    0x8(%ebp),%ecx
     509:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     510:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     514:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     517:	83 c0 01             	add    $0x1,%eax
     51a:	84 d2                	test   %dl,%dl
     51c:	75 f2                	jne    510 <strcpy+0x10>
    ;
  return os;
}
     51e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     521:	89 c8                	mov    %ecx,%eax
     523:	c9                   	leave
     524:	c3                   	ret
     525:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     52c:	00 
     52d:	8d 76 00             	lea    0x0(%esi),%esi

00000530 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	53                   	push   %ebx
     534:	8b 55 08             	mov    0x8(%ebp),%edx
     537:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     53a:	0f b6 02             	movzbl (%edx),%eax
     53d:	84 c0                	test   %al,%al
     53f:	75 17                	jne    558 <strcmp+0x28>
     541:	eb 3a                	jmp    57d <strcmp+0x4d>
     543:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     548:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     54c:	83 c2 01             	add    $0x1,%edx
     54f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     552:	84 c0                	test   %al,%al
     554:	74 1a                	je     570 <strcmp+0x40>
     556:	89 d9                	mov    %ebx,%ecx
     558:	0f b6 19             	movzbl (%ecx),%ebx
     55b:	38 c3                	cmp    %al,%bl
     55d:	74 e9                	je     548 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     55f:	29 d8                	sub    %ebx,%eax
}
     561:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     564:	c9                   	leave
     565:	c3                   	ret
     566:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     56d:	00 
     56e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
     570:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     574:	31 c0                	xor    %eax,%eax
     576:	29 d8                	sub    %ebx,%eax
}
     578:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     57b:	c9                   	leave
     57c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     57d:	0f b6 19             	movzbl (%ecx),%ebx
     580:	31 c0                	xor    %eax,%eax
     582:	eb db                	jmp    55f <strcmp+0x2f>
     584:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     58b:	00 
     58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <strlen>:

uint
strlen(const char *s)
{
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     596:	80 3a 00             	cmpb   $0x0,(%edx)
     599:	74 15                	je     5b0 <strlen+0x20>
     59b:	31 c0                	xor    %eax,%eax
     59d:	8d 76 00             	lea    0x0(%esi),%esi
     5a0:	83 c0 01             	add    $0x1,%eax
     5a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     5a7:	89 c1                	mov    %eax,%ecx
     5a9:	75 f5                	jne    5a0 <strlen+0x10>
    ;
  return n;
}
     5ab:	89 c8                	mov    %ecx,%eax
     5ad:	5d                   	pop    %ebp
     5ae:	c3                   	ret
     5af:	90                   	nop
  for(n = 0; s[n]; n++)
     5b0:	31 c9                	xor    %ecx,%ecx
}
     5b2:	5d                   	pop    %ebp
     5b3:	89 c8                	mov    %ecx,%eax
     5b5:	c3                   	ret
     5b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5bd:	00 
     5be:	66 90                	xchg   %ax,%ax

000005c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	57                   	push   %edi
     5c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     5c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     5ca:	8b 45 0c             	mov    0xc(%ebp),%eax
     5cd:	89 d7                	mov    %edx,%edi
     5cf:	fc                   	cld
     5d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     5d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     5d5:	89 d0                	mov    %edx,%eax
     5d7:	c9                   	leave
     5d8:	c3                   	ret
     5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005e0 <strchr>:

char*
strchr(const char *s, char c)
{
     5e0:	55                   	push   %ebp
     5e1:	89 e5                	mov    %esp,%ebp
     5e3:	8b 45 08             	mov    0x8(%ebp),%eax
     5e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     5ea:	0f b6 10             	movzbl (%eax),%edx
     5ed:	84 d2                	test   %dl,%dl
     5ef:	75 12                	jne    603 <strchr+0x23>
     5f1:	eb 1d                	jmp    610 <strchr+0x30>
     5f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     5f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     5fc:	83 c0 01             	add    $0x1,%eax
     5ff:	84 d2                	test   %dl,%dl
     601:	74 0d                	je     610 <strchr+0x30>
    if(*s == c)
     603:	38 d1                	cmp    %dl,%cl
     605:	75 f1                	jne    5f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
     607:	5d                   	pop    %ebp
     608:	c3                   	ret
     609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     610:	31 c0                	xor    %eax,%eax
}
     612:	5d                   	pop    %ebp
     613:	c3                   	ret
     614:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     61b:	00 
     61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000620 <gets>:

char*
gets(char *buf, int max)
{
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	57                   	push   %edi
     624:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     625:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     628:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     629:	31 db                	xor    %ebx,%ebx
{
     62b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     62e:	eb 27                	jmp    657 <gets+0x37>
    cc = read(0, &c, 1);
     630:	83 ec 04             	sub    $0x4,%esp
     633:	6a 01                	push   $0x1
     635:	56                   	push   %esi
     636:	6a 00                	push   $0x0
     638:	e8 1e 01 00 00       	call   75b <read>
    if(cc < 1)
     63d:	83 c4 10             	add    $0x10,%esp
     640:	85 c0                	test   %eax,%eax
     642:	7e 1d                	jle    661 <gets+0x41>
      break;
    buf[i++] = c;
     644:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     648:	8b 55 08             	mov    0x8(%ebp),%edx
     64b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     64f:	3c 0a                	cmp    $0xa,%al
     651:	74 10                	je     663 <gets+0x43>
     653:	3c 0d                	cmp    $0xd,%al
     655:	74 0c                	je     663 <gets+0x43>
  for(i=0; i+1 < max; ){
     657:	89 df                	mov    %ebx,%edi
     659:	83 c3 01             	add    $0x1,%ebx
     65c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     65f:	7c cf                	jl     630 <gets+0x10>
     661:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     663:	8b 45 08             	mov    0x8(%ebp),%eax
     666:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     66a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     66d:	5b                   	pop    %ebx
     66e:	5e                   	pop    %esi
     66f:	5f                   	pop    %edi
     670:	5d                   	pop    %ebp
     671:	c3                   	ret
     672:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     679:	00 
     67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000680 <stat>:

int
stat(const char *n, struct stat *st)
{
     680:	55                   	push   %ebp
     681:	89 e5                	mov    %esp,%ebp
     683:	56                   	push   %esi
     684:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     685:	83 ec 08             	sub    $0x8,%esp
     688:	6a 00                	push   $0x0
     68a:	ff 75 08             	push   0x8(%ebp)
     68d:	e8 f1 00 00 00       	call   783 <open>
  if(fd < 0)
     692:	83 c4 10             	add    $0x10,%esp
     695:	85 c0                	test   %eax,%eax
     697:	78 27                	js     6c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     699:	83 ec 08             	sub    $0x8,%esp
     69c:	ff 75 0c             	push   0xc(%ebp)
     69f:	89 c3                	mov    %eax,%ebx
     6a1:	50                   	push   %eax
     6a2:	e8 f4 00 00 00       	call   79b <fstat>
  close(fd);
     6a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     6aa:	89 c6                	mov    %eax,%esi
  close(fd);
     6ac:	e8 ba 00 00 00       	call   76b <close>
  return r;
     6b1:	83 c4 10             	add    $0x10,%esp
}
     6b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     6b7:	89 f0                	mov    %esi,%eax
     6b9:	5b                   	pop    %ebx
     6ba:	5e                   	pop    %esi
     6bb:	5d                   	pop    %ebp
     6bc:	c3                   	ret
     6bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     6c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     6c5:	eb ed                	jmp    6b4 <stat+0x34>
     6c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     6ce:	00 
     6cf:	90                   	nop

000006d0 <atoi>:

int
atoi(const char *s)
{
     6d0:	55                   	push   %ebp
     6d1:	89 e5                	mov    %esp,%ebp
     6d3:	53                   	push   %ebx
     6d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     6d7:	0f be 02             	movsbl (%edx),%eax
     6da:	8d 48 d0             	lea    -0x30(%eax),%ecx
     6dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     6e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     6e5:	77 1e                	ja     705 <atoi+0x35>
     6e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     6ee:	00 
     6ef:	90                   	nop
    n = n*10 + *s++ - '0';
     6f0:	83 c2 01             	add    $0x1,%edx
     6f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     6f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     6fa:	0f be 02             	movsbl (%edx),%eax
     6fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
     700:	80 fb 09             	cmp    $0x9,%bl
     703:	76 eb                	jbe    6f0 <atoi+0x20>
  return n;
}
     705:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     708:	89 c8                	mov    %ecx,%eax
     70a:	c9                   	leave
     70b:	c3                   	ret
     70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000710 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     710:	55                   	push   %ebp
     711:	89 e5                	mov    %esp,%ebp
     713:	57                   	push   %edi
     714:	8b 45 10             	mov    0x10(%ebp),%eax
     717:	8b 55 08             	mov    0x8(%ebp),%edx
     71a:	56                   	push   %esi
     71b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     71e:	85 c0                	test   %eax,%eax
     720:	7e 13                	jle    735 <memmove+0x25>
     722:	01 d0                	add    %edx,%eax
  dst = vdst;
     724:	89 d7                	mov    %edx,%edi
     726:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     72d:	00 
     72e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
     730:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     731:	39 f8                	cmp    %edi,%eax
     733:	75 fb                	jne    730 <memmove+0x20>
  return vdst;
}
     735:	5e                   	pop    %esi
     736:	89 d0                	mov    %edx,%eax
     738:	5f                   	pop    %edi
     739:	5d                   	pop    %ebp
     73a:	c3                   	ret

0000073b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     73b:	b8 01 00 00 00       	mov    $0x1,%eax
     740:	cd 40                	int    $0x40
     742:	c3                   	ret

00000743 <exit>:
SYSCALL(exit)
     743:	b8 02 00 00 00       	mov    $0x2,%eax
     748:	cd 40                	int    $0x40
     74a:	c3                   	ret

0000074b <wait>:
SYSCALL(wait)
     74b:	b8 03 00 00 00       	mov    $0x3,%eax
     750:	cd 40                	int    $0x40
     752:	c3                   	ret

00000753 <pipe>:
SYSCALL(pipe)
     753:	b8 04 00 00 00       	mov    $0x4,%eax
     758:	cd 40                	int    $0x40
     75a:	c3                   	ret

0000075b <read>:
SYSCALL(read)
     75b:	b8 05 00 00 00       	mov    $0x5,%eax
     760:	cd 40                	int    $0x40
     762:	c3                   	ret

00000763 <write>:
SYSCALL(write)
     763:	b8 10 00 00 00       	mov    $0x10,%eax
     768:	cd 40                	int    $0x40
     76a:	c3                   	ret

0000076b <close>:
SYSCALL(close)
     76b:	b8 15 00 00 00       	mov    $0x15,%eax
     770:	cd 40                	int    $0x40
     772:	c3                   	ret

00000773 <kill>:
SYSCALL(kill)
     773:	b8 06 00 00 00       	mov    $0x6,%eax
     778:	cd 40                	int    $0x40
     77a:	c3                   	ret

0000077b <exec>:
SYSCALL(exec)
     77b:	b8 07 00 00 00       	mov    $0x7,%eax
     780:	cd 40                	int    $0x40
     782:	c3                   	ret

00000783 <open>:
SYSCALL(open)
     783:	b8 0f 00 00 00       	mov    $0xf,%eax
     788:	cd 40                	int    $0x40
     78a:	c3                   	ret

0000078b <mknod>:
SYSCALL(mknod)
     78b:	b8 11 00 00 00       	mov    $0x11,%eax
     790:	cd 40                	int    $0x40
     792:	c3                   	ret

00000793 <unlink>:
SYSCALL(unlink)
     793:	b8 12 00 00 00       	mov    $0x12,%eax
     798:	cd 40                	int    $0x40
     79a:	c3                   	ret

0000079b <fstat>:
SYSCALL(fstat)
     79b:	b8 08 00 00 00       	mov    $0x8,%eax
     7a0:	cd 40                	int    $0x40
     7a2:	c3                   	ret

000007a3 <link>:
SYSCALL(link)
     7a3:	b8 13 00 00 00       	mov    $0x13,%eax
     7a8:	cd 40                	int    $0x40
     7aa:	c3                   	ret

000007ab <mkdir>:
SYSCALL(mkdir)
     7ab:	b8 14 00 00 00       	mov    $0x14,%eax
     7b0:	cd 40                	int    $0x40
     7b2:	c3                   	ret

000007b3 <chdir>:
SYSCALL(chdir)
     7b3:	b8 09 00 00 00       	mov    $0x9,%eax
     7b8:	cd 40                	int    $0x40
     7ba:	c3                   	ret

000007bb <dup>:
SYSCALL(dup)
     7bb:	b8 0a 00 00 00       	mov    $0xa,%eax
     7c0:	cd 40                	int    $0x40
     7c2:	c3                   	ret

000007c3 <getpid>:
SYSCALL(getpid)
     7c3:	b8 0b 00 00 00       	mov    $0xb,%eax
     7c8:	cd 40                	int    $0x40
     7ca:	c3                   	ret

000007cb <sbrk>:
SYSCALL(sbrk)
     7cb:	b8 0c 00 00 00       	mov    $0xc,%eax
     7d0:	cd 40                	int    $0x40
     7d2:	c3                   	ret

000007d3 <sleep>:
SYSCALL(sleep)
     7d3:	b8 0d 00 00 00       	mov    $0xd,%eax
     7d8:	cd 40                	int    $0x40
     7da:	c3                   	ret

000007db <uptime>:
SYSCALL(uptime)
     7db:	b8 0e 00 00 00       	mov    $0xe,%eax
     7e0:	cd 40                	int    $0x40
     7e2:	c3                   	ret

000007e3 <getnice>:
SYSCALL(getnice)
     7e3:	b8 16 00 00 00       	mov    $0x16,%eax
     7e8:	cd 40                	int    $0x40
     7ea:	c3                   	ret

000007eb <lock>:
SYSCALL(lock)
     7eb:	b8 17 00 00 00       	mov    $0x17,%eax
     7f0:	cd 40                	int    $0x40
     7f2:	c3                   	ret

000007f3 <release>:
SYSCALL(release)
     7f3:	b8 18 00 00 00       	mov    $0x18,%eax
     7f8:	cd 40                	int    $0x40
     7fa:	c3                   	ret

000007fb <setnice>:
SYSCALL(setnice)
     7fb:	b8 19 00 00 00       	mov    $0x19,%eax
     800:	cd 40                	int    $0x40
     802:	c3                   	ret
     803:	66 90                	xchg   %ax,%ax
     805:	66 90                	xchg   %ax,%ax
     807:	66 90                	xchg   %ax,%ax
     809:	66 90                	xchg   %ax,%ax
     80b:	66 90                	xchg   %ax,%ax
     80d:	66 90                	xchg   %ax,%ax
     80f:	90                   	nop

00000810 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     810:	55                   	push   %ebp
     811:	89 e5                	mov    %esp,%ebp
     813:	57                   	push   %edi
     814:	56                   	push   %esi
     815:	53                   	push   %ebx
     816:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     818:	89 d1                	mov    %edx,%ecx
{
     81a:	83 ec 3c             	sub    $0x3c,%esp
     81d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     820:	85 d2                	test   %edx,%edx
     822:	0f 89 80 00 00 00    	jns    8a8 <printint+0x98>
     828:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     82c:	74 7a                	je     8a8 <printint+0x98>
    x = -xx;
     82e:	f7 d9                	neg    %ecx
    neg = 1;
     830:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     835:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     838:	31 f6                	xor    %esi,%esi
     83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     840:	89 c8                	mov    %ecx,%eax
     842:	31 d2                	xor    %edx,%edx
     844:	89 f7                	mov    %esi,%edi
     846:	f7 f3                	div    %ebx
     848:	8d 76 01             	lea    0x1(%esi),%esi
     84b:	0f b6 92 60 1d 00 00 	movzbl 0x1d60(%edx),%edx
     852:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     856:	89 ca                	mov    %ecx,%edx
     858:	89 c1                	mov    %eax,%ecx
     85a:	39 da                	cmp    %ebx,%edx
     85c:	73 e2                	jae    840 <printint+0x30>
  if(neg)
     85e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     861:	85 c0                	test   %eax,%eax
     863:	74 07                	je     86c <printint+0x5c>
    buf[i++] = '-';
     865:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
     86a:	89 f7                	mov    %esi,%edi
     86c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     86f:	8b 75 c0             	mov    -0x40(%ebp),%esi
     872:	01 df                	add    %ebx,%edi
     874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
     878:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
     87b:	83 ec 04             	sub    $0x4,%esp
     87e:	88 45 d7             	mov    %al,-0x29(%ebp)
     881:	8d 45 d7             	lea    -0x29(%ebp),%eax
     884:	6a 01                	push   $0x1
     886:	50                   	push   %eax
     887:	56                   	push   %esi
     888:	e8 d6 fe ff ff       	call   763 <write>
  while(--i >= 0)
     88d:	89 f8                	mov    %edi,%eax
     88f:	83 c4 10             	add    $0x10,%esp
     892:	83 ef 01             	sub    $0x1,%edi
     895:	39 c3                	cmp    %eax,%ebx
     897:	75 df                	jne    878 <printint+0x68>
}
     899:	8d 65 f4             	lea    -0xc(%ebp),%esp
     89c:	5b                   	pop    %ebx
     89d:	5e                   	pop    %esi
     89e:	5f                   	pop    %edi
     89f:	5d                   	pop    %ebp
     8a0:	c3                   	ret
     8a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     8a8:	31 c0                	xor    %eax,%eax
     8aa:	eb 89                	jmp    835 <printint+0x25>
     8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     8b9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     8bc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     8bf:	0f b6 1e             	movzbl (%esi),%ebx
     8c2:	83 c6 01             	add    $0x1,%esi
     8c5:	84 db                	test   %bl,%bl
     8c7:	74 67                	je     930 <printf+0x80>
     8c9:	8d 4d 10             	lea    0x10(%ebp),%ecx
     8cc:	31 d2                	xor    %edx,%edx
     8ce:	89 4d d0             	mov    %ecx,-0x30(%ebp)
     8d1:	eb 34                	jmp    907 <printf+0x57>
     8d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     8d8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     8db:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     8e0:	83 f8 25             	cmp    $0x25,%eax
     8e3:	74 18                	je     8fd <printf+0x4d>
  write(fd, &c, 1);
     8e5:	83 ec 04             	sub    $0x4,%esp
     8e8:	8d 45 e7             	lea    -0x19(%ebp),%eax
     8eb:	88 5d e7             	mov    %bl,-0x19(%ebp)
     8ee:	6a 01                	push   $0x1
     8f0:	50                   	push   %eax
     8f1:	57                   	push   %edi
     8f2:	e8 6c fe ff ff       	call   763 <write>
     8f7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
     8fa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     8fd:	0f b6 1e             	movzbl (%esi),%ebx
     900:	83 c6 01             	add    $0x1,%esi
     903:	84 db                	test   %bl,%bl
     905:	74 29                	je     930 <printf+0x80>
    c = fmt[i] & 0xff;
     907:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     90a:	85 d2                	test   %edx,%edx
     90c:	74 ca                	je     8d8 <printf+0x28>
      }
    } else if(state == '%'){
     90e:	83 fa 25             	cmp    $0x25,%edx
     911:	75 ea                	jne    8fd <printf+0x4d>
      if(c == 'd'){
     913:	83 f8 25             	cmp    $0x25,%eax
     916:	0f 84 04 01 00 00    	je     a20 <printf+0x170>
     91c:	83 e8 63             	sub    $0x63,%eax
     91f:	83 f8 15             	cmp    $0x15,%eax
     922:	77 1c                	ja     940 <printf+0x90>
     924:	ff 24 85 08 1d 00 00 	jmp    *0x1d08(,%eax,4)
     92b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     930:	8d 65 f4             	lea    -0xc(%ebp),%esp
     933:	5b                   	pop    %ebx
     934:	5e                   	pop    %esi
     935:	5f                   	pop    %edi
     936:	5d                   	pop    %ebp
     937:	c3                   	ret
     938:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     93f:	00 
  write(fd, &c, 1);
     940:	83 ec 04             	sub    $0x4,%esp
     943:	8d 55 e7             	lea    -0x19(%ebp),%edx
     946:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     94a:	6a 01                	push   $0x1
     94c:	52                   	push   %edx
     94d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     950:	57                   	push   %edi
     951:	e8 0d fe ff ff       	call   763 <write>
     956:	83 c4 0c             	add    $0xc,%esp
     959:	88 5d e7             	mov    %bl,-0x19(%ebp)
     95c:	6a 01                	push   $0x1
     95e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     961:	52                   	push   %edx
     962:	57                   	push   %edi
     963:	e8 fb fd ff ff       	call   763 <write>
        putc(fd, c);
     968:	83 c4 10             	add    $0x10,%esp
      state = 0;
     96b:	31 d2                	xor    %edx,%edx
     96d:	eb 8e                	jmp    8fd <printf+0x4d>
     96f:	90                   	nop
        printint(fd, *ap, 16, 0);
     970:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     973:	83 ec 0c             	sub    $0xc,%esp
     976:	b9 10 00 00 00       	mov    $0x10,%ecx
     97b:	8b 13                	mov    (%ebx),%edx
     97d:	6a 00                	push   $0x0
     97f:	89 f8                	mov    %edi,%eax
        ap++;
     981:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
     984:	e8 87 fe ff ff       	call   810 <printint>
        ap++;
     989:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     98c:	83 c4 10             	add    $0x10,%esp
      state = 0;
     98f:	31 d2                	xor    %edx,%edx
     991:	e9 67 ff ff ff       	jmp    8fd <printf+0x4d>
        s = (char*)*ap;
     996:	8b 45 d0             	mov    -0x30(%ebp),%eax
     999:	8b 18                	mov    (%eax),%ebx
        ap++;
     99b:	83 c0 04             	add    $0x4,%eax
     99e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     9a1:	85 db                	test   %ebx,%ebx
     9a3:	0f 84 87 00 00 00    	je     a30 <printf+0x180>
        while(*s != 0){
     9a9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
     9ac:	31 d2                	xor    %edx,%edx
        while(*s != 0){
     9ae:	84 c0                	test   %al,%al
     9b0:	0f 84 47 ff ff ff    	je     8fd <printf+0x4d>
     9b6:	8d 55 e7             	lea    -0x19(%ebp),%edx
     9b9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     9bc:	89 de                	mov    %ebx,%esi
     9be:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
     9c0:	83 ec 04             	sub    $0x4,%esp
     9c3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
     9c6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
     9c9:	6a 01                	push   $0x1
     9cb:	53                   	push   %ebx
     9cc:	57                   	push   %edi
     9cd:	e8 91 fd ff ff       	call   763 <write>
        while(*s != 0){
     9d2:	0f b6 06             	movzbl (%esi),%eax
     9d5:	83 c4 10             	add    $0x10,%esp
     9d8:	84 c0                	test   %al,%al
     9da:	75 e4                	jne    9c0 <printf+0x110>
      state = 0;
     9dc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
     9df:	31 d2                	xor    %edx,%edx
     9e1:	e9 17 ff ff ff       	jmp    8fd <printf+0x4d>
        printint(fd, *ap, 10, 1);
     9e6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     9e9:	83 ec 0c             	sub    $0xc,%esp
     9ec:	b9 0a 00 00 00       	mov    $0xa,%ecx
     9f1:	8b 13                	mov    (%ebx),%edx
     9f3:	6a 01                	push   $0x1
     9f5:	eb 88                	jmp    97f <printf+0xcf>
        putc(fd, *ap);
     9f7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
     9fa:	83 ec 04             	sub    $0x4,%esp
     9fd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
     a00:	8b 03                	mov    (%ebx),%eax
        ap++;
     a02:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
     a05:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     a08:	6a 01                	push   $0x1
     a0a:	52                   	push   %edx
     a0b:	57                   	push   %edi
     a0c:	e8 52 fd ff ff       	call   763 <write>
        ap++;
     a11:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     a14:	83 c4 10             	add    $0x10,%esp
      state = 0;
     a17:	31 d2                	xor    %edx,%edx
     a19:	e9 df fe ff ff       	jmp    8fd <printf+0x4d>
     a1e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
     a20:	83 ec 04             	sub    $0x4,%esp
     a23:	88 5d e7             	mov    %bl,-0x19(%ebp)
     a26:	8d 55 e7             	lea    -0x19(%ebp),%edx
     a29:	6a 01                	push   $0x1
     a2b:	e9 31 ff ff ff       	jmp    961 <printf+0xb1>
     a30:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
     a35:	bb f3 17 00 00       	mov    $0x17f3,%ebx
     a3a:	e9 77 ff ff ff       	jmp    9b6 <printf+0x106>
     a3f:	90                   	nop

00000a40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     a40:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a41:	a1 20 25 00 00       	mov    0x2520,%eax
{
     a46:	89 e5                	mov    %esp,%ebp
     a48:	57                   	push   %edi
     a49:	56                   	push   %esi
     a4a:	53                   	push   %ebx
     a4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
     a4e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     a58:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a5a:	39 c8                	cmp    %ecx,%eax
     a5c:	73 32                	jae    a90 <free+0x50>
     a5e:	39 d1                	cmp    %edx,%ecx
     a60:	72 04                	jb     a66 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     a62:	39 d0                	cmp    %edx,%eax
     a64:	72 32                	jb     a98 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
     a66:	8b 73 fc             	mov    -0x4(%ebx),%esi
     a69:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     a6c:	39 fa                	cmp    %edi,%edx
     a6e:	74 30                	je     aa0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
     a70:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     a73:	8b 50 04             	mov    0x4(%eax),%edx
     a76:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     a79:	39 f1                	cmp    %esi,%ecx
     a7b:	74 3a                	je     ab7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
     a7d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     a7f:	5b                   	pop    %ebx
  freep = p;
     a80:	a3 20 25 00 00       	mov    %eax,0x2520
}
     a85:	5e                   	pop    %esi
     a86:	5f                   	pop    %edi
     a87:	5d                   	pop    %ebp
     a88:	c3                   	ret
     a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     a90:	39 d0                	cmp    %edx,%eax
     a92:	72 04                	jb     a98 <free+0x58>
     a94:	39 d1                	cmp    %edx,%ecx
     a96:	72 ce                	jb     a66 <free+0x26>
{
     a98:	89 d0                	mov    %edx,%eax
     a9a:	eb bc                	jmp    a58 <free+0x18>
     a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
     aa0:	03 72 04             	add    0x4(%edx),%esi
     aa3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     aa6:	8b 10                	mov    (%eax),%edx
     aa8:	8b 12                	mov    (%edx),%edx
     aaa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     aad:	8b 50 04             	mov    0x4(%eax),%edx
     ab0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     ab3:	39 f1                	cmp    %esi,%ecx
     ab5:	75 c6                	jne    a7d <free+0x3d>
    p->s.size += bp->s.size;
     ab7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
     aba:	a3 20 25 00 00       	mov    %eax,0x2520
    p->s.size += bp->s.size;
     abf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     ac2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
     ac5:	89 08                	mov    %ecx,(%eax)
}
     ac7:	5b                   	pop    %ebx
     ac8:	5e                   	pop    %esi
     ac9:	5f                   	pop    %edi
     aca:	5d                   	pop    %ebp
     acb:	c3                   	ret
     acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	57                   	push   %edi
     ad4:	56                   	push   %esi
     ad5:	53                   	push   %ebx
     ad6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     ad9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     adc:	8b 15 20 25 00 00    	mov    0x2520,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     ae2:	8d 78 07             	lea    0x7(%eax),%edi
     ae5:	c1 ef 03             	shr    $0x3,%edi
     ae8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     aeb:	85 d2                	test   %edx,%edx
     aed:	0f 84 8d 00 00 00    	je     b80 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     af3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     af5:	8b 48 04             	mov    0x4(%eax),%ecx
     af8:	39 f9                	cmp    %edi,%ecx
     afa:	73 64                	jae    b60 <malloc+0x90>
  if(nu < 4096)
     afc:	bb 00 10 00 00       	mov    $0x1000,%ebx
     b01:	39 df                	cmp    %ebx,%edi
     b03:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
     b06:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
     b0d:	eb 0a                	jmp    b19 <malloc+0x49>
     b0f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     b10:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     b12:	8b 48 04             	mov    0x4(%eax),%ecx
     b15:	39 f9                	cmp    %edi,%ecx
     b17:	73 47                	jae    b60 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     b19:	89 c2                	mov    %eax,%edx
     b1b:	3b 05 20 25 00 00    	cmp    0x2520,%eax
     b21:	75 ed                	jne    b10 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
     b23:	83 ec 0c             	sub    $0xc,%esp
     b26:	56                   	push   %esi
     b27:	e8 9f fc ff ff       	call   7cb <sbrk>
  if(p == (char*)-1)
     b2c:	83 c4 10             	add    $0x10,%esp
     b2f:	83 f8 ff             	cmp    $0xffffffff,%eax
     b32:	74 1c                	je     b50 <malloc+0x80>
  hp->s.size = nu;
     b34:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
     b37:	83 ec 0c             	sub    $0xc,%esp
     b3a:	83 c0 08             	add    $0x8,%eax
     b3d:	50                   	push   %eax
     b3e:	e8 fd fe ff ff       	call   a40 <free>
  return freep;
     b43:	8b 15 20 25 00 00    	mov    0x2520,%edx
      if((p = morecore(nunits)) == 0)
     b49:	83 c4 10             	add    $0x10,%esp
     b4c:	85 d2                	test   %edx,%edx
     b4e:	75 c0                	jne    b10 <malloc+0x40>
        return 0;
  }
}
     b50:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     b53:	31 c0                	xor    %eax,%eax
}
     b55:	5b                   	pop    %ebx
     b56:	5e                   	pop    %esi
     b57:	5f                   	pop    %edi
     b58:	5d                   	pop    %ebp
     b59:	c3                   	ret
     b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
     b60:	39 cf                	cmp    %ecx,%edi
     b62:	74 4c                	je     bb0 <malloc+0xe0>
        p->s.size -= nunits;
     b64:	29 f9                	sub    %edi,%ecx
     b66:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     b69:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     b6c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
     b6f:	89 15 20 25 00 00    	mov    %edx,0x2520
}
     b75:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
     b78:	83 c0 08             	add    $0x8,%eax
}
     b7b:	5b                   	pop    %ebx
     b7c:	5e                   	pop    %esi
     b7d:	5f                   	pop    %edi
     b7e:	5d                   	pop    %ebp
     b7f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
     b80:	c7 05 20 25 00 00 24 	movl   $0x2524,0x2520
     b87:	25 00 00 
    base.s.size = 0;
     b8a:	b8 24 25 00 00       	mov    $0x2524,%eax
    base.s.ptr = freep = prevp = &base;
     b8f:	c7 05 24 25 00 00 24 	movl   $0x2524,0x2524
     b96:	25 00 00 
    base.s.size = 0;
     b99:	c7 05 28 25 00 00 00 	movl   $0x0,0x2528
     ba0:	00 00 00 
    if(p->s.size >= nunits){
     ba3:	e9 54 ff ff ff       	jmp    afc <malloc+0x2c>
     ba8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     baf:	00 
        prevp->s.ptr = p->s.ptr;
     bb0:	8b 08                	mov    (%eax),%ecx
     bb2:	89 0a                	mov    %ecx,(%edx)
     bb4:	eb b9                	jmp    b6f <malloc+0x9f>
     bb6:	66 90                	xchg   %ax,%ax
     bb8:	66 90                	xchg   %ax,%ax
     bba:	66 90                	xchg   %ax,%ax
     bbc:	66 90                	xchg   %ax,%ax
     bbe:	66 90                	xchg   %ax,%ax

00000bc0 <thread_init>:
    if (threads[tid].state == T_UNUSED)
        return 0;
    return &threads[tid];
}

void thread_init(void) {
     bc0:	55                   	push   %ebp
     bc1:	b8 60 25 00 00       	mov    $0x2560,%eax
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
     bc6:	31 d2                	xor    %edx,%edx
void thread_init(void) {
     bc8:	89 e5                	mov    %esp,%ebp
     bca:	83 ec 08             	sub    $0x8,%esp
     bcd:	8d 76 00             	lea    0x0(%esi),%esi
        threads[i].state = T_UNUSED;
        threads[i].tid = i;
     bd0:	89 10                	mov    %edx,(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     bd2:	83 c2 01             	add    $0x1,%edx
     bd5:	83 c0 44             	add    $0x44,%eax
        threads[i].state = T_UNUSED;
     bd8:	c7 40 c0 00 00 00 00 	movl   $0x0,-0x40(%eax)
        threads[i].stack = 0;
     bdf:	c7 40 c4 00 00 00 00 	movl   $0x0,-0x3c(%eax)
        threads[i].start_routine = 0;
     be6:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
        threads[i].arg = 0;
     bed:	c7 40 f0 00 00 00 00 	movl   $0x0,-0x10(%eax)
        threads[i].retval = 0;
     bf4:	c7 40 f4 00 00 00 00 	movl   $0x0,-0xc(%eax)
        threads[i].join_waiter = 0;
     bfb:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
        threads[i].sleep_chan = 0;
     c02:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     c09:	83 fa 40             	cmp    $0x40,%edx
     c0c:	75 c2                	jne    bd0 <thread_init+0x10>
    }
    
    threads[0].state = T_RUNNING;
     c0e:	c7 05 64 25 00 00 02 	movl   $0x2,0x2564
     c15:	00 00 00 
    threads[0].tid = 0;
    current_thread = &threads[0];
    next_tid = 1;
    
    printf(1, "[uthreads] Thread library initialized, main thread tid=0\n");
     c18:	83 ec 08             	sub    $0x8,%esp
     c1b:	68 e8 19 00 00       	push   $0x19e8
     c20:	6a 01                	push   $0x1
    threads[0].tid = 0;
     c22:	c7 05 60 25 00 00 00 	movl   $0x0,0x2560
     c29:	00 00 00 
    current_thread = &threads[0];
     c2c:	c7 05 44 25 00 00 60 	movl   $0x2560,0x2544
     c33:	25 00 00 
    next_tid = 1;
     c36:	c7 05 40 25 00 00 01 	movl   $0x1,0x2540
     c3d:	00 00 00 
    printf(1, "[uthreads] Thread library initialized, main thread tid=0\n");
     c40:	e8 6b fc ff ff       	call   8b0 <printf>
}
     c45:	83 c4 10             	add    $0x10,%esp
     c48:	c9                   	leave
     c49:	c3                   	ret
     c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c50 <thread_create>:

int thread_create(void *(*start_routine)(void*), void *arg) {
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	57                   	push   %edi
     c54:	56                   	push   %esi
     c55:	53                   	push   %ebx
     c56:	83 ec 0c             	sub    $0xc,%esp
     c59:	8b 75 08             	mov    0x8(%ebp),%esi
    thread_t *t;
    int i;
    uint *sp;
    
    if (!start_routine)
     c5c:	85 f6                	test   %esi,%esi
     c5e:	0f 84 d6 00 00 00    	je     d3a <thread_create+0xea>
     c64:	b8 64 25 00 00       	mov    $0x2564,%eax
        return -1;
    
    t = 0;
    for (i = 0; i < MAX_THREADS; i++) {
     c69:	31 db                	xor    %ebx,%ebx
     c6b:	eb 12                	jmp    c7f <thread_create+0x2f>
     c6d:	8d 76 00             	lea    0x0(%esi),%esi
     c70:	83 c3 01             	add    $0x1,%ebx
     c73:	83 c0 44             	add    $0x44,%eax
     c76:	83 fb 40             	cmp    $0x40,%ebx
     c79:	0f 84 a9 00 00 00    	je     d28 <thread_create+0xd8>
        if (threads[i].state == T_UNUSED) {
     c7f:	8b 10                	mov    (%eax),%edx
     c81:	85 d2                	test   %edx,%edx
     c83:	75 eb                	jne    c70 <thread_create+0x20>
    if (!t) {
        printf(2, "[uthreads] Error: Thread limit reached\n");
        return -1;
    }
    
    t->stack = malloc(STACK_SIZE);
     c85:	83 ec 0c             	sub    $0xc,%esp
     c88:	6b db 44             	imul   $0x44,%ebx,%ebx
     c8b:	68 00 10 00 00       	push   $0x1000
     c90:	8d bb 60 25 00 00    	lea    0x2560(%ebx),%edi
     c96:	e8 35 fe ff ff       	call   ad0 <malloc>
    if (!t->stack) {
     c9b:	83 c4 10             	add    $0x10,%esp
    t->stack = malloc(STACK_SIZE);
     c9e:	89 47 08             	mov    %eax,0x8(%edi)
    if (!t->stack) {
     ca1:	85 c0                	test   %eax,%eax
     ca3:	0f 84 9e 00 00 00    	je     d47 <thread_create+0xf7>
        return -1;
    }
    
    t->state = T_RUNNABLE;
    t->start_routine = start_routine;
    t->arg = arg;
     ca9:	8b 45 0c             	mov    0xc(%ebp),%eax
    t->retval = 0;
    t->join_waiter = 0;
    t->sleep_chan = 0;
    
    memset(&t->context, 0, sizeof(thread_context_t));
     cac:	83 ec 04             	sub    $0x4,%esp
    t->start_routine = start_routine;
     caf:	89 77 30             	mov    %esi,0x30(%edi)
    t->state = T_RUNNABLE;
     cb2:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
    t->arg = arg;
     cb9:	89 47 34             	mov    %eax,0x34(%edi)
    memset(&t->context, 0, sizeof(thread_context_t));
     cbc:	8d 83 6c 25 00 00    	lea    0x256c(%ebx),%eax
    t->retval = 0;
     cc2:	c7 47 38 00 00 00 00 	movl   $0x0,0x38(%edi)
    t->join_waiter = 0;
     cc9:	c7 47 3c 00 00 00 00 	movl   $0x0,0x3c(%edi)
    t->sleep_chan = 0;
     cd0:	c7 47 40 00 00 00 00 	movl   $0x0,0x40(%edi)
    memset(&t->context, 0, sizeof(thread_context_t));
     cd7:	6a 24                	push   $0x24
     cd9:	6a 00                	push   $0x0
     cdb:	50                   	push   %eax
     cdc:	e8 df f8 ff ff       	call   5c0 <memset>
    
    sp = (uint*)((char*)t->stack + STACK_SIZE);
     ce1:	8b 47 08             	mov    0x8(%edi),%eax
    *sp = (uint)thread_entry;
    
    t->context.esp = (uint)sp;
    t->context.eip = (uint)thread_entry;
    
    printf(1, "[uthreads] Created thread tid=%d\n", t->tid);
     ce4:	83 c4 0c             	add    $0xc,%esp
    *sp = (uint)thread_entry;
     ce7:	c7 80 fc 0f 00 00 b0 	movl   $0xeb0,0xffc(%eax)
     cee:	0e 00 00 
    sp--;
     cf1:	05 fc 0f 00 00       	add    $0xffc,%eax
     cf6:	89 47 28             	mov    %eax,0x28(%edi)
    t->context.eip = (uint)thread_entry;
     cf9:	c7 47 2c b0 0e 00 00 	movl   $0xeb0,0x2c(%edi)
    printf(1, "[uthreads] Created thread tid=%d\n", t->tid);
     d00:	ff b3 60 25 00 00    	push   0x2560(%ebx)
     d06:	68 78 1a 00 00       	push   $0x1a78
     d0b:	6a 01                	push   $0x1
     d0d:	e8 9e fb ff ff       	call   8b0 <printf>
    return t->tid;
     d12:	8b 83 60 25 00 00    	mov    0x2560(%ebx),%eax
     d18:	83 c4 10             	add    $0x10,%esp
}
     d1b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d1e:	5b                   	pop    %ebx
     d1f:	5e                   	pop    %esi
     d20:	5f                   	pop    %edi
     d21:	5d                   	pop    %ebp
     d22:	c3                   	ret
     d23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "[uthreads] Error: Thread limit reached\n");
     d28:	83 ec 08             	sub    $0x8,%esp
     d2b:	68 24 1a 00 00       	push   $0x1a24
     d30:	6a 02                	push   $0x2
     d32:	e8 79 fb ff ff       	call   8b0 <printf>
        return -1;
     d37:	83 c4 10             	add    $0x10,%esp
}
     d3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
     d3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     d42:	5b                   	pop    %ebx
     d43:	5e                   	pop    %esi
     d44:	5f                   	pop    %edi
     d45:	5d                   	pop    %ebp
     d46:	c3                   	ret
        printf(2, "[uthreads] Error: Stack allocation failed\n");
     d47:	83 ec 08             	sub    $0x8,%esp
     d4a:	68 4c 1a 00 00       	push   $0x1a4c
     d4f:	6a 02                	push   $0x2
     d51:	e8 5a fb ff ff       	call   8b0 <printf>
        return -1;
     d56:	83 c4 10             	add    $0x10,%esp
     d59:	eb df                	jmp    d3a <thread_create+0xea>
     d5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000d60 <thread_self>:
    current_thread->state = T_RUNNABLE;
    thread_schedule();
}

int thread_self(void) {
    return current_thread->tid;
     d60:	a1 44 25 00 00       	mov    0x2544,%eax
     d65:	8b 00                	mov    (%eax),%eax
}
     d67:	c3                   	ret
     d68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d6f:	00 

00000d70 <thread_schedule>:

void thread_schedule(void) {
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	83 ec 0c             	sub    $0xc,%esp
    thread_t *old_thread, *new_thread;
    int start, i, idx;
    
    old_thread = current_thread;
     d79:	8b 35 44 25 00 00    	mov    0x2544,%esi
    new_thread = 0;
    
    start = (current_thread->tid + 1) % MAX_THREADS;
     d7f:	8b 06                	mov    (%esi),%eax
     d81:	8d 50 01             	lea    0x1(%eax),%edx
     d84:	89 d0                	mov    %edx,%eax
     d86:	c1 f8 1f             	sar    $0x1f,%eax
     d89:	c1 e8 1a             	shr    $0x1a,%eax
     d8c:	01 c2                	add    %eax,%edx
     d8e:	83 e2 3f             	and    $0x3f,%edx
     d91:	29 c2                	sub    %eax,%edx
     d93:	8d 5a 40             	lea    0x40(%edx),%ebx
     d96:	eb 0f                	jmp    da7 <thread_schedule+0x37>
     d98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d9f:	00 
    for (i = 0; i < MAX_THREADS; i++) {
     da0:	83 c2 01             	add    $0x1,%edx
     da3:	39 da                	cmp    %ebx,%edx
     da5:	74 71                	je     e18 <thread_schedule+0xa8>
        idx = (start + i) % MAX_THREADS;
     da7:	89 d1                	mov    %edx,%ecx
     da9:	c1 f9 1f             	sar    $0x1f,%ecx
     dac:	c1 e9 1a             	shr    $0x1a,%ecx
     daf:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
     db2:	83 e0 3f             	and    $0x3f,%eax
     db5:	29 c8                	sub    %ecx,%eax
        if (threads[idx].state == T_RUNNABLE) {
     db7:	6b c8 44             	imul   $0x44,%eax,%ecx
     dba:	83 b9 64 25 00 00 01 	cmpl   $0x1,0x2564(%ecx)
     dc1:	8d b9 60 25 00 00    	lea    0x2560(%ecx),%edi
     dc7:	75 d7                	jne    da0 <thread_schedule+0x30>
        
        printf(1, "[uthreads] All threads finished or blocked\n");
        exit();
    }
    
    if (new_thread == old_thread) {
     dc9:	39 fe                	cmp    %edi,%esi
     dcb:	74 6b                	je     e38 <thread_schedule+0xc8>
            old_thread->state = T_RUNNING;
        }
        return;
    }
    
    if (old_thread->state == T_RUNNING) {
     dcd:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
     dd1:	74 35                	je     e08 <thread_schedule+0x98>
        old_thread->state = T_RUNNABLE;
    }
    new_thread->state = T_RUNNING;
     dd3:	6b c0 44             	imul   $0x44,%eax,%eax
    current_thread = new_thread;
    
    thread_switch(&old_thread->context, &new_thread->context);
     dd6:	83 ec 08             	sub    $0x8,%esp
     dd9:	81 c1 6c 25 00 00    	add    $0x256c,%ecx
     ddf:	83 c6 0c             	add    $0xc,%esi
    current_thread = new_thread;
     de2:	89 3d 44 25 00 00    	mov    %edi,0x2544
    new_thread->state = T_RUNNING;
     de8:	c7 80 64 25 00 00 02 	movl   $0x2,0x2564(%eax)
     def:	00 00 00 
    thread_switch(&old_thread->context, &new_thread->context);
     df2:	51                   	push   %ecx
     df3:	56                   	push   %esi
     df4:	e8 3c 09 00 00       	call   1735 <thread_switch>
     df9:	83 c4 10             	add    $0x10,%esp
}
     dfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dff:	5b                   	pop    %ebx
     e00:	5e                   	pop    %esi
     e01:	5f                   	pop    %edi
     e02:	5d                   	pop    %ebp
     e03:	c3                   	ret
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        old_thread->state = T_RUNNABLE;
     e08:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
     e0f:	eb c2                	jmp    dd3 <thread_schedule+0x63>
     e11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (current_thread->state == T_RUNNING) {
     e18:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
     e1c:	74 de                	je     dfc <thread_schedule+0x8c>
        printf(1, "[uthreads] All threads finished or blocked\n");
     e1e:	50                   	push   %eax
     e1f:	50                   	push   %eax
     e20:	68 9c 1a 00 00       	push   $0x1a9c
     e25:	6a 01                	push   $0x1
     e27:	e8 84 fa ff ff       	call   8b0 <printf>
        exit();
     e2c:	e8 12 f9 ff ff       	call   743 <exit>
     e31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            old_thread->state = T_RUNNING;
     e38:	c7 46 04 02 00 00 00 	movl   $0x2,0x4(%esi)
     e3f:	eb bb                	jmp    dfc <thread_schedule+0x8c>
     e41:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e48:	00 
     e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e50 <thread_exit>:
void thread_exit(void *retval) {
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	83 ec 0c             	sub    $0xc,%esp
    current_thread->retval = retval;
     e56:	a1 44 25 00 00       	mov    0x2544,%eax
     e5b:	8b 55 08             	mov    0x8(%ebp),%edx
    current_thread->state = T_ZOMBIE;
     e5e:	c7 40 04 04 00 00 00 	movl   $0x4,0x4(%eax)
    current_thread->retval = retval;
     e65:	89 50 38             	mov    %edx,0x38(%eax)
    printf(1, "[uthreads] Thread tid=%d exiting\n", current_thread->tid);
     e68:	ff 30                	push   (%eax)
     e6a:	68 c8 1a 00 00       	push   $0x1ac8
     e6f:	6a 01                	push   $0x1
     e71:	e8 3a fa ff ff       	call   8b0 <printf>
    if (current_thread->join_waiter) {
     e76:	a1 44 25 00 00       	mov    0x2544,%eax
     e7b:	83 c4 10             	add    $0x10,%esp
     e7e:	8b 50 3c             	mov    0x3c(%eax),%edx
     e81:	85 d2                	test   %edx,%edx
     e83:	74 11                	je     e96 <thread_exit+0x46>
        current_thread->join_waiter->state = T_RUNNABLE;
     e85:	c7 42 04 01 00 00 00 	movl   $0x1,0x4(%edx)
        current_thread->join_waiter->sleep_chan = 0;
     e8c:	8b 40 3c             	mov    0x3c(%eax),%eax
     e8f:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
    thread_schedule();
     e96:	e8 d5 fe ff ff       	call   d70 <thread_schedule>
    printf(2, "[uthreads] Error: thread_exit should not return\n");
     e9b:	83 ec 08             	sub    $0x8,%esp
     e9e:	68 ec 1a 00 00       	push   $0x1aec
     ea3:	6a 02                	push   $0x2
     ea5:	e8 06 fa ff ff       	call   8b0 <printf>
    exit();
     eaa:	e8 94 f8 ff ff       	call   743 <exit>
     eaf:	90                   	nop

00000eb0 <thread_entry>:
static void thread_entry(void) {
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	83 ec 14             	sub    $0x14,%esp
    void *ret = current_thread->start_routine(current_thread->arg);
     eb6:	a1 44 25 00 00       	mov    0x2544,%eax
     ebb:	ff 70 34             	push   0x34(%eax)
     ebe:	ff 50 30             	call   *0x30(%eax)
    thread_exit(ret);
     ec1:	89 04 24             	mov    %eax,(%esp)
     ec4:	e8 87 ff ff ff       	call   e50 <thread_exit>
     ec9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ed0 <thread_join>:
void *thread_join(int tid) {
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	57                   	push   %edi
     ed4:	56                   	push   %esi
     ed5:	53                   	push   %ebx
     ed6:	83 ec 0c             	sub    $0xc,%esp
     ed9:	8b 75 08             	mov    0x8(%ebp),%esi
    if (tid < 0 || tid >= MAX_THREADS)
     edc:	83 fe 3f             	cmp    $0x3f,%esi
     edf:	77 67                	ja     f48 <thread_join+0x78>
    if (threads[tid].state == T_UNUSED)
     ee1:	6b de 44             	imul   $0x44,%esi,%ebx
     ee4:	81 c3 60 25 00 00    	add    $0x2560,%ebx
     eea:	8b 43 04             	mov    0x4(%ebx),%eax
     eed:	85 c0                	test   %eax,%eax
     eef:	74 57                	je     f48 <thread_join+0x78>
    if (!t || t == current_thread) {
     ef1:	39 1d 44 25 00 00    	cmp    %ebx,0x2544
     ef7:	74 4f                	je     f48 <thread_join+0x78>
    while (t->state != T_ZOMBIE) {
     ef9:	83 f8 04             	cmp    $0x4,%eax
     efc:	75 1f                	jne    f1d <thread_join+0x4d>
     efe:	eb 60                	jmp    f60 <thread_join+0x90>
        t->join_waiter = current_thread;
     f00:	a1 44 25 00 00       	mov    0x2544,%eax
     f05:	89 43 3c             	mov    %eax,0x3c(%ebx)
        current_thread->sleep_chan = t;
     f08:	89 58 40             	mov    %ebx,0x40(%eax)
        current_thread->state = T_SLEEPING;
     f0b:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
        thread_schedule();
     f12:	e8 59 fe ff ff       	call   d70 <thread_schedule>
    while (t->state != T_ZOMBIE) {
     f17:	83 7b 04 04          	cmpl   $0x4,0x4(%ebx)
     f1b:	74 43                	je     f60 <thread_join+0x90>
        if (t->join_waiter) {
     f1d:	8b 43 3c             	mov    0x3c(%ebx),%eax
     f20:	85 c0                	test   %eax,%eax
     f22:	74 dc                	je     f00 <thread_join+0x30>
            printf(2, "[uthreads] Error: Thread tid=%d already being joined\n", tid);
     f24:	83 ec 04             	sub    $0x4,%esp
     f27:	56                   	push   %esi
     f28:	68 50 1b 00 00       	push   $0x1b50
     f2d:	6a 02                	push   $0x2
     f2f:	e8 7c f9 ff ff       	call   8b0 <printf>
            return 0;
     f34:	83 c4 10             	add    $0x10,%esp
}
     f37:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     f3a:	31 ff                	xor    %edi,%edi
}
     f3c:	5b                   	pop    %ebx
     f3d:	89 f8                	mov    %edi,%eax
     f3f:	5e                   	pop    %esi
     f40:	5f                   	pop    %edi
     f41:	5d                   	pop    %ebp
     f42:	c3                   	ret
     f43:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "[uthreads] Error: Invalid join target tid=%d\n", tid);
     f48:	83 ec 04             	sub    $0x4,%esp
     f4b:	56                   	push   %esi
     f4c:	68 20 1b 00 00       	push   $0x1b20
     f51:	6a 02                	push   $0x2
     f53:	e8 58 f9 ff ff       	call   8b0 <printf>
        return 0;
     f58:	83 c4 10             	add    $0x10,%esp
     f5b:	eb da                	jmp    f37 <thread_join+0x67>
     f5d:	8d 76 00             	lea    0x0(%esi),%esi
    retval = t->retval;
     f60:	6b de 44             	imul   $0x44,%esi,%ebx
     f63:	81 c3 60 25 00 00    	add    $0x2560,%ebx
    if (t->stack) {
     f69:	8b 43 08             	mov    0x8(%ebx),%eax
    retval = t->retval;
     f6c:	8b 7b 38             	mov    0x38(%ebx),%edi
    if (t->stack) {
     f6f:	85 c0                	test   %eax,%eax
     f71:	74 13                	je     f86 <thread_join+0xb6>
        free(t->stack);
     f73:	83 ec 0c             	sub    $0xc,%esp
     f76:	50                   	push   %eax
     f77:	e8 c4 fa ff ff       	call   a40 <free>
        t->stack = 0;
     f7c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
     f83:	83 c4 10             	add    $0x10,%esp
    t->state = T_UNUSED;
     f86:	6b c6 44             	imul   $0x44,%esi,%eax
    printf(1, "[uthreads] Thread tid=%d joined\n", tid);
     f89:	83 ec 04             	sub    $0x4,%esp
    t->state = T_UNUSED;
     f8c:	c7 80 64 25 00 00 00 	movl   $0x0,0x2564(%eax)
     f93:	00 00 00 
    printf(1, "[uthreads] Thread tid=%d joined\n", tid);
     f96:	56                   	push   %esi
     f97:	68 88 1b 00 00       	push   $0x1b88
     f9c:	6a 01                	push   $0x1
     f9e:	e8 0d f9 ff ff       	call   8b0 <printf>
    return retval;
     fa3:	83 c4 10             	add    $0x10,%esp
}
     fa6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fa9:	89 f8                	mov    %edi,%eax
     fab:	5b                   	pop    %ebx
     fac:	5e                   	pop    %esi
     fad:	5f                   	pop    %edi
     fae:	5d                   	pop    %ebp
     faf:	c3                   	ret

00000fb0 <thread_yield>:
    current_thread->state = T_RUNNABLE;
     fb0:	a1 44 25 00 00       	mov    0x2544,%eax
     fb5:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    thread_schedule();
     fbc:	e9 af fd ff ff       	jmp    d70 <thread_schedule>
     fc1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     fc8:	00 
     fc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000fd0 <thread_sleep>:

void thread_sleep(void *chan) {
     fd0:	55                   	push   %ebp
    current_thread->sleep_chan = chan;
     fd1:	a1 44 25 00 00       	mov    0x2544,%eax
    current_thread->state = T_SLEEPING;
     fd6:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
void thread_sleep(void *chan) {
     fdd:	89 e5                	mov    %esp,%ebp
    current_thread->sleep_chan = chan;
     fdf:	8b 55 08             	mov    0x8(%ebp),%edx
     fe2:	89 50 40             	mov    %edx,0x40(%eax)
    thread_schedule();
}
     fe5:	5d                   	pop    %ebp
    thread_schedule();
     fe6:	e9 85 fd ff ff       	jmp    d70 <thread_schedule>
     feb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000ff0 <thread_wakeup>:

void thread_wakeup(void *chan) {
     ff0:	55                   	push   %ebp
     ff1:	b8 64 25 00 00       	mov    $0x2564,%eax
     ff6:	ba 64 36 00 00       	mov    $0x3664,%edx
     ffb:	89 e5                	mov    %esp,%ebp
     ffd:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1000:	eb 0d                	jmp    100f <thread_wakeup+0x1f>
    1002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
    1008:	83 c0 44             	add    $0x44,%eax
    100b:	39 c2                	cmp    %eax,%edx
    100d:	74 1e                	je     102d <thread_wakeup+0x3d>
        if (threads[i].state == T_SLEEPING && threads[i].sleep_chan == chan) {
    100f:	83 38 03             	cmpl   $0x3,(%eax)
    1012:	75 f4                	jne    1008 <thread_wakeup+0x18>
    1014:	39 48 3c             	cmp    %ecx,0x3c(%eax)
    1017:	75 ef                	jne    1008 <thread_wakeup+0x18>
            threads[i].state = T_RUNNABLE;
    1019:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
    101f:	83 c0 44             	add    $0x44,%eax
            threads[i].sleep_chan = 0;
    1022:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
    1029:	39 c2                	cmp    %eax,%edx
    102b:	75 e2                	jne    100f <thread_wakeup+0x1f>
        }
    }
}
    102d:	5d                   	pop    %ebp
    102e:	c3                   	ret
    102f:	90                   	nop

00001030 <mutex_init>:
#include "types.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

void mutex_init(mutex_t *m) {
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	8b 45 08             	mov    0x8(%ebp),%eax
    m->locked = 0;
    1036:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    m->owner = -1;
    103c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    m->wait_chan = m;
    1043:	89 40 08             	mov    %eax,0x8(%eax)
}
    1046:	5d                   	pop    %ebp
    1047:	c3                   	ret
    1048:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    104f:	00 

00001050 <mutex_lock>:

void mutex_lock(mutex_t *m) {
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	53                   	push   %ebx
    1054:	83 ec 04             	sub    $0x4,%esp
    1057:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    105a:	8b 13                	mov    (%ebx),%edx
    105c:	85 d2                	test   %edx,%edx
    105e:	74 14                	je     1074 <mutex_lock+0x24>
        thread_sleep(m->wait_chan);
    1060:	83 ec 0c             	sub    $0xc,%esp
    1063:	ff 73 08             	push   0x8(%ebx)
    1066:	e8 65 ff ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    106b:	8b 03                	mov    (%ebx),%eax
    106d:	83 c4 10             	add    $0x10,%esp
    1070:	85 c0                	test   %eax,%eax
    1072:	75 ec                	jne    1060 <mutex_lock+0x10>
    }
    
    m->locked = 1;
    1074:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
    107a:	e8 e1 fc ff ff       	call   d60 <thread_self>
    107f:	89 43 04             	mov    %eax,0x4(%ebx)
}
    1082:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1085:	c9                   	leave
    1086:	c3                   	ret
    1087:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    108e:	00 
    108f:	90                   	nop

00001090 <mutex_unlock>:

void mutex_unlock(mutex_t *m) {
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	53                   	push   %ebx
    1095:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (m->owner != thread_self()) {
    1098:	8b 73 04             	mov    0x4(%ebx),%esi
    109b:	e8 c0 fc ff ff       	call   d60 <thread_self>
    10a0:	39 c6                	cmp    %eax,%esi
    10a2:	74 1c                	je     10c0 <mutex_unlock+0x30>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    10a4:	83 ec 08             	sub    $0x8,%esp
    10a7:	68 ac 1b 00 00       	push   $0x1bac
    10ac:	6a 02                	push   $0x2
    10ae:	e8 fd f7 ff ff       	call   8b0 <printf>
        return;
    10b3:	83 c4 10             	add    $0x10,%esp
    
    m->locked = 0;
    m->owner = -1;
    
    thread_wakeup(m->wait_chan);
}
    10b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10b9:	5b                   	pop    %ebx
    10ba:	5e                   	pop    %esi
    10bb:	5d                   	pop    %ebp
    10bc:	c3                   	ret
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    thread_wakeup(m->wait_chan);
    10c0:	8b 43 08             	mov    0x8(%ebx),%eax
    m->locked = 0;
    10c3:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    m->owner = -1;
    10c9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
    thread_wakeup(m->wait_chan);
    10d0:	89 45 08             	mov    %eax,0x8(%ebp)
}
    10d3:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d6:	5b                   	pop    %ebx
    10d7:	5e                   	pop    %esi
    10d8:	5d                   	pop    %ebp
    thread_wakeup(m->wait_chan);
    10d9:	e9 12 ff ff ff       	jmp    ff0 <thread_wakeup>
    10de:	66 90                	xchg   %ax,%ax

000010e0 <mutex_trylock>:

int mutex_trylock(mutex_t *m) {
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	53                   	push   %ebx
    10e4:	83 ec 04             	sub    $0x4,%esp
    10e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (m->locked) {
    10ea:	8b 03                	mov    (%ebx),%eax
    10ec:	85 c0                	test   %eax,%eax
    10ee:	74 10                	je     1100 <mutex_trylock+0x20>
    }
    
    m->locked = 1;
    m->owner = thread_self();
    return 1;
}
    10f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10f3:	31 c0                	xor    %eax,%eax
    10f5:	c9                   	leave
    10f6:	c3                   	ret
    10f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10fe:	00 
    10ff:	90                   	nop
    m->locked = 1;
    1100:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
    1106:	e8 55 fc ff ff       	call   d60 <thread_self>
    110b:	89 43 04             	mov    %eax,0x4(%ebx)
    return 1;
    110e:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1113:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1116:	c9                   	leave
    1117:	c3                   	ret
    1118:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    111f:	00 

00001120 <cond_init>:

void cond_init(cond_t *c) {
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 45 08             	mov    0x8(%ebp),%eax
    c->wait_chan = c;
    1126:	89 00                	mov    %eax,(%eax)
}
    1128:	5d                   	pop    %ebp
    1129:	c3                   	ret
    112a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001130 <cond_wait>:

void cond_wait(cond_t *c, mutex_t *m) {
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	56                   	push   %esi
    1135:	53                   	push   %ebx
    1136:	83 ec 0c             	sub    $0xc,%esp
    1139:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    113c:	8b 7d 08             	mov    0x8(%ebp),%edi
    if (m->owner != thread_self()) {
    113f:	8b 73 04             	mov    0x4(%ebx),%esi
    1142:	e8 19 fc ff ff       	call   d60 <thread_self>
    1147:	39 c6                	cmp    %eax,%esi
    1149:	74 1d                	je     1168 <cond_wait+0x38>
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
    114b:	c7 45 0c f4 1b 00 00 	movl   $0x1bf4,0xc(%ebp)
    1152:	c7 45 08 02 00 00 00 	movl   $0x2,0x8(%ebp)
    thread_wakeup(m->wait_chan);
    
    thread_sleep(c->wait_chan);
    
    mutex_lock(m);
}
    1159:	8d 65 f4             	lea    -0xc(%ebp),%esp
    115c:	5b                   	pop    %ebx
    115d:	5e                   	pop    %esi
    115e:	5f                   	pop    %edi
    115f:	5d                   	pop    %ebp
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
    1160:	e9 4b f7 ff ff       	jmp    8b0 <printf>
    1165:	8d 76 00             	lea    0x0(%esi),%esi
    thread_wakeup(m->wait_chan);
    1168:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    116b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    m->owner = -1;
    1171:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
    thread_wakeup(m->wait_chan);
    1178:	ff 73 08             	push   0x8(%ebx)
    117b:	e8 70 fe ff ff       	call   ff0 <thread_wakeup>
    thread_sleep(c->wait_chan);
    1180:	5a                   	pop    %edx
    1181:	ff 37                	push   (%edi)
    1183:	e8 48 fe ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    1188:	8b 0b                	mov    (%ebx),%ecx
    118a:	83 c4 10             	add    $0x10,%esp
    118d:	85 c9                	test   %ecx,%ecx
    118f:	74 1b                	je     11ac <cond_wait+0x7c>
    1191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    1198:	83 ec 0c             	sub    $0xc,%esp
    119b:	ff 73 08             	push   0x8(%ebx)
    119e:	e8 2d fe ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    11a3:	8b 03                	mov    (%ebx),%eax
    11a5:	83 c4 10             	add    $0x10,%esp
    11a8:	85 c0                	test   %eax,%eax
    11aa:	75 ec                	jne    1198 <cond_wait+0x68>
    m->locked = 1;
    11ac:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
    11b2:	e8 a9 fb ff ff       	call   d60 <thread_self>
    11b7:	89 43 04             	mov    %eax,0x4(%ebx)
}
    11ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11bd:	5b                   	pop    %ebx
    11be:	5e                   	pop    %esi
    11bf:	5f                   	pop    %edi
    11c0:	5d                   	pop    %ebp
    11c1:	c3                   	ret
    11c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    11c9:	00 
    11ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000011d0 <cond_signal>:

void cond_signal(cond_t *c) {
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    thread_wakeup(c->wait_chan);
    11d3:	8b 45 08             	mov    0x8(%ebp),%eax
    11d6:	8b 00                	mov    (%eax),%eax
    11d8:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11db:	5d                   	pop    %ebp
    thread_wakeup(c->wait_chan);
    11dc:	e9 0f fe ff ff       	jmp    ff0 <thread_wakeup>
    11e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    11e8:	00 
    11e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011f0 <cond_broadcast>:

void cond_broadcast(cond_t *c) {
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	8b 45 08             	mov    0x8(%ebp),%eax
    11f6:	8b 00                	mov    (%eax),%eax
    11f8:	89 45 08             	mov    %eax,0x8(%ebp)
    11fb:	5d                   	pop    %ebp
    11fc:	e9 ef fd ff ff       	jmp    ff0 <thread_wakeup>
    1201:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1208:	00 
    1209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001210 <channel_create>:
    thread_wakeup(c->wait_chan);
}

channel_t *channel_create(int capacity) {
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
    1215:	8b 75 08             	mov    0x8(%ebp),%esi
    channel_t *ch;
    
    if (capacity <= 0) {
    1218:	85 f6                	test   %esi,%esi
    121a:	0f 8e 90 00 00 00    	jle    12b0 <channel_create+0xa0>
        printf(2, "[uthreads] Error: Channel capacity must be greater than 0\n");
        return 0;
    }
    
    ch = (channel_t*)malloc(sizeof(channel_t));
    1220:	83 ec 0c             	sub    $0xc,%esp
    1223:	6a 2c                	push   $0x2c
    1225:	e8 a6 f8 ff ff       	call   ad0 <malloc>
    if (!ch) {
    122a:	83 c4 10             	add    $0x10,%esp
    ch = (channel_t*)malloc(sizeof(channel_t));
    122d:	89 c3                	mov    %eax,%ebx
    if (!ch) {
    122f:	85 c0                	test   %eax,%eax
    1231:	0f 84 99 00 00 00    	je     12d0 <channel_create+0xc0>
        printf(2, "[uthreads] Error: Channel allocation failed\n");
        return 0;
    }
    
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
    1237:	83 ec 0c             	sub    $0xc,%esp
    123a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
    1241:	50                   	push   %eax
    1242:	e8 89 f8 ff ff       	call   ad0 <malloc>
    if (!ch->buffer) {
    1247:	83 c4 10             	add    $0x10,%esp
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
    124a:	89 03                	mov    %eax,(%ebx)
    if (!ch->buffer) {
    124c:	85 c0                	test   %eax,%eax
    124e:	0f 84 9c 00 00 00    	je     12f0 <channel_create+0xe0>
    ch->count = 0;
    ch->read_idx = 0;
    ch->write_idx = 0;
    ch->is_closed = 0;
    
    mutex_init(&ch->lock);
    1254:	8d 43 18             	lea    0x18(%ebx),%eax
    cond_init(&ch->not_empty);
    cond_init(&ch->not_full);
    
    printf(1, "[uthreads] Channel created successfully, capacity=%d\n", capacity);
    1257:	83 ec 04             	sub    $0x4,%esp
    ch->capacity = capacity;
    125a:	89 73 04             	mov    %esi,0x4(%ebx)
    mutex_init(&ch->lock);
    125d:	89 43 20             	mov    %eax,0x20(%ebx)
    cond_init(&ch->not_empty);
    1260:	8d 43 24             	lea    0x24(%ebx),%eax
    1263:	89 43 24             	mov    %eax,0x24(%ebx)
    cond_init(&ch->not_full);
    1266:	8d 43 28             	lea    0x28(%ebx),%eax
    ch->count = 0;
    1269:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    ch->read_idx = 0;
    1270:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    ch->write_idx = 0;
    1277:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    ch->is_closed = 0;
    127e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    m->locked = 0;
    1285:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    128c:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    cond_init(&ch->not_full);
    1293:	89 43 28             	mov    %eax,0x28(%ebx)
    printf(1, "[uthreads] Channel created successfully, capacity=%d\n", capacity);
    1296:	56                   	push   %esi
    1297:	68 d0 1c 00 00       	push   $0x1cd0
    129c:	6a 01                	push   $0x1
    129e:	e8 0d f6 ff ff       	call   8b0 <printf>
    return ch;
    12a3:	83 c4 10             	add    $0x10,%esp
}
    12a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12a9:	89 d8                	mov    %ebx,%eax
    12ab:	5b                   	pop    %ebx
    12ac:	5e                   	pop    %esi
    12ad:	5d                   	pop    %ebp
    12ae:	c3                   	ret
    12af:	90                   	nop
        printf(2, "[uthreads] Error: Channel capacity must be greater than 0\n");
    12b0:	83 ec 08             	sub    $0x8,%esp
        return 0;
    12b3:	31 db                	xor    %ebx,%ebx
        printf(2, "[uthreads] Error: Channel capacity must be greater than 0\n");
    12b5:	68 30 1c 00 00       	push   $0x1c30
    12ba:	6a 02                	push   $0x2
    12bc:	e8 ef f5 ff ff       	call   8b0 <printf>
        return 0;
    12c1:	83 c4 10             	add    $0x10,%esp
    12c4:	eb e0                	jmp    12a6 <channel_create+0x96>
    12c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    12cd:	00 
    12ce:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] Error: Channel allocation failed\n");
    12d0:	83 ec 08             	sub    $0x8,%esp
        return 0;
    12d3:	31 db                	xor    %ebx,%ebx
        printf(2, "[uthreads] Error: Channel allocation failed\n");
    12d5:	68 6c 1c 00 00       	push   $0x1c6c
    12da:	6a 02                	push   $0x2
    12dc:	e8 cf f5 ff ff       	call   8b0 <printf>
        return 0;
    12e1:	83 c4 10             	add    $0x10,%esp
    12e4:	eb c0                	jmp    12a6 <channel_create+0x96>
    12e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    12ed:	00 
    12ee:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] Error: Channel buffer allocation failed\n");
    12f0:	83 ec 08             	sub    $0x8,%esp
    12f3:	68 9c 1c 00 00       	push   $0x1c9c
    12f8:	6a 02                	push   $0x2
    12fa:	e8 b1 f5 ff ff       	call   8b0 <printf>
        free(ch);
    12ff:	89 1c 24             	mov    %ebx,(%esp)
        return 0;
    1302:	31 db                	xor    %ebx,%ebx
        free(ch);
    1304:	e8 37 f7 ff ff       	call   a40 <free>
        return 0;
    1309:	83 c4 10             	add    $0x10,%esp
    130c:	eb 98                	jmp    12a6 <channel_create+0x96>
    130e:	66 90                	xchg   %ax,%ax

00001310 <channel_send>:

int channel_send(channel_t *ch, void *data) {
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	56                   	push   %esi
    1315:	53                   	push   %ebx
    1316:	83 ec 0c             	sub    $0xc,%esp
    1319:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    131c:	8b 7b 18             	mov    0x18(%ebx),%edi
    131f:	85 ff                	test   %edi,%edi
    1321:	74 1a                	je     133d <channel_send+0x2d>
    1323:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    1328:	83 ec 0c             	sub    $0xc,%esp
    132b:	ff 73 20             	push   0x20(%ebx)
    132e:	e8 9d fc ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    1333:	8b 73 18             	mov    0x18(%ebx),%esi
    1336:	83 c4 10             	add    $0x10,%esp
    1339:	85 f6                	test   %esi,%esi
    133b:	75 eb                	jne    1328 <channel_send+0x18>
    m->locked = 1;
    133d:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    1344:	e8 17 fa ff ff       	call   d60 <thread_self>
    mutex_lock(&ch->lock);
    
    if (ch->is_closed) {
    1349:	8b 73 14             	mov    0x14(%ebx),%esi
    m->owner = thread_self();
    134c:	89 43 1c             	mov    %eax,0x1c(%ebx)
    134f:	89 c7                	mov    %eax,%edi
    if (ch->is_closed) {
    1351:	85 f6                	test   %esi,%esi
    1353:	0f 85 56 01 00 00    	jne    14af <channel_send+0x19f>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    while (ch->count == ch->capacity && !ch->is_closed) {
    1359:	8b 43 04             	mov    0x4(%ebx),%eax
    135c:	39 43 08             	cmp    %eax,0x8(%ebx)
    135f:	74 34                	je     1395 <channel_send+0x85>
    1361:	e9 9d 00 00 00       	jmp    1403 <channel_send+0xf3>
    1366:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    136d:	00 
    136e:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
    1370:	83 ec 08             	sub    $0x8,%esp
    1373:	68 f4 1b 00 00       	push   $0x1bf4
    1378:	6a 02                	push   $0x2
    137a:	e8 31 f5 ff ff       	call   8b0 <printf>
        cond_wait(&ch->not_full, &ch->lock);
    }
    
    if (ch->is_closed) {
    137f:	8b 43 14             	mov    0x14(%ebx),%eax
    while (ch->count == ch->capacity && !ch->is_closed) {
    1382:	8b 4b 04             	mov    0x4(%ebx),%ecx
        return;
    1385:	83 c4 10             	add    $0x10,%esp
    while (ch->count == ch->capacity && !ch->is_closed) {
    1388:	39 4b 08             	cmp    %ecx,0x8(%ebx)
    138b:	75 72                	jne    13ff <channel_send+0xef>
    138d:	85 c0                	test   %eax,%eax
    138f:	0f 85 eb 00 00 00    	jne    1480 <channel_send+0x170>
    if (m->owner != thread_self()) {
    1395:	8b 7b 1c             	mov    0x1c(%ebx),%edi
    1398:	e8 c3 f9 ff ff       	call   d60 <thread_self>
    139d:	39 c7                	cmp    %eax,%edi
    139f:	75 cf                	jne    1370 <channel_send+0x60>
    thread_wakeup(m->wait_chan);
    13a1:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    13a4:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    13ab:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    13b2:	ff 73 20             	push   0x20(%ebx)
    13b5:	e8 36 fc ff ff       	call   ff0 <thread_wakeup>
    thread_sleep(c->wait_chan);
    13ba:	5a                   	pop    %edx
    13bb:	ff 73 28             	push   0x28(%ebx)
    13be:	e8 0d fc ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    13c3:	8b 4b 18             	mov    0x18(%ebx),%ecx
    13c6:	83 c4 10             	add    $0x10,%esp
    13c9:	85 c9                	test   %ecx,%ecx
    13cb:	74 18                	je     13e5 <channel_send+0xd5>
    13cd:	8d 76 00             	lea    0x0(%esi),%esi
        thread_sleep(m->wait_chan);
    13d0:	83 ec 0c             	sub    $0xc,%esp
    13d3:	ff 73 20             	push   0x20(%ebx)
    13d6:	e8 f5 fb ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    13db:	8b 43 18             	mov    0x18(%ebx),%eax
    13de:	83 c4 10             	add    $0x10,%esp
    13e1:	85 c0                	test   %eax,%eax
    13e3:	75 eb                	jne    13d0 <channel_send+0xc0>
    m->locked = 1;
    13e5:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    13ec:	e8 6f f9 ff ff       	call   d60 <thread_self>
    while (ch->count == ch->capacity && !ch->is_closed) {
    13f1:	8b 4b 04             	mov    0x4(%ebx),%ecx
    m->owner = thread_self();
    13f4:	89 43 1c             	mov    %eax,0x1c(%ebx)
    if (ch->is_closed) {
    13f7:	8b 43 14             	mov    0x14(%ebx),%eax
    while (ch->count == ch->capacity && !ch->is_closed) {
    13fa:	39 4b 08             	cmp    %ecx,0x8(%ebx)
    13fd:	74 8e                	je     138d <channel_send+0x7d>
    if (ch->is_closed) {
    13ff:	85 c0                	test   %eax,%eax
    1401:	75 7d                	jne    1480 <channel_send+0x170>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    ch->buffer[ch->write_idx] = data;
    1403:	8b 53 10             	mov    0x10(%ebx),%edx
    1406:	8b 03                	mov    (%ebx),%eax
    thread_wakeup(c->wait_chan);
    1408:	83 ec 0c             	sub    $0xc,%esp
    ch->buffer[ch->write_idx] = data;
    140b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    140e:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    1411:	8b 43 10             	mov    0x10(%ebx),%eax
    ch->count++;
    1414:	83 43 08 01          	addl   $0x1,0x8(%ebx)
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    1418:	83 c0 01             	add    $0x1,%eax
    141b:	99                   	cltd
    141c:	f7 7b 04             	idivl  0x4(%ebx)
    141f:	89 53 10             	mov    %edx,0x10(%ebx)
    thread_wakeup(c->wait_chan);
    1422:	ff 73 24             	push   0x24(%ebx)
    1425:	e8 c6 fb ff ff       	call   ff0 <thread_wakeup>
    if (m->owner != thread_self()) {
    142a:	8b 7b 1c             	mov    0x1c(%ebx),%edi
    142d:	e8 2e f9 ff ff       	call   d60 <thread_self>
    1432:	83 c4 10             	add    $0x10,%esp
    1435:	39 c7                	cmp    %eax,%edi
    1437:	75 27                	jne    1460 <channel_send+0x150>
    thread_wakeup(m->wait_chan);
    1439:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    143c:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    1443:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    144a:	ff 73 20             	push   0x20(%ebx)
    144d:	e8 9e fb ff ff       	call   ff0 <thread_wakeup>
    1452:	83 c4 10             	add    $0x10,%esp
    
    cond_signal(&ch->not_empty);
    
    mutex_unlock(&ch->lock);
    return 0;
}
    1455:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1458:	89 f0                	mov    %esi,%eax
    145a:	5b                   	pop    %ebx
    145b:	5e                   	pop    %esi
    145c:	5f                   	pop    %edi
    145d:	5d                   	pop    %ebp
    145e:	c3                   	ret
    145f:	90                   	nop
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    1460:	83 ec 08             	sub    $0x8,%esp
    1463:	68 ac 1b 00 00       	push   $0x1bac
    1468:	6a 02                	push   $0x2
    146a:	e8 41 f4 ff ff       	call   8b0 <printf>
        return;
    146f:	83 c4 10             	add    $0x10,%esp
}
    1472:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1475:	89 f0                	mov    %esi,%eax
    1477:	5b                   	pop    %ebx
    1478:	5e                   	pop    %esi
    1479:	5f                   	pop    %edi
    147a:	5d                   	pop    %ebp
    147b:	c3                   	ret
    147c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (m->owner != thread_self()) {
    1480:	8b 73 1c             	mov    0x1c(%ebx),%esi
    1483:	e8 d8 f8 ff ff       	call   d60 <thread_self>
    1488:	39 c6                	cmp    %eax,%esi
    148a:	75 2c                	jne    14b8 <channel_send+0x1a8>
    thread_wakeup(m->wait_chan);
    148c:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    148f:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    1496:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    149d:	ff 73 20             	push   0x20(%ebx)
    14a0:	e8 4b fb ff ff       	call   ff0 <thread_wakeup>
    14a5:	83 c4 10             	add    $0x10,%esp
        return -1;
    14a8:	be ff ff ff ff       	mov    $0xffffffff,%esi
    14ad:	eb a6                	jmp    1455 <channel_send+0x145>
    if (m->owner != thread_self()) {
    14af:	e8 ac f8 ff ff       	call   d60 <thread_self>
    14b4:	39 c7                	cmp    %eax,%edi
    14b6:	74 d4                	je     148c <channel_send+0x17c>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    14b8:	83 ec 08             	sub    $0x8,%esp
    14bb:	68 ac 1b 00 00       	push   $0x1bac
    14c0:	6a 02                	push   $0x2
    14c2:	e8 e9 f3 ff ff       	call   8b0 <printf>
        return;
    14c7:	83 c4 10             	add    $0x10,%esp
    14ca:	eb dc                	jmp    14a8 <channel_send+0x198>
    14cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014d0 <channel_recv>:

int channel_recv(channel_t *ch, void **data) {
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	56                   	push   %esi
    14d4:	53                   	push   %ebx
    14d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    14d8:	8b 43 18             	mov    0x18(%ebx),%eax
    14db:	85 c0                	test   %eax,%eax
    14dd:	74 16                	je     14f5 <channel_recv+0x25>
    14df:	90                   	nop
        thread_sleep(m->wait_chan);
    14e0:	83 ec 0c             	sub    $0xc,%esp
    14e3:	ff 73 20             	push   0x20(%ebx)
    14e6:	e8 e5 fa ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    14eb:	8b 43 18             	mov    0x18(%ebx),%eax
    14ee:	83 c4 10             	add    $0x10,%esp
    14f1:	85 c0                	test   %eax,%eax
    14f3:	75 eb                	jne    14e0 <channel_recv+0x10>
    m->locked = 1;
    14f5:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    14fc:	e8 5f f8 ff ff       	call   d60 <thread_self>
    1501:	89 43 1c             	mov    %eax,0x1c(%ebx)
    mutex_lock(&ch->lock);
    
    while (ch->count == 0 && !ch->is_closed) {
    1504:	8b 43 08             	mov    0x8(%ebx),%eax
    1507:	85 c0                	test   %eax,%eax
    1509:	74 1e                	je     1529 <channel_recv+0x59>
    150b:	e9 8b 00 00 00       	jmp    159b <channel_recv+0xcb>
        printf(2, "[uthreads] Error: cond_wait called without holding mutex\n");
    1510:	83 ec 08             	sub    $0x8,%esp
    1513:	68 f4 1b 00 00       	push   $0x1bf4
    1518:	6a 02                	push   $0x2
    151a:	e8 91 f3 ff ff       	call   8b0 <printf>
    while (ch->count == 0 && !ch->is_closed) {
    151f:	8b 53 08             	mov    0x8(%ebx),%edx
        return;
    1522:	83 c4 10             	add    $0x10,%esp
    while (ch->count == 0 && !ch->is_closed) {
    1525:	85 d2                	test   %edx,%edx
    1527:	75 72                	jne    159b <channel_recv+0xcb>
    1529:	8b 43 14             	mov    0x14(%ebx),%eax
    if (m->owner != thread_self()) {
    152c:	8b 73 1c             	mov    0x1c(%ebx),%esi
    while (ch->count == 0 && !ch->is_closed) {
    152f:	85 c0                	test   %eax,%eax
    1531:	0f 85 d9 00 00 00    	jne    1610 <channel_recv+0x140>
    if (m->owner != thread_self()) {
    1537:	e8 24 f8 ff ff       	call   d60 <thread_self>
    153c:	39 c6                	cmp    %eax,%esi
    153e:	75 d0                	jne    1510 <channel_recv+0x40>
    thread_wakeup(m->wait_chan);
    1540:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1543:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    154a:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1551:	ff 73 20             	push   0x20(%ebx)
    1554:	e8 97 fa ff ff       	call   ff0 <thread_wakeup>
    thread_sleep(c->wait_chan);
    1559:	5e                   	pop    %esi
    155a:	ff 73 24             	push   0x24(%ebx)
    155d:	e8 6e fa ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    1562:	8b 43 18             	mov    0x18(%ebx),%eax
    1565:	83 c4 10             	add    $0x10,%esp
    1568:	85 c0                	test   %eax,%eax
    156a:	74 19                	je     1585 <channel_recv+0xb5>
    156c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    1570:	83 ec 0c             	sub    $0xc,%esp
    1573:	ff 73 20             	push   0x20(%ebx)
    1576:	e8 55 fa ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    157b:	8b 4b 18             	mov    0x18(%ebx),%ecx
    157e:	83 c4 10             	add    $0x10,%esp
    1581:	85 c9                	test   %ecx,%ecx
    1583:	75 eb                	jne    1570 <channel_recv+0xa0>
    m->locked = 1;
    1585:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    158c:	e8 cf f7 ff ff       	call   d60 <thread_self>
    while (ch->count == 0 && !ch->is_closed) {
    1591:	8b 53 08             	mov    0x8(%ebx),%edx
    m->owner = thread_self();
    1594:	89 43 1c             	mov    %eax,0x1c(%ebx)
    while (ch->count == 0 && !ch->is_closed) {
    1597:	85 d2                	test   %edx,%edx
    1599:	74 8e                	je     1529 <channel_recv+0x59>
    if (ch->is_closed && ch->count == 0) {
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    *data = ch->buffer[ch->read_idx];
    159b:	8b 53 0c             	mov    0xc(%ebx),%edx
    159e:	8b 03                	mov    (%ebx),%eax
    thread_wakeup(c->wait_chan);
    15a0:	83 ec 0c             	sub    $0xc,%esp
    *data = ch->buffer[ch->read_idx];
    15a3:	8b 14 90             	mov    (%eax,%edx,4),%edx
    15a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    15a9:	89 10                	mov    %edx,(%eax)
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    15ab:	8b 43 0c             	mov    0xc(%ebx),%eax
    ch->count--;
    15ae:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    15b2:	83 c0 01             	add    $0x1,%eax
    15b5:	99                   	cltd
    15b6:	f7 7b 04             	idivl  0x4(%ebx)
    15b9:	89 53 0c             	mov    %edx,0xc(%ebx)
    thread_wakeup(c->wait_chan);
    15bc:	ff 73 28             	push   0x28(%ebx)
    15bf:	e8 2c fa ff ff       	call   ff0 <thread_wakeup>
    if (m->owner != thread_self()) {
    15c4:	8b 73 1c             	mov    0x1c(%ebx),%esi
    15c7:	e8 94 f7 ff ff       	call   d60 <thread_self>
    15cc:	83 c4 10             	add    $0x10,%esp
    15cf:	39 c6                	cmp    %eax,%esi
    15d1:	74 1d                	je     15f0 <channel_recv+0x120>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    15d3:	83 ec 08             	sub    $0x8,%esp
    15d6:	68 ac 1b 00 00       	push   $0x1bac
    15db:	6a 02                	push   $0x2
    15dd:	e8 ce f2 ff ff       	call   8b0 <printf>
        return;
    15e2:	83 c4 10             	add    $0x10,%esp
    
    cond_signal(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    return 0;
    15e5:	31 c0                	xor    %eax,%eax
}
    15e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    15ea:	5b                   	pop    %ebx
    15eb:	5e                   	pop    %esi
    15ec:	5d                   	pop    %ebp
    15ed:	c3                   	ret
    15ee:	66 90                	xchg   %ax,%ax
    thread_wakeup(m->wait_chan);
    15f0:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    15f3:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    15fa:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1601:	ff 73 20             	push   0x20(%ebx)
    1604:	e8 e7 f9 ff ff       	call   ff0 <thread_wakeup>
    1609:	83 c4 10             	add    $0x10,%esp
    160c:	eb d7                	jmp    15e5 <channel_recv+0x115>
    160e:	66 90                	xchg   %ax,%ax
    if (m->owner != thread_self()) {
    1610:	e8 4b f7 ff ff       	call   d60 <thread_self>
    1615:	39 c6                	cmp    %eax,%esi
    1617:	74 19                	je     1632 <channel_recv+0x162>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    1619:	83 ec 08             	sub    $0x8,%esp
    161c:	68 ac 1b 00 00       	push   $0x1bac
    1621:	6a 02                	push   $0x2
    1623:	e8 88 f2 ff ff       	call   8b0 <printf>
        return;
    1628:	83 c4 10             	add    $0x10,%esp
        return -1;
    162b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1630:	eb b5                	jmp    15e7 <channel_recv+0x117>
    thread_wakeup(m->wait_chan);
    1632:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1635:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    163c:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1643:	ff 73 20             	push   0x20(%ebx)
    1646:	e8 a5 f9 ff ff       	call   ff0 <thread_wakeup>
    164b:	83 c4 10             	add    $0x10,%esp
    164e:	eb db                	jmp    162b <channel_recv+0x15b>

00001650 <channel_close>:

void channel_close(channel_t *ch) {
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	56                   	push   %esi
    1654:	53                   	push   %ebx
    1655:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    1658:	8b 4b 18             	mov    0x18(%ebx),%ecx
    165b:	85 c9                	test   %ecx,%ecx
    165d:	74 16                	je     1675 <channel_close+0x25>
    165f:	90                   	nop
        thread_sleep(m->wait_chan);
    1660:	83 ec 0c             	sub    $0xc,%esp
    1663:	ff 73 20             	push   0x20(%ebx)
    1666:	e8 65 f9 ff ff       	call   fd0 <thread_sleep>
    while (m->locked) {
    166b:	8b 53 18             	mov    0x18(%ebx),%edx
    166e:	83 c4 10             	add    $0x10,%esp
    1671:	85 d2                	test   %edx,%edx
    1673:	75 eb                	jne    1660 <channel_close+0x10>
    m->locked = 1;
    1675:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    167c:	e8 df f6 ff ff       	call   d60 <thread_self>
    thread_wakeup(c->wait_chan);
    1681:	83 ec 0c             	sub    $0xc,%esp
    mutex_lock(&ch->lock);
    
    ch->is_closed = 1;
    1684:	c7 43 14 01 00 00 00 	movl   $0x1,0x14(%ebx)
    m->owner = thread_self();
    168b:	89 43 1c             	mov    %eax,0x1c(%ebx)
    thread_wakeup(c->wait_chan);
    168e:	ff 73 24             	push   0x24(%ebx)
    1691:	e8 5a f9 ff ff       	call   ff0 <thread_wakeup>
    1696:	58                   	pop    %eax
    1697:	ff 73 28             	push   0x28(%ebx)
    169a:	e8 51 f9 ff ff       	call   ff0 <thread_wakeup>
    if (m->owner != thread_self()) {
    169f:	8b 73 1c             	mov    0x1c(%ebx),%esi
    16a2:	e8 b9 f6 ff ff       	call   d60 <thread_self>
    16a7:	83 c4 10             	add    $0x10,%esp
    16aa:	39 c6                	cmp    %eax,%esi
    16ac:	74 32                	je     16e0 <channel_close+0x90>
        printf(2, "[uthreads] Error: Trying to unlock mutex not owned by current thread\n");
    16ae:	83 ec 08             	sub    $0x8,%esp
    16b1:	68 ac 1b 00 00       	push   $0x1bac
    16b6:	6a 02                	push   $0x2
    16b8:	e8 f3 f1 ff ff       	call   8b0 <printf>
        return;
    16bd:	83 c4 10             	add    $0x10,%esp
    cond_broadcast(&ch->not_empty);
    cond_broadcast(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    
    printf(1, "[uthreads] Channel closed\n");
    16c0:	83 ec 08             	sub    $0x8,%esp
    16c3:	68 fa 17 00 00       	push   $0x17fa
    16c8:	6a 01                	push   $0x1
    16ca:	e8 e1 f1 ff ff       	call   8b0 <printf>
}
    16cf:	83 c4 10             	add    $0x10,%esp
    16d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    16d5:	5b                   	pop    %ebx
    16d6:	5e                   	pop    %esi
    16d7:	5d                   	pop    %ebp
    16d8:	c3                   	ret
    16d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    thread_wakeup(m->wait_chan);
    16e0:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    16e3:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    16ea:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    16f1:	ff 73 20             	push   0x20(%ebx)
    16f4:	e8 f7 f8 ff ff       	call   ff0 <thread_wakeup>
    16f9:	83 c4 10             	add    $0x10,%esp
    16fc:	eb c2                	jmp    16c0 <channel_close+0x70>
    16fe:	66 90                	xchg   %ax,%ax

00001700 <channel_destroy>:

void channel_destroy(channel_t *ch) {
    1700:	55                   	push   %ebp
    1701:	89 e5                	mov    %esp,%ebp
    1703:	53                   	push   %ebx
    1704:	83 ec 04             	sub    $0x4,%esp
    1707:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (!ch)
    170a:	85 db                	test   %ebx,%ebx
    170c:	74 22                	je     1730 <channel_destroy+0x30>
        return;
    
    if (ch->buffer) {
    170e:	8b 03                	mov    (%ebx),%eax
    1710:	85 c0                	test   %eax,%eax
    1712:	74 0c                	je     1720 <channel_destroy+0x20>
        free(ch->buffer);
    1714:	83 ec 0c             	sub    $0xc,%esp
    1717:	50                   	push   %eax
    1718:	e8 23 f3 ff ff       	call   a40 <free>
    171d:	83 c4 10             	add    $0x10,%esp
    }
    free(ch);
    1720:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    1723:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1726:	c9                   	leave
    free(ch);
    1727:	e9 14 f3 ff ff       	jmp    a40 <free>
    172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
    1730:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1733:	c9                   	leave
    1734:	c3                   	ret

00001735 <thread_switch>:
.text
.globl thread_switch
thread_switch:
    movl 4(%esp), %eax
    1735:	8b 44 24 04          	mov    0x4(%esp),%eax
    movl 8(%esp), %edx
    1739:	8b 54 24 08          	mov    0x8(%esp),%edx
    
    movl %ebx, 4(%eax)
    173d:	89 58 04             	mov    %ebx,0x4(%eax)
    movl %ecx, 8(%eax)
    1740:	89 48 08             	mov    %ecx,0x8(%eax)
    movl %esi, 16(%eax)
    1743:	89 70 10             	mov    %esi,0x10(%eax)
    movl %edi, 20(%eax)
    1746:	89 78 14             	mov    %edi,0x14(%eax)
    movl %ebp, 24(%eax)
    1749:	89 68 18             	mov    %ebp,0x18(%eax)
    movl %esp, 28(%eax)
    174c:	89 60 1c             	mov    %esp,0x1c(%eax)
    
    movl (%esp), %ecx
    174f:	8b 0c 24             	mov    (%esp),%ecx
    movl %ecx, 32(%eax)
    1752:	89 48 20             	mov    %ecx,0x20(%eax)
    
    movl 4(%edx), %ebx
    1755:	8b 5a 04             	mov    0x4(%edx),%ebx
    movl 8(%edx), %ecx
    1758:	8b 4a 08             	mov    0x8(%edx),%ecx
    movl 16(%edx), %esi
    175b:	8b 72 10             	mov    0x10(%edx),%esi
    movl 20(%edx), %edi
    175e:	8b 7a 14             	mov    0x14(%edx),%edi
    movl 24(%edx), %ebp
    1761:	8b 6a 18             	mov    0x18(%edx),%ebp
    movl 28(%edx), %esp
    1764:	8b 62 1c             	mov    0x1c(%edx),%esp
    
    movl 32(%edx), %eax
    1767:	8b 42 20             	mov    0x20(%edx),%eax
    movl %eax, (%esp)
    176a:	89 04 24             	mov    %eax,(%esp)
    
    ret
    176d:	c3                   	ret
