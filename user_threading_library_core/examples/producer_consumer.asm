
_producer_consumer:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    
    printf(1, "[消费者%d] 共消费了 %d 个item\n", id, consumed_count);
    return 0;
}

int main(int argc, char *argv[]) {
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	56                   	push   %esi
       e:	53                   	push   %ebx
       f:	51                   	push   %ecx
      10:	83 ec 24             	sub    $0x24,%esp
    int producer_tids[NUM_PRODUCERS];
    int consumer_tids[NUM_CONSUMERS];
    int i;
    
    printf(1, "========================================\n");
      13:	68 78 16 00 00       	push   $0x1678
      18:	6a 01                	push   $0x1
      1a:	e8 11 06 00 00       	call   630 <printf>
    printf(1, "      生产者-消费者示例\n");
      1f:	58                   	pop    %eax
      20:	5a                   	pop    %edx
      21:	68 a4 16 00 00       	push   $0x16a4
      26:	6a 01                	push   $0x1
      28:	e8 03 06 00 00       	call   630 <printf>
    printf(1, "========================================\n\n");
      2d:	59                   	pop    %ecx
      2e:	5b                   	pop    %ebx
      2f:	68 c8 16 00 00       	push   $0x16c8
      34:	6a 01                	push   $0x1
      36:	31 db                	xor    %ebx,%ebx
      38:	e8 f3 05 00 00       	call   630 <printf>
    
    thread_init();
      3d:	e8 fe 08 00 00       	call   940 <thread_init>
    
    channel = channel_create(CHANNEL_CAPACITY);
      42:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
      49:	e8 42 0f 00 00       	call   f90 <channel_create>
    if (!channel) {
      4e:	83 c4 10             	add    $0x10,%esp
    channel = channel_create(CHANNEL_CAPACITY);
      51:	a3 80 21 00 00       	mov    %eax,0x2180
    if (!channel) {
      56:	85 c0                	test   %eax,%eax
      58:	0f 84 cc 00 00 00    	je     12a <main+0x12a>
        exit();
    }
    
    // 创建生产者
    for (i = 0; i < NUM_PRODUCERS; i++) {
        producer_tids[i] = thread_create(producer, (void*)i);
      5e:	83 ec 08             	sub    $0x8,%esp
      61:	53                   	push   %ebx
      62:	68 40 01 00 00       	push   $0x140
      67:	e8 64 09 00 00       	call   9d0 <thread_create>
    for (i = 0; i < NUM_PRODUCERS; i++) {
      6c:	83 c4 10             	add    $0x10,%esp
        producer_tids[i] = thread_create(producer, (void*)i);
      6f:	89 44 9d dc          	mov    %eax,-0x24(%ebp,%ebx,4)
    for (i = 0; i < NUM_PRODUCERS; i++) {
      73:	83 c3 01             	add    $0x1,%ebx
      76:	83 fb 03             	cmp    $0x3,%ebx
      79:	75 e3                	jne    5e <main+0x5e>
    }
    
    // 创建消费者
    for (i = 0; i < NUM_CONSUMERS; i++) {
        consumer_tids[i] = thread_create(consumer, (void*)i);
      7b:	83 ec 08             	sub    $0x8,%esp
      7e:	6a 00                	push   $0x0
      80:	68 e0 01 00 00       	push   $0x1e0
      85:	e8 46 09 00 00       	call   9d0 <thread_create>
      8a:	89 c6                	mov    %eax,%esi
      8c:	58                   	pop    %eax
      8d:	5a                   	pop    %edx
      8e:	6a 01                	push   $0x1
      90:	68 e0 01 00 00       	push   $0x1e0
      95:	e8 36 09 00 00       	call   9d0 <thread_create>
    }
    
    printf(1, "所有线程已创建，开始执行...\n\n");
      9a:	59                   	pop    %ecx
        consumer_tids[i] = thread_create(consumer, (void*)i);
      9b:	89 c3                	mov    %eax,%ebx
    printf(1, "所有线程已创建，开始执行...\n\n");
      9d:	58                   	pop    %eax
      9e:	68 f4 16 00 00       	push   $0x16f4
      a3:	6a 01                	push   $0x1
      a5:	e8 86 05 00 00       	call   630 <printf>
    
    // 等待所有生产者完成
    for (i = 0; i < NUM_PRODUCERS; i++) {
        thread_join(producer_tids[i]);
      aa:	58                   	pop    %eax
      ab:	ff 75 dc             	push   -0x24(%ebp)
      ae:	e8 9d 0b 00 00       	call   c50 <thread_join>
      b3:	58                   	pop    %eax
      b4:	ff 75 e0             	push   -0x20(%ebp)
      b7:	e8 94 0b 00 00       	call   c50 <thread_join>
      bc:	58                   	pop    %eax
      bd:	ff 75 e4             	push   -0x1c(%ebp)
      c0:	e8 8b 0b 00 00       	call   c50 <thread_join>
    }
    
    printf(1, "\n所有生产者已完成，关闭 channel...\n\n");
      c5:	58                   	pop    %eax
      c6:	5a                   	pop    %edx
      c7:	68 20 17 00 00       	push   $0x1720
      cc:	6a 01                	push   $0x1
      ce:	e8 5d 05 00 00       	call   630 <printf>
    channel_close(channel);
      d3:	59                   	pop    %ecx
      d4:	ff 35 80 21 00 00    	push   0x2180
      da:	e8 f1 12 00 00       	call   13d0 <channel_close>
    
    // 等待所有消费者完成
    for (i = 0; i < NUM_CONSUMERS; i++) {
        thread_join(consumer_tids[i]);
      df:	89 34 24             	mov    %esi,(%esp)
      e2:	e8 69 0b 00 00       	call   c50 <thread_join>
      e7:	89 1c 24             	mov    %ebx,(%esp)
      ea:	e8 61 0b 00 00       	call   c50 <thread_join>
    }
    
    printf(1, "\n========================================\n");
      ef:	5b                   	pop    %ebx
      f0:	5e                   	pop    %esi
      f1:	68 50 17 00 00       	push   $0x1750
      f6:	6a 01                	push   $0x1
      f8:	e8 33 05 00 00       	call   630 <printf>
    printf(1, "所有线程已完成！\n");
      fd:	58                   	pop    %eax
      fe:	5a                   	pop    %edx
      ff:	68 6d 15 00 00       	push   $0x156d
     104:	6a 01                	push   $0x1
     106:	e8 25 05 00 00       	call   630 <printf>
    printf(1, "========================================\n");
     10b:	59                   	pop    %ecx
     10c:	5b                   	pop    %ebx
     10d:	68 78 16 00 00       	push   $0x1678
     112:	6a 01                	push   $0x1
     114:	e8 17 05 00 00       	call   630 <printf>
    
    channel_destroy(channel);
     119:	5e                   	pop    %esi
     11a:	ff 35 80 21 00 00    	push   0x2180
     120:	e8 5b 13 00 00       	call   1480 <channel_destroy>
    
    exit();
     125:	e8 99 03 00 00       	call   4c3 <exit>
        printf(2, "创建 channel 失败\n");
     12a:	50                   	push   %eax
     12b:	50                   	push   %eax
     12c:	68 56 15 00 00       	push   $0x1556
     131:	6a 02                	push   $0x2
     133:	e8 f8 04 00 00       	call   630 <printf>
        exit();
     138:	e8 86 03 00 00       	call   4c3 <exit>
     13d:	66 90                	xchg   %ax,%ax
     13f:	90                   	nop

00000140 <producer>:
void *producer(void *arg) {
     140:	55                   	push   %ebp
     141:	89 e5                	mov    %esp,%ebp
     143:	57                   	push   %edi
     144:	56                   	push   %esi
    for (i = 0; i < ITEMS_PER_PRODUCER; i++) {
     145:	31 f6                	xor    %esi,%esi
void *producer(void *arg) {
     147:	53                   	push   %ebx
     148:	83 ec 10             	sub    $0x10,%esp
     14b:	8b 7d 08             	mov    0x8(%ebp),%edi
    printf(1, "[生产者%d] 启动\n", id);
     14e:	57                   	push   %edi
     14f:	68 f0 14 00 00       	push   $0x14f0
     154:	6a 01                	push   $0x1
     156:	e8 d5 04 00 00       	call   630 <printf>
     15b:	83 c4 10             	add    $0x10,%esp
     15e:	66 90                	xchg   %ax,%ax
        item = (Item*)malloc(sizeof(Item));
     160:	83 ec 0c             	sub    $0xc,%esp
     163:	6a 08                	push   $0x8
     165:	e8 e6 06 00 00       	call   850 <malloc>
        item->producer_id = id;
     16a:	89 38                	mov    %edi,(%eax)
        item = (Item*)malloc(sizeof(Item));
     16c:	89 c3                	mov    %eax,%ebx
        item->item_number = i;
     16e:	89 70 04             	mov    %esi,0x4(%eax)
        printf(1, "[生产者%d] 生产 item-%d\n", id, i);
     171:	56                   	push   %esi
     172:	57                   	push   %edi
     173:	68 06 15 00 00       	push   $0x1506
     178:	6a 01                	push   $0x1
     17a:	e8 b1 04 00 00       	call   630 <printf>
        if (channel_send(channel, item) < 0) {
     17f:	83 c4 18             	add    $0x18,%esp
     182:	53                   	push   %ebx
     183:	ff 35 80 21 00 00    	push   0x2180
     189:	e8 02 0f 00 00       	call   1090 <channel_send>
     18e:	83 c4 10             	add    $0x10,%esp
     191:	85 c0                	test   %eax,%eax
     193:	78 2b                	js     1c0 <producer+0x80>
        thread_yield();
     195:	e8 96 0b 00 00       	call   d30 <thread_yield>
    for (i = 0; i < ITEMS_PER_PRODUCER; i++) {
     19a:	83 c6 01             	add    $0x1,%esi
     19d:	83 fe 0a             	cmp    $0xa,%esi
     1a0:	75 be                	jne    160 <producer+0x20>
    printf(1, "[生产者%d] 完成生产\n", id);
     1a2:	83 ec 04             	sub    $0x4,%esp
     1a5:	57                   	push   %edi
     1a6:	68 24 15 00 00       	push   $0x1524
     1ab:	6a 01                	push   $0x1
     1ad:	e8 7e 04 00 00       	call   630 <printf>
}
     1b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1b5:	31 c0                	xor    %eax,%eax
     1b7:	5b                   	pop    %ebx
     1b8:	5e                   	pop    %esi
     1b9:	5f                   	pop    %edi
     1ba:	5d                   	pop    %ebp
     1bb:	c3                   	ret
     1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, "[生产者%d] 发送失败（channel已关闭）\n", id);
     1c0:	83 ec 04             	sub    $0x4,%esp
     1c3:	57                   	push   %edi
     1c4:	68 ac 15 00 00       	push   $0x15ac
     1c9:	6a 01                	push   $0x1
     1cb:	e8 60 04 00 00       	call   630 <printf>
            free(item);
     1d0:	89 1c 24             	mov    %ebx,(%esp)
     1d3:	e8 e8 05 00 00       	call   7c0 <free>
            break;
     1d8:	83 c4 10             	add    $0x10,%esp
     1db:	eb c5                	jmp    1a2 <producer+0x62>
     1dd:	8d 76 00             	lea    0x0(%esi),%esi

000001e0 <consumer>:
void *consumer(void *arg) {
     1e0:	55                   	push   %ebp
     1e1:	89 e5                	mov    %esp,%ebp
     1e3:	57                   	push   %edi
     1e4:	56                   	push   %esi
     1e5:	8d 7d e4             	lea    -0x1c(%ebp),%edi
     1e8:	53                   	push   %ebx
    int consumed_count = 0;
     1e9:	31 db                	xor    %ebx,%ebx
void *consumer(void *arg) {
     1eb:	83 ec 20             	sub    $0x20,%esp
    printf(1, "[消费者%d] 启动\n", id);
     1ee:	ff 75 08             	push   0x8(%ebp)
     1f1:	68 40 15 00 00       	push   $0x1540
     1f6:	6a 01                	push   $0x1
     1f8:	e8 33 04 00 00       	call   630 <printf>
     1fd:	83 c4 10             	add    $0x10,%esp
     200:	eb 34                	jmp    236 <consumer+0x56>
     202:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        item = (Item*)data;
     208:	8b 75 e4             	mov    -0x1c(%ebp),%esi
        printf(1, "[消费者%d] 消费 item：来自生产者%d的第%d个\n", 
     20b:	83 ec 0c             	sub    $0xc,%esp
        consumed_count++;
     20e:	83 c3 01             	add    $0x1,%ebx
        printf(1, "[消费者%d] 消费 item：来自生产者%d的第%d个\n", 
     211:	ff 76 04             	push   0x4(%esi)
     214:	ff 36                	push   (%esi)
     216:	ff 75 08             	push   0x8(%ebp)
     219:	68 3c 16 00 00       	push   $0x163c
     21e:	6a 01                	push   $0x1
     220:	e8 0b 04 00 00       	call   630 <printf>
        free(item);
     225:	83 c4 14             	add    $0x14,%esp
     228:	56                   	push   %esi
     229:	e8 92 05 00 00       	call   7c0 <free>
        thread_yield();
     22e:	e8 fd 0a 00 00       	call   d30 <thread_yield>
        if (channel_recv(channel, &data) < 0) {
     233:	83 c4 10             	add    $0x10,%esp
     236:	83 ec 08             	sub    $0x8,%esp
     239:	57                   	push   %edi
     23a:	ff 35 80 21 00 00    	push   0x2180
     240:	e8 0b 10 00 00       	call   1250 <channel_recv>
     245:	83 c4 10             	add    $0x10,%esp
     248:	85 c0                	test   %eax,%eax
     24a:	79 bc                	jns    208 <consumer+0x28>
            printf(1, "[消费者%d] channel已关闭且为空，退出\n", id);
     24c:	83 ec 04             	sub    $0x4,%esp
     24f:	ff 75 08             	push   0x8(%ebp)
     252:	68 e0 15 00 00       	push   $0x15e0
     257:	6a 01                	push   $0x1
     259:	e8 d2 03 00 00       	call   630 <printf>
    printf(1, "[消费者%d] 共消费了 %d 个item\n", id, consumed_count);
     25e:	53                   	push   %ebx
     25f:	ff 75 08             	push   0x8(%ebp)
     262:	68 14 16 00 00       	push   $0x1614
     267:	6a 01                	push   $0x1
     269:	e8 c2 03 00 00       	call   630 <printf>
}
     26e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     271:	31 c0                	xor    %eax,%eax
     273:	5b                   	pop    %ebx
     274:	5e                   	pop    %esi
     275:	5f                   	pop    %edi
     276:	5d                   	pop    %ebp
     277:	c3                   	ret
     278:	66 90                	xchg   %ax,%ax
     27a:	66 90                	xchg   %ax,%ax
     27c:	66 90                	xchg   %ax,%ax
     27e:	66 90                	xchg   %ax,%ax

00000280 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     280:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     281:	31 c0                	xor    %eax,%eax
{
     283:	89 e5                	mov    %esp,%ebp
     285:	53                   	push   %ebx
     286:	8b 4d 08             	mov    0x8(%ebp),%ecx
     289:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     290:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     294:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     297:	83 c0 01             	add    $0x1,%eax
     29a:	84 d2                	test   %dl,%dl
     29c:	75 f2                	jne    290 <strcpy+0x10>
    ;
  return os;
}
     29e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2a1:	89 c8                	mov    %ecx,%eax
     2a3:	c9                   	leave
     2a4:	c3                   	ret
     2a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     2ac:	00 
     2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     2b0:	55                   	push   %ebp
     2b1:	89 e5                	mov    %esp,%ebp
     2b3:	53                   	push   %ebx
     2b4:	8b 55 08             	mov    0x8(%ebp),%edx
     2b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     2ba:	0f b6 02             	movzbl (%edx),%eax
     2bd:	84 c0                	test   %al,%al
     2bf:	75 17                	jne    2d8 <strcmp+0x28>
     2c1:	eb 3a                	jmp    2fd <strcmp+0x4d>
     2c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     2c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     2cc:	83 c2 01             	add    $0x1,%edx
     2cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     2d2:	84 c0                	test   %al,%al
     2d4:	74 1a                	je     2f0 <strcmp+0x40>
     2d6:	89 d9                	mov    %ebx,%ecx
     2d8:	0f b6 19             	movzbl (%ecx),%ebx
     2db:	38 c3                	cmp    %al,%bl
     2dd:	74 e9                	je     2c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     2df:	29 d8                	sub    %ebx,%eax
}
     2e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2e4:	c9                   	leave
     2e5:	c3                   	ret
     2e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     2ed:	00 
     2ee:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
     2f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     2f4:	31 c0                	xor    %eax,%eax
     2f6:	29 d8                	sub    %ebx,%eax
}
     2f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2fb:	c9                   	leave
     2fc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     2fd:	0f b6 19             	movzbl (%ecx),%ebx
     300:	31 c0                	xor    %eax,%eax
     302:	eb db                	jmp    2df <strcmp+0x2f>
     304:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     30b:	00 
     30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <strlen>:

uint
strlen(const char *s)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     316:	80 3a 00             	cmpb   $0x0,(%edx)
     319:	74 15                	je     330 <strlen+0x20>
     31b:	31 c0                	xor    %eax,%eax
     31d:	8d 76 00             	lea    0x0(%esi),%esi
     320:	83 c0 01             	add    $0x1,%eax
     323:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     327:	89 c1                	mov    %eax,%ecx
     329:	75 f5                	jne    320 <strlen+0x10>
    ;
  return n;
}
     32b:	89 c8                	mov    %ecx,%eax
     32d:	5d                   	pop    %ebp
     32e:	c3                   	ret
     32f:	90                   	nop
  for(n = 0; s[n]; n++)
     330:	31 c9                	xor    %ecx,%ecx
}
     332:	5d                   	pop    %ebp
     333:	89 c8                	mov    %ecx,%eax
     335:	c3                   	ret
     336:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     33d:	00 
     33e:	66 90                	xchg   %ax,%ax

00000340 <memset>:

void*
memset(void *dst, int c, uint n)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	57                   	push   %edi
     344:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     347:	8b 4d 10             	mov    0x10(%ebp),%ecx
     34a:	8b 45 0c             	mov    0xc(%ebp),%eax
     34d:	89 d7                	mov    %edx,%edi
     34f:	fc                   	cld
     350:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     352:	8b 7d fc             	mov    -0x4(%ebp),%edi
     355:	89 d0                	mov    %edx,%eax
     357:	c9                   	leave
     358:	c3                   	ret
     359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	8b 45 08             	mov    0x8(%ebp),%eax
     366:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     36a:	0f b6 10             	movzbl (%eax),%edx
     36d:	84 d2                	test   %dl,%dl
     36f:	75 12                	jne    383 <strchr+0x23>
     371:	eb 1d                	jmp    390 <strchr+0x30>
     373:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     378:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     37c:	83 c0 01             	add    $0x1,%eax
     37f:	84 d2                	test   %dl,%dl
     381:	74 0d                	je     390 <strchr+0x30>
    if(*s == c)
     383:	38 d1                	cmp    %dl,%cl
     385:	75 f1                	jne    378 <strchr+0x18>
      return (char*)s;
  return 0;
}
     387:	5d                   	pop    %ebp
     388:	c3                   	ret
     389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     390:	31 c0                	xor    %eax,%eax
}
     392:	5d                   	pop    %ebp
     393:	c3                   	ret
     394:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     39b:	00 
     39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <gets>:

char*
gets(char *buf, int max)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	57                   	push   %edi
     3a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     3a5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     3a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     3a9:	31 db                	xor    %ebx,%ebx
{
     3ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     3ae:	eb 27                	jmp    3d7 <gets+0x37>
    cc = read(0, &c, 1);
     3b0:	83 ec 04             	sub    $0x4,%esp
     3b3:	6a 01                	push   $0x1
     3b5:	56                   	push   %esi
     3b6:	6a 00                	push   $0x0
     3b8:	e8 1e 01 00 00       	call   4db <read>
    if(cc < 1)
     3bd:	83 c4 10             	add    $0x10,%esp
     3c0:	85 c0                	test   %eax,%eax
     3c2:	7e 1d                	jle    3e1 <gets+0x41>
      break;
    buf[i++] = c;
     3c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     3c8:	8b 55 08             	mov    0x8(%ebp),%edx
     3cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     3cf:	3c 0a                	cmp    $0xa,%al
     3d1:	74 10                	je     3e3 <gets+0x43>
     3d3:	3c 0d                	cmp    $0xd,%al
     3d5:	74 0c                	je     3e3 <gets+0x43>
  for(i=0; i+1 < max; ){
     3d7:	89 df                	mov    %ebx,%edi
     3d9:	83 c3 01             	add    $0x1,%ebx
     3dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     3df:	7c cf                	jl     3b0 <gets+0x10>
     3e1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     3e3:	8b 45 08             	mov    0x8(%ebp),%eax
     3e6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     3ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3ed:	5b                   	pop    %ebx
     3ee:	5e                   	pop    %esi
     3ef:	5f                   	pop    %edi
     3f0:	5d                   	pop    %ebp
     3f1:	c3                   	ret
     3f2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3f9:	00 
     3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000400 <stat>:

int
stat(const char *n, struct stat *st)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	56                   	push   %esi
     404:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     405:	83 ec 08             	sub    $0x8,%esp
     408:	6a 00                	push   $0x0
     40a:	ff 75 08             	push   0x8(%ebp)
     40d:	e8 f1 00 00 00       	call   503 <open>
  if(fd < 0)
     412:	83 c4 10             	add    $0x10,%esp
     415:	85 c0                	test   %eax,%eax
     417:	78 27                	js     440 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     419:	83 ec 08             	sub    $0x8,%esp
     41c:	ff 75 0c             	push   0xc(%ebp)
     41f:	89 c3                	mov    %eax,%ebx
     421:	50                   	push   %eax
     422:	e8 f4 00 00 00       	call   51b <fstat>
  close(fd);
     427:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     42a:	89 c6                	mov    %eax,%esi
  close(fd);
     42c:	e8 ba 00 00 00       	call   4eb <close>
  return r;
     431:	83 c4 10             	add    $0x10,%esp
}
     434:	8d 65 f8             	lea    -0x8(%ebp),%esp
     437:	89 f0                	mov    %esi,%eax
     439:	5b                   	pop    %ebx
     43a:	5e                   	pop    %esi
     43b:	5d                   	pop    %ebp
     43c:	c3                   	ret
     43d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     440:	be ff ff ff ff       	mov    $0xffffffff,%esi
     445:	eb ed                	jmp    434 <stat+0x34>
     447:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     44e:	00 
     44f:	90                   	nop

00000450 <atoi>:

int
atoi(const char *s)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	53                   	push   %ebx
     454:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     457:	0f be 02             	movsbl (%edx),%eax
     45a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     45d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     460:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     465:	77 1e                	ja     485 <atoi+0x35>
     467:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     46e:	00 
     46f:	90                   	nop
    n = n*10 + *s++ - '0';
     470:	83 c2 01             	add    $0x1,%edx
     473:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     476:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     47a:	0f be 02             	movsbl (%edx),%eax
     47d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     480:	80 fb 09             	cmp    $0x9,%bl
     483:	76 eb                	jbe    470 <atoi+0x20>
  return n;
}
     485:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     488:	89 c8                	mov    %ecx,%eax
     48a:	c9                   	leave
     48b:	c3                   	ret
     48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000490 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	57                   	push   %edi
     494:	8b 45 10             	mov    0x10(%ebp),%eax
     497:	8b 55 08             	mov    0x8(%ebp),%edx
     49a:	56                   	push   %esi
     49b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     49e:	85 c0                	test   %eax,%eax
     4a0:	7e 13                	jle    4b5 <memmove+0x25>
     4a2:	01 d0                	add    %edx,%eax
  dst = vdst;
     4a4:	89 d7                	mov    %edx,%edi
     4a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     4ad:	00 
     4ae:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
     4b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     4b1:	39 f8                	cmp    %edi,%eax
     4b3:	75 fb                	jne    4b0 <memmove+0x20>
  return vdst;
}
     4b5:	5e                   	pop    %esi
     4b6:	89 d0                	mov    %edx,%eax
     4b8:	5f                   	pop    %edi
     4b9:	5d                   	pop    %ebp
     4ba:	c3                   	ret

000004bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     4bb:	b8 01 00 00 00       	mov    $0x1,%eax
     4c0:	cd 40                	int    $0x40
     4c2:	c3                   	ret

000004c3 <exit>:
SYSCALL(exit)
     4c3:	b8 02 00 00 00       	mov    $0x2,%eax
     4c8:	cd 40                	int    $0x40
     4ca:	c3                   	ret

000004cb <wait>:
SYSCALL(wait)
     4cb:	b8 03 00 00 00       	mov    $0x3,%eax
     4d0:	cd 40                	int    $0x40
     4d2:	c3                   	ret

000004d3 <pipe>:
SYSCALL(pipe)
     4d3:	b8 04 00 00 00       	mov    $0x4,%eax
     4d8:	cd 40                	int    $0x40
     4da:	c3                   	ret

000004db <read>:
SYSCALL(read)
     4db:	b8 05 00 00 00       	mov    $0x5,%eax
     4e0:	cd 40                	int    $0x40
     4e2:	c3                   	ret

000004e3 <write>:
SYSCALL(write)
     4e3:	b8 10 00 00 00       	mov    $0x10,%eax
     4e8:	cd 40                	int    $0x40
     4ea:	c3                   	ret

000004eb <close>:
SYSCALL(close)
     4eb:	b8 15 00 00 00       	mov    $0x15,%eax
     4f0:	cd 40                	int    $0x40
     4f2:	c3                   	ret

000004f3 <kill>:
SYSCALL(kill)
     4f3:	b8 06 00 00 00       	mov    $0x6,%eax
     4f8:	cd 40                	int    $0x40
     4fa:	c3                   	ret

000004fb <exec>:
SYSCALL(exec)
     4fb:	b8 07 00 00 00       	mov    $0x7,%eax
     500:	cd 40                	int    $0x40
     502:	c3                   	ret

00000503 <open>:
SYSCALL(open)
     503:	b8 0f 00 00 00       	mov    $0xf,%eax
     508:	cd 40                	int    $0x40
     50a:	c3                   	ret

0000050b <mknod>:
SYSCALL(mknod)
     50b:	b8 11 00 00 00       	mov    $0x11,%eax
     510:	cd 40                	int    $0x40
     512:	c3                   	ret

00000513 <unlink>:
SYSCALL(unlink)
     513:	b8 12 00 00 00       	mov    $0x12,%eax
     518:	cd 40                	int    $0x40
     51a:	c3                   	ret

0000051b <fstat>:
SYSCALL(fstat)
     51b:	b8 08 00 00 00       	mov    $0x8,%eax
     520:	cd 40                	int    $0x40
     522:	c3                   	ret

00000523 <link>:
SYSCALL(link)
     523:	b8 13 00 00 00       	mov    $0x13,%eax
     528:	cd 40                	int    $0x40
     52a:	c3                   	ret

0000052b <mkdir>:
SYSCALL(mkdir)
     52b:	b8 14 00 00 00       	mov    $0x14,%eax
     530:	cd 40                	int    $0x40
     532:	c3                   	ret

00000533 <chdir>:
SYSCALL(chdir)
     533:	b8 09 00 00 00       	mov    $0x9,%eax
     538:	cd 40                	int    $0x40
     53a:	c3                   	ret

0000053b <dup>:
SYSCALL(dup)
     53b:	b8 0a 00 00 00       	mov    $0xa,%eax
     540:	cd 40                	int    $0x40
     542:	c3                   	ret

00000543 <getpid>:
SYSCALL(getpid)
     543:	b8 0b 00 00 00       	mov    $0xb,%eax
     548:	cd 40                	int    $0x40
     54a:	c3                   	ret

0000054b <sbrk>:
SYSCALL(sbrk)
     54b:	b8 0c 00 00 00       	mov    $0xc,%eax
     550:	cd 40                	int    $0x40
     552:	c3                   	ret

00000553 <sleep>:
SYSCALL(sleep)
     553:	b8 0d 00 00 00       	mov    $0xd,%eax
     558:	cd 40                	int    $0x40
     55a:	c3                   	ret

0000055b <uptime>:
SYSCALL(uptime)
     55b:	b8 0e 00 00 00       	mov    $0xe,%eax
     560:	cd 40                	int    $0x40
     562:	c3                   	ret

00000563 <getnice>:
SYSCALL(getnice)
     563:	b8 16 00 00 00       	mov    $0x16,%eax
     568:	cd 40                	int    $0x40
     56a:	c3                   	ret

0000056b <lock>:
SYSCALL(lock)
     56b:	b8 17 00 00 00       	mov    $0x17,%eax
     570:	cd 40                	int    $0x40
     572:	c3                   	ret

00000573 <release>:
SYSCALL(release)
     573:	b8 18 00 00 00       	mov    $0x18,%eax
     578:	cd 40                	int    $0x40
     57a:	c3                   	ret

0000057b <setnice>:
SYSCALL(setnice)
     57b:	b8 19 00 00 00       	mov    $0x19,%eax
     580:	cd 40                	int    $0x40
     582:	c3                   	ret
     583:	66 90                	xchg   %ax,%ax
     585:	66 90                	xchg   %ax,%ax
     587:	66 90                	xchg   %ax,%ax
     589:	66 90                	xchg   %ax,%ax
     58b:	66 90                	xchg   %ax,%ax
     58d:	66 90                	xchg   %ax,%ax
     58f:	90                   	nop

00000590 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	57                   	push   %edi
     594:	56                   	push   %esi
     595:	53                   	push   %ebx
     596:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     598:	89 d1                	mov    %edx,%ecx
{
     59a:	83 ec 3c             	sub    $0x3c,%esp
     59d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     5a0:	85 d2                	test   %edx,%edx
     5a2:	0f 89 80 00 00 00    	jns    628 <printint+0x98>
     5a8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     5ac:	74 7a                	je     628 <printint+0x98>
    x = -xx;
     5ae:	f7 d9                	neg    %ecx
    neg = 1;
     5b0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     5b5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     5b8:	31 f6                	xor    %esi,%esi
     5ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     5c0:	89 c8                	mov    %ecx,%eax
     5c2:	31 d2                	xor    %edx,%edx
     5c4:	89 f7                	mov    %esi,%edi
     5c6:	f7 f3                	div    %ebx
     5c8:	8d 76 01             	lea    0x1(%esi),%esi
     5cb:	0f b6 92 c8 1a 00 00 	movzbl 0x1ac8(%edx),%edx
     5d2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     5d6:	89 ca                	mov    %ecx,%edx
     5d8:	89 c1                	mov    %eax,%ecx
     5da:	39 da                	cmp    %ebx,%edx
     5dc:	73 e2                	jae    5c0 <printint+0x30>
  if(neg)
     5de:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     5e1:	85 c0                	test   %eax,%eax
     5e3:	74 07                	je     5ec <printint+0x5c>
    buf[i++] = '-';
     5e5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
     5ea:	89 f7                	mov    %esi,%edi
     5ec:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     5ef:	8b 75 c0             	mov    -0x40(%ebp),%esi
     5f2:	01 df                	add    %ebx,%edi
     5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
     5f8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
     5fb:	83 ec 04             	sub    $0x4,%esp
     5fe:	88 45 d7             	mov    %al,-0x29(%ebp)
     601:	8d 45 d7             	lea    -0x29(%ebp),%eax
     604:	6a 01                	push   $0x1
     606:	50                   	push   %eax
     607:	56                   	push   %esi
     608:	e8 d6 fe ff ff       	call   4e3 <write>
  while(--i >= 0)
     60d:	89 f8                	mov    %edi,%eax
     60f:	83 c4 10             	add    $0x10,%esp
     612:	83 ef 01             	sub    $0x1,%edi
     615:	39 c3                	cmp    %eax,%ebx
     617:	75 df                	jne    5f8 <printint+0x68>
}
     619:	8d 65 f4             	lea    -0xc(%ebp),%esp
     61c:	5b                   	pop    %ebx
     61d:	5e                   	pop    %esi
     61e:	5f                   	pop    %edi
     61f:	5d                   	pop    %ebp
     620:	c3                   	ret
     621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     628:	31 c0                	xor    %eax,%eax
     62a:	eb 89                	jmp    5b5 <printint+0x25>
     62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000630 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	57                   	push   %edi
     634:	56                   	push   %esi
     635:	53                   	push   %ebx
     636:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     639:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     63c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     63f:	0f b6 1e             	movzbl (%esi),%ebx
     642:	83 c6 01             	add    $0x1,%esi
     645:	84 db                	test   %bl,%bl
     647:	74 67                	je     6b0 <printf+0x80>
     649:	8d 4d 10             	lea    0x10(%ebp),%ecx
     64c:	31 d2                	xor    %edx,%edx
     64e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
     651:	eb 34                	jmp    687 <printf+0x57>
     653:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     658:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     65b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     660:	83 f8 25             	cmp    $0x25,%eax
     663:	74 18                	je     67d <printf+0x4d>
  write(fd, &c, 1);
     665:	83 ec 04             	sub    $0x4,%esp
     668:	8d 45 e7             	lea    -0x19(%ebp),%eax
     66b:	88 5d e7             	mov    %bl,-0x19(%ebp)
     66e:	6a 01                	push   $0x1
     670:	50                   	push   %eax
     671:	57                   	push   %edi
     672:	e8 6c fe ff ff       	call   4e3 <write>
     677:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
     67a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     67d:	0f b6 1e             	movzbl (%esi),%ebx
     680:	83 c6 01             	add    $0x1,%esi
     683:	84 db                	test   %bl,%bl
     685:	74 29                	je     6b0 <printf+0x80>
    c = fmt[i] & 0xff;
     687:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     68a:	85 d2                	test   %edx,%edx
     68c:	74 ca                	je     658 <printf+0x28>
      }
    } else if(state == '%'){
     68e:	83 fa 25             	cmp    $0x25,%edx
     691:	75 ea                	jne    67d <printf+0x4d>
      if(c == 'd'){
     693:	83 f8 25             	cmp    $0x25,%eax
     696:	0f 84 04 01 00 00    	je     7a0 <printf+0x170>
     69c:	83 e8 63             	sub    $0x63,%eax
     69f:	83 f8 15             	cmp    $0x15,%eax
     6a2:	77 1c                	ja     6c0 <printf+0x90>
     6a4:	ff 24 85 70 1a 00 00 	jmp    *0x1a70(,%eax,4)
     6ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     6b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6b3:	5b                   	pop    %ebx
     6b4:	5e                   	pop    %esi
     6b5:	5f                   	pop    %edi
     6b6:	5d                   	pop    %ebp
     6b7:	c3                   	ret
     6b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     6bf:	00 
  write(fd, &c, 1);
     6c0:	83 ec 04             	sub    $0x4,%esp
     6c3:	8d 55 e7             	lea    -0x19(%ebp),%edx
     6c6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     6ca:	6a 01                	push   $0x1
     6cc:	52                   	push   %edx
     6cd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     6d0:	57                   	push   %edi
     6d1:	e8 0d fe ff ff       	call   4e3 <write>
     6d6:	83 c4 0c             	add    $0xc,%esp
     6d9:	88 5d e7             	mov    %bl,-0x19(%ebp)
     6dc:	6a 01                	push   $0x1
     6de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     6e1:	52                   	push   %edx
     6e2:	57                   	push   %edi
     6e3:	e8 fb fd ff ff       	call   4e3 <write>
        putc(fd, c);
     6e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
     6eb:	31 d2                	xor    %edx,%edx
     6ed:	eb 8e                	jmp    67d <printf+0x4d>
     6ef:	90                   	nop
        printint(fd, *ap, 16, 0);
     6f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     6f3:	83 ec 0c             	sub    $0xc,%esp
     6f6:	b9 10 00 00 00       	mov    $0x10,%ecx
     6fb:	8b 13                	mov    (%ebx),%edx
     6fd:	6a 00                	push   $0x0
     6ff:	89 f8                	mov    %edi,%eax
        ap++;
     701:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
     704:	e8 87 fe ff ff       	call   590 <printint>
        ap++;
     709:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     70c:	83 c4 10             	add    $0x10,%esp
      state = 0;
     70f:	31 d2                	xor    %edx,%edx
     711:	e9 67 ff ff ff       	jmp    67d <printf+0x4d>
        s = (char*)*ap;
     716:	8b 45 d0             	mov    -0x30(%ebp),%eax
     719:	8b 18                	mov    (%eax),%ebx
        ap++;
     71b:	83 c0 04             	add    $0x4,%eax
     71e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     721:	85 db                	test   %ebx,%ebx
     723:	0f 84 87 00 00 00    	je     7b0 <printf+0x180>
        while(*s != 0){
     729:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
     72c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
     72e:	84 c0                	test   %al,%al
     730:	0f 84 47 ff ff ff    	je     67d <printf+0x4d>
     736:	8d 55 e7             	lea    -0x19(%ebp),%edx
     739:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     73c:	89 de                	mov    %ebx,%esi
     73e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
     740:	83 ec 04             	sub    $0x4,%esp
     743:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
     746:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
     749:	6a 01                	push   $0x1
     74b:	53                   	push   %ebx
     74c:	57                   	push   %edi
     74d:	e8 91 fd ff ff       	call   4e3 <write>
        while(*s != 0){
     752:	0f b6 06             	movzbl (%esi),%eax
     755:	83 c4 10             	add    $0x10,%esp
     758:	84 c0                	test   %al,%al
     75a:	75 e4                	jne    740 <printf+0x110>
      state = 0;
     75c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
     75f:	31 d2                	xor    %edx,%edx
     761:	e9 17 ff ff ff       	jmp    67d <printf+0x4d>
        printint(fd, *ap, 10, 1);
     766:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     769:	83 ec 0c             	sub    $0xc,%esp
     76c:	b9 0a 00 00 00       	mov    $0xa,%ecx
     771:	8b 13                	mov    (%ebx),%edx
     773:	6a 01                	push   $0x1
     775:	eb 88                	jmp    6ff <printf+0xcf>
        putc(fd, *ap);
     777:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
     780:	8b 03                	mov    (%ebx),%eax
        ap++;
     782:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
     785:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     788:	6a 01                	push   $0x1
     78a:	52                   	push   %edx
     78b:	57                   	push   %edi
     78c:	e8 52 fd ff ff       	call   4e3 <write>
        ap++;
     791:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     794:	83 c4 10             	add    $0x10,%esp
      state = 0;
     797:	31 d2                	xor    %edx,%edx
     799:	e9 df fe ff ff       	jmp    67d <printf+0x4d>
     79e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
     7a0:	83 ec 04             	sub    $0x4,%esp
     7a3:	88 5d e7             	mov    %bl,-0x19(%ebp)
     7a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
     7a9:	6a 01                	push   $0x1
     7ab:	e9 31 ff ff ff       	jmp    6e1 <printf+0xb1>
     7b0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
     7b5:	bb 87 15 00 00       	mov    $0x1587,%ebx
     7ba:	e9 77 ff ff ff       	jmp    736 <printf+0x106>
     7bf:	90                   	nop

000007c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     7c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     7c1:	a1 84 21 00 00       	mov    0x2184,%eax
{
     7c6:	89 e5                	mov    %esp,%ebp
     7c8:	57                   	push   %edi
     7c9:	56                   	push   %esi
     7ca:	53                   	push   %ebx
     7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
     7ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     7d8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     7da:	39 c8                	cmp    %ecx,%eax
     7dc:	73 32                	jae    810 <free+0x50>
     7de:	39 d1                	cmp    %edx,%ecx
     7e0:	72 04                	jb     7e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     7e2:	39 d0                	cmp    %edx,%eax
     7e4:	72 32                	jb     818 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
     7e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
     7e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     7ec:	39 fa                	cmp    %edi,%edx
     7ee:	74 30                	je     820 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
     7f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     7f3:	8b 50 04             	mov    0x4(%eax),%edx
     7f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     7f9:	39 f1                	cmp    %esi,%ecx
     7fb:	74 3a                	je     837 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
     7fd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     7ff:	5b                   	pop    %ebx
  freep = p;
     800:	a3 84 21 00 00       	mov    %eax,0x2184
}
     805:	5e                   	pop    %esi
     806:	5f                   	pop    %edi
     807:	5d                   	pop    %ebp
     808:	c3                   	ret
     809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     810:	39 d0                	cmp    %edx,%eax
     812:	72 04                	jb     818 <free+0x58>
     814:	39 d1                	cmp    %edx,%ecx
     816:	72 ce                	jb     7e6 <free+0x26>
{
     818:	89 d0                	mov    %edx,%eax
     81a:	eb bc                	jmp    7d8 <free+0x18>
     81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
     820:	03 72 04             	add    0x4(%edx),%esi
     823:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     826:	8b 10                	mov    (%eax),%edx
     828:	8b 12                	mov    (%edx),%edx
     82a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     82d:	8b 50 04             	mov    0x4(%eax),%edx
     830:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     833:	39 f1                	cmp    %esi,%ecx
     835:	75 c6                	jne    7fd <free+0x3d>
    p->s.size += bp->s.size;
     837:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
     83a:	a3 84 21 00 00       	mov    %eax,0x2184
    p->s.size += bp->s.size;
     83f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     842:	8b 4b f8             	mov    -0x8(%ebx),%ecx
     845:	89 08                	mov    %ecx,(%eax)
}
     847:	5b                   	pop    %ebx
     848:	5e                   	pop    %esi
     849:	5f                   	pop    %edi
     84a:	5d                   	pop    %ebp
     84b:	c3                   	ret
     84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000850 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	57                   	push   %edi
     854:	56                   	push   %esi
     855:	53                   	push   %ebx
     856:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     859:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     85c:	8b 15 84 21 00 00    	mov    0x2184,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     862:	8d 78 07             	lea    0x7(%eax),%edi
     865:	c1 ef 03             	shr    $0x3,%edi
     868:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     86b:	85 d2                	test   %edx,%edx
     86d:	0f 84 8d 00 00 00    	je     900 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     873:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     875:	8b 48 04             	mov    0x4(%eax),%ecx
     878:	39 f9                	cmp    %edi,%ecx
     87a:	73 64                	jae    8e0 <malloc+0x90>
  if(nu < 4096)
     87c:	bb 00 10 00 00       	mov    $0x1000,%ebx
     881:	39 df                	cmp    %ebx,%edi
     883:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
     886:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
     88d:	eb 0a                	jmp    899 <malloc+0x49>
     88f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     890:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     892:	8b 48 04             	mov    0x4(%eax),%ecx
     895:	39 f9                	cmp    %edi,%ecx
     897:	73 47                	jae    8e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     899:	89 c2                	mov    %eax,%edx
     89b:	3b 05 84 21 00 00    	cmp    0x2184,%eax
     8a1:	75 ed                	jne    890 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
     8a3:	83 ec 0c             	sub    $0xc,%esp
     8a6:	56                   	push   %esi
     8a7:	e8 9f fc ff ff       	call   54b <sbrk>
  if(p == (char*)-1)
     8ac:	83 c4 10             	add    $0x10,%esp
     8af:	83 f8 ff             	cmp    $0xffffffff,%eax
     8b2:	74 1c                	je     8d0 <malloc+0x80>
  hp->s.size = nu;
     8b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
     8b7:	83 ec 0c             	sub    $0xc,%esp
     8ba:	83 c0 08             	add    $0x8,%eax
     8bd:	50                   	push   %eax
     8be:	e8 fd fe ff ff       	call   7c0 <free>
  return freep;
     8c3:	8b 15 84 21 00 00    	mov    0x2184,%edx
      if((p = morecore(nunits)) == 0)
     8c9:	83 c4 10             	add    $0x10,%esp
     8cc:	85 d2                	test   %edx,%edx
     8ce:	75 c0                	jne    890 <malloc+0x40>
        return 0;
  }
}
     8d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     8d3:	31 c0                	xor    %eax,%eax
}
     8d5:	5b                   	pop    %ebx
     8d6:	5e                   	pop    %esi
     8d7:	5f                   	pop    %edi
     8d8:	5d                   	pop    %ebp
     8d9:	c3                   	ret
     8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
     8e0:	39 cf                	cmp    %ecx,%edi
     8e2:	74 4c                	je     930 <malloc+0xe0>
        p->s.size -= nunits;
     8e4:	29 f9                	sub    %edi,%ecx
     8e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     8e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     8ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
     8ef:	89 15 84 21 00 00    	mov    %edx,0x2184
}
     8f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
     8f8:	83 c0 08             	add    $0x8,%eax
}
     8fb:	5b                   	pop    %ebx
     8fc:	5e                   	pop    %esi
     8fd:	5f                   	pop    %edi
     8fe:	5d                   	pop    %ebp
     8ff:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
     900:	c7 05 84 21 00 00 88 	movl   $0x2188,0x2184
     907:	21 00 00 
    base.s.size = 0;
     90a:	b8 88 21 00 00       	mov    $0x2188,%eax
    base.s.ptr = freep = prevp = &base;
     90f:	c7 05 88 21 00 00 88 	movl   $0x2188,0x2188
     916:	21 00 00 
    base.s.size = 0;
     919:	c7 05 8c 21 00 00 00 	movl   $0x0,0x218c
     920:	00 00 00 
    if(p->s.size >= nunits){
     923:	e9 54 ff ff ff       	jmp    87c <malloc+0x2c>
     928:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     92f:	00 
        prevp->s.ptr = p->s.ptr;
     930:	8b 08                	mov    (%eax),%ecx
     932:	89 0a                	mov    %ecx,(%edx)
     934:	eb b9                	jmp    8ef <malloc+0x9f>
     936:	66 90                	xchg   %ax,%ax
     938:	66 90                	xchg   %ax,%ax
     93a:	66 90                	xchg   %ax,%ax
     93c:	66 90                	xchg   %ax,%ax
     93e:	66 90                	xchg   %ax,%ax

00000940 <thread_init>:
        return 0;
    return &threads[tid];
}

/* 初始化线程库 */
void thread_init(void) {
     940:	55                   	push   %ebp
     941:	b8 c0 21 00 00       	mov    $0x21c0,%eax
    int i;
    
    // 初始化线程表
    for (i = 0; i < MAX_THREADS; i++) {
     946:	31 d2                	xor    %edx,%edx
void thread_init(void) {
     948:	89 e5                	mov    %esp,%ebp
     94a:	83 ec 08             	sub    $0x8,%esp
     94d:	8d 76 00             	lea    0x0(%esi),%esi
        threads[i].state = T_UNUSED;
        threads[i].tid = i;
     950:	89 10                	mov    %edx,(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     952:	83 c2 01             	add    $0x1,%edx
     955:	83 c0 44             	add    $0x44,%eax
        threads[i].state = T_UNUSED;
     958:	c7 40 c0 00 00 00 00 	movl   $0x0,-0x40(%eax)
        threads[i].stack = 0;
     95f:	c7 40 c4 00 00 00 00 	movl   $0x0,-0x3c(%eax)
        threads[i].start_routine = 0;
     966:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
        threads[i].arg = 0;
     96d:	c7 40 f0 00 00 00 00 	movl   $0x0,-0x10(%eax)
        threads[i].retval = 0;
     974:	c7 40 f4 00 00 00 00 	movl   $0x0,-0xc(%eax)
        threads[i].join_waiter = 0;
     97b:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
        threads[i].sleep_chan = 0;
     982:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     989:	83 fa 40             	cmp    $0x40,%edx
     98c:	75 c2                	jne    950 <thread_init+0x10>
    }
    
    // 主线程
    threads[0].state = T_RUNNING;
     98e:	c7 05 c4 21 00 00 02 	movl   $0x2,0x21c4
     995:	00 00 00 
    threads[0].tid = 0;
    current_thread = &threads[0];
    next_tid = 1;
    
    printf(1, "[uthreads] 线程库初始化完成，主线程 tid=0\n");
     998:	83 ec 08             	sub    $0x8,%esp
     99b:	68 7c 17 00 00       	push   $0x177c
     9a0:	6a 01                	push   $0x1
    threads[0].tid = 0;
     9a2:	c7 05 c0 21 00 00 00 	movl   $0x0,0x21c0
     9a9:	00 00 00 
    current_thread = &threads[0];
     9ac:	c7 05 a4 21 00 00 c0 	movl   $0x21c0,0x21a4
     9b3:	21 00 00 
    next_tid = 1;
     9b6:	c7 05 a0 21 00 00 01 	movl   $0x1,0x21a0
     9bd:	00 00 00 
    printf(1, "[uthreads] 线程库初始化完成，主线程 tid=0\n");
     9c0:	e8 6b fc ff ff       	call   630 <printf>
}
     9c5:	83 c4 10             	add    $0x10,%esp
     9c8:	c9                   	leave
     9c9:	c3                   	ret
     9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009d0 <thread_create>:

/* 创建线程 */
int thread_create(void *(*start_routine)(void*), void *arg) {
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	57                   	push   %edi
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	83 ec 0c             	sub    $0xc,%esp
     9d9:	8b 75 08             	mov    0x8(%ebp),%esi
    thread_t *t;
    int i;
    uint *sp;
    
    if (!start_routine)
     9dc:	85 f6                	test   %esi,%esi
     9de:	0f 84 d6 00 00 00    	je     aba <thread_create+0xea>
     9e4:	b8 c4 21 00 00       	mov    $0x21c4,%eax
        return -1;
    
    // 查找空闲线程槽
    t = 0;
    for (i = 0; i < MAX_THREADS; i++) {
     9e9:	31 db                	xor    %ebx,%ebx
     9eb:	eb 12                	jmp    9ff <thread_create+0x2f>
     9ed:	8d 76 00             	lea    0x0(%esi),%esi
     9f0:	83 c3 01             	add    $0x1,%ebx
     9f3:	83 c0 44             	add    $0x44,%eax
     9f6:	83 fb 40             	cmp    $0x40,%ebx
     9f9:	0f 84 a9 00 00 00    	je     aa8 <thread_create+0xd8>
        if (threads[i].state == T_UNUSED) {
     9ff:	8b 10                	mov    (%eax),%edx
     a01:	85 d2                	test   %edx,%edx
     a03:	75 eb                	jne    9f0 <thread_create+0x20>
        printf(2, "[uthreads] 错误：线程数已达上限\n");
        return -1;
    }
    
    // 分配栈
    t->stack = malloc(STACK_SIZE);
     a05:	83 ec 0c             	sub    $0xc,%esp
     a08:	6b db 44             	imul   $0x44,%ebx,%ebx
     a0b:	68 00 10 00 00       	push   $0x1000
     a10:	8d bb c0 21 00 00    	lea    0x21c0(%ebx),%edi
     a16:	e8 35 fe ff ff       	call   850 <malloc>
    if (!t->stack) {
     a1b:	83 c4 10             	add    $0x10,%esp
    t->stack = malloc(STACK_SIZE);
     a1e:	89 47 08             	mov    %eax,0x8(%edi)
    if (!t->stack) {
     a21:	85 c0                	test   %eax,%eax
     a23:	0f 84 9e 00 00 00    	je     ac7 <thread_create+0xf7>
    }
    
    // 初始化 TCB
    t->state = T_RUNNABLE;
    t->start_routine = start_routine;
    t->arg = arg;
     a29:	8b 45 0c             	mov    0xc(%ebp),%eax
    t->retval = 0;
    t->join_waiter = 0;
    t->sleep_chan = 0;
    
    // 初始化上下文
    memset(&t->context, 0, sizeof(thread_context_t));
     a2c:	83 ec 04             	sub    $0x4,%esp
    t->start_routine = start_routine;
     a2f:	89 77 30             	mov    %esi,0x30(%edi)
    t->state = T_RUNNABLE;
     a32:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
    t->arg = arg;
     a39:	89 47 34             	mov    %eax,0x34(%edi)
    memset(&t->context, 0, sizeof(thread_context_t));
     a3c:	8d 83 cc 21 00 00    	lea    0x21cc(%ebx),%eax
    t->retval = 0;
     a42:	c7 47 38 00 00 00 00 	movl   $0x0,0x38(%edi)
    t->join_waiter = 0;
     a49:	c7 47 3c 00 00 00 00 	movl   $0x0,0x3c(%edi)
    t->sleep_chan = 0;
     a50:	c7 47 40 00 00 00 00 	movl   $0x0,0x40(%edi)
    memset(&t->context, 0, sizeof(thread_context_t));
     a57:	6a 24                	push   $0x24
     a59:	6a 00                	push   $0x0
     a5b:	50                   	push   %eax
     a5c:	e8 df f8 ff ff       	call   340 <memset>
    
    // 设置栈顶
    sp = (uint*)((char*)t->stack + STACK_SIZE);
     a61:	8b 47 08             	mov    0x8(%edi),%eax
    
    // 设置 esp 和 eip
    t->context.esp = (uint)sp;
    t->context.eip = (uint)thread_entry;
    
    printf(1, "[uthreads] 创建线程 tid=%d\n", t->tid);
     a64:	83 c4 0c             	add    $0xc,%esp
    *sp = (uint)thread_entry;
     a67:	c7 80 fc 0f 00 00 30 	movl   $0xc30,0xffc(%eax)
     a6e:	0c 00 00 
    sp--;
     a71:	05 fc 0f 00 00       	add    $0xffc,%eax
     a76:	89 47 28             	mov    %eax,0x28(%edi)
    t->context.eip = (uint)thread_entry;
     a79:	c7 47 2c 30 0c 00 00 	movl   $0xc30,0x2c(%edi)
    printf(1, "[uthreads] 创建线程 tid=%d\n", t->tid);
     a80:	ff b3 c0 21 00 00    	push   0x21c0(%ebx)
     a86:	68 08 18 00 00       	push   $0x1808
     a8b:	6a 01                	push   $0x1
     a8d:	e8 9e fb ff ff       	call   630 <printf>
    return t->tid;
     a92:	8b 83 c0 21 00 00    	mov    0x21c0(%ebx),%eax
     a98:	83 c4 10             	add    $0x10,%esp
}
     a9b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a9e:	5b                   	pop    %ebx
     a9f:	5e                   	pop    %esi
     aa0:	5f                   	pop    %edi
     aa1:	5d                   	pop    %ebp
     aa2:	c3                   	ret
     aa3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "[uthreads] 错误：线程数已达上限\n");
     aa8:	83 ec 08             	sub    $0x8,%esp
     aab:	68 b4 17 00 00       	push   $0x17b4
     ab0:	6a 02                	push   $0x2
     ab2:	e8 79 fb ff ff       	call   630 <printf>
        return -1;
     ab7:	83 c4 10             	add    $0x10,%esp
}
     aba:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
     abd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     ac2:	5b                   	pop    %ebx
     ac3:	5e                   	pop    %esi
     ac4:	5f                   	pop    %edi
     ac5:	5d                   	pop    %ebp
     ac6:	c3                   	ret
        printf(2, "[uthreads] 错误：栈分配失败\n");
     ac7:	83 ec 08             	sub    $0x8,%esp
     aca:	68 e0 17 00 00       	push   $0x17e0
     acf:	6a 02                	push   $0x2
     ad1:	e8 5a fb ff ff       	call   630 <printf>
        return -1;
     ad6:	83 c4 10             	add    $0x10,%esp
     ad9:	eb df                	jmp    aba <thread_create+0xea>
     adb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000ae0 <thread_self>:
    thread_schedule();
}

/* 获取当前线程 ID */
int thread_self(void) {
    return current_thread->tid;
     ae0:	a1 a4 21 00 00       	mov    0x21a4,%eax
     ae5:	8b 00                	mov    (%eax),%eax
}
     ae7:	c3                   	ret
     ae8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     aef:	00 

00000af0 <thread_schedule>:

/* 调度器 */
void thread_schedule(void) {
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	57                   	push   %edi
     af4:	56                   	push   %esi
     af5:	53                   	push   %ebx
     af6:	83 ec 0c             	sub    $0xc,%esp
    thread_t *old_thread, *new_thread;
    int start, i, idx;
    
    old_thread = current_thread;
     af9:	8b 35 a4 21 00 00    	mov    0x21a4,%esi
    new_thread = 0;
    
    // Round-robin 调度
    start = (current_thread->tid + 1) % MAX_THREADS;
     aff:	8b 06                	mov    (%esi),%eax
     b01:	8d 50 01             	lea    0x1(%eax),%edx
     b04:	89 d0                	mov    %edx,%eax
     b06:	c1 f8 1f             	sar    $0x1f,%eax
     b09:	c1 e8 1a             	shr    $0x1a,%eax
     b0c:	01 c2                	add    %eax,%edx
     b0e:	83 e2 3f             	and    $0x3f,%edx
     b11:	29 c2                	sub    %eax,%edx
     b13:	8d 5a 40             	lea    0x40(%edx),%ebx
     b16:	eb 0f                	jmp    b27 <thread_schedule+0x37>
     b18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     b1f:	00 
    for (i = 0; i < MAX_THREADS; i++) {
     b20:	83 c2 01             	add    $0x1,%edx
     b23:	39 da                	cmp    %ebx,%edx
     b25:	74 71                	je     b98 <thread_schedule+0xa8>
        idx = (start + i) % MAX_THREADS;
     b27:	89 d1                	mov    %edx,%ecx
     b29:	c1 f9 1f             	sar    $0x1f,%ecx
     b2c:	c1 e9 1a             	shr    $0x1a,%ecx
     b2f:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
     b32:	83 e0 3f             	and    $0x3f,%eax
     b35:	29 c8                	sub    %ecx,%eax
        if (threads[idx].state == T_RUNNABLE) {
     b37:	6b c8 44             	imul   $0x44,%eax,%ecx
     b3a:	83 b9 c4 21 00 00 01 	cmpl   $0x1,0x21c4(%ecx)
     b41:	8d b9 c0 21 00 00    	lea    0x21c0(%ecx),%edi
     b47:	75 d7                	jne    b20 <thread_schedule+0x30>
        printf(1, "[uthreads] 所有线程已结束或阻塞\n");
        exit();
    }
    
    // 同一个线程
    if (new_thread == old_thread) {
     b49:	39 fe                	cmp    %edi,%esi
     b4b:	74 6b                	je     bb8 <thread_schedule+0xc8>
        }
        return;
    }
    
    // 更新状态
    if (old_thread->state == T_RUNNING) {
     b4d:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
     b51:	74 35                	je     b88 <thread_schedule+0x98>
        old_thread->state = T_RUNNABLE;
    }
    new_thread->state = T_RUNNING;
     b53:	6b c0 44             	imul   $0x44,%eax,%eax
    current_thread = new_thread;
    
    // 上下文切换
    thread_switch(&old_thread->context, &new_thread->context);
     b56:	83 ec 08             	sub    $0x8,%esp
     b59:	81 c1 cc 21 00 00    	add    $0x21cc,%ecx
     b5f:	83 c6 0c             	add    $0xc,%esi
    current_thread = new_thread;
     b62:	89 3d a4 21 00 00    	mov    %edi,0x21a4
    new_thread->state = T_RUNNING;
     b68:	c7 80 c4 21 00 00 02 	movl   $0x2,0x21c4(%eax)
     b6f:	00 00 00 
    thread_switch(&old_thread->context, &new_thread->context);
     b72:	51                   	push   %ecx
     b73:	56                   	push   %esi
     b74:	e8 3c 09 00 00       	call   14b5 <thread_switch>
     b79:	83 c4 10             	add    $0x10,%esp
}
     b7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b7f:	5b                   	pop    %ebx
     b80:	5e                   	pop    %esi
     b81:	5f                   	pop    %edi
     b82:	5d                   	pop    %ebp
     b83:	c3                   	ret
     b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        old_thread->state = T_RUNNABLE;
     b88:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
     b8f:	eb c2                	jmp    b53 <thread_schedule+0x63>
     b91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (current_thread->state == T_RUNNING) {
     b98:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
     b9c:	74 de                	je     b7c <thread_schedule+0x8c>
        printf(1, "[uthreads] 所有线程已结束或阻塞\n");
     b9e:	50                   	push   %eax
     b9f:	50                   	push   %eax
     ba0:	68 28 18 00 00       	push   $0x1828
     ba5:	6a 01                	push   $0x1
     ba7:	e8 84 fa ff ff       	call   630 <printf>
        exit();
     bac:	e8 12 f9 ff ff       	call   4c3 <exit>
     bb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            old_thread->state = T_RUNNING;
     bb8:	c7 46 04 02 00 00 00 	movl   $0x2,0x4(%esi)
     bbf:	eb bb                	jmp    b7c <thread_schedule+0x8c>
     bc1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     bc8:	00 
     bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <thread_exit>:
void thread_exit(void *retval) {
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	83 ec 0c             	sub    $0xc,%esp
    current_thread->retval = retval;
     bd6:	a1 a4 21 00 00       	mov    0x21a4,%eax
     bdb:	8b 55 08             	mov    0x8(%ebp),%edx
    current_thread->state = T_ZOMBIE;
     bde:	c7 40 04 04 00 00 00 	movl   $0x4,0x4(%eax)
    current_thread->retval = retval;
     be5:	89 50 38             	mov    %edx,0x38(%eax)
    printf(1, "[uthreads] 线程 tid=%d 退出\n", current_thread->tid);
     be8:	ff 30                	push   (%eax)
     bea:	68 54 18 00 00       	push   $0x1854
     bef:	6a 01                	push   $0x1
     bf1:	e8 3a fa ff ff       	call   630 <printf>
    if (current_thread->join_waiter) {
     bf6:	a1 a4 21 00 00       	mov    0x21a4,%eax
     bfb:	83 c4 10             	add    $0x10,%esp
     bfe:	8b 50 3c             	mov    0x3c(%eax),%edx
     c01:	85 d2                	test   %edx,%edx
     c03:	74 11                	je     c16 <thread_exit+0x46>
        current_thread->join_waiter->state = T_RUNNABLE;
     c05:	c7 42 04 01 00 00 00 	movl   $0x1,0x4(%edx)
        current_thread->join_waiter->sleep_chan = 0;
     c0c:	8b 40 3c             	mov    0x3c(%eax),%eax
     c0f:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
    thread_schedule();
     c16:	e8 d5 fe ff ff       	call   af0 <thread_schedule>
    printf(2, "[uthreads] 错误：thread_exit 不应返回\n");
     c1b:	83 ec 08             	sub    $0x8,%esp
     c1e:	68 78 18 00 00       	push   $0x1878
     c23:	6a 02                	push   $0x2
     c25:	e8 06 fa ff ff       	call   630 <printf>
    exit();
     c2a:	e8 94 f8 ff ff       	call   4c3 <exit>
     c2f:	90                   	nop

00000c30 <thread_entry>:
static void thread_entry(void) {
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	83 ec 14             	sub    $0x14,%esp
    void *ret = current_thread->start_routine(current_thread->arg);
     c36:	a1 a4 21 00 00       	mov    0x21a4,%eax
     c3b:	ff 70 34             	push   0x34(%eax)
     c3e:	ff 50 30             	call   *0x30(%eax)
    thread_exit(ret);
     c41:	89 04 24             	mov    %eax,(%esp)
     c44:	e8 87 ff ff ff       	call   bd0 <thread_exit>
     c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c50 <thread_join>:
void *thread_join(int tid) {
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	57                   	push   %edi
     c54:	56                   	push   %esi
     c55:	53                   	push   %ebx
     c56:	83 ec 0c             	sub    $0xc,%esp
     c59:	8b 75 08             	mov    0x8(%ebp),%esi
    if (tid < 0 || tid >= MAX_THREADS)
     c5c:	83 fe 3f             	cmp    $0x3f,%esi
     c5f:	77 67                	ja     cc8 <thread_join+0x78>
    if (threads[tid].state == T_UNUSED)
     c61:	6b de 44             	imul   $0x44,%esi,%ebx
     c64:	81 c3 c0 21 00 00    	add    $0x21c0,%ebx
     c6a:	8b 43 04             	mov    0x4(%ebx),%eax
     c6d:	85 c0                	test   %eax,%eax
     c6f:	74 57                	je     cc8 <thread_join+0x78>
    if (!t || t == current_thread) {
     c71:	39 1d a4 21 00 00    	cmp    %ebx,0x21a4
     c77:	74 4f                	je     cc8 <thread_join+0x78>
    while (t->state != T_ZOMBIE) {
     c79:	83 f8 04             	cmp    $0x4,%eax
     c7c:	75 1f                	jne    c9d <thread_join+0x4d>
     c7e:	eb 60                	jmp    ce0 <thread_join+0x90>
        t->join_waiter = current_thread;
     c80:	a1 a4 21 00 00       	mov    0x21a4,%eax
     c85:	89 43 3c             	mov    %eax,0x3c(%ebx)
        current_thread->sleep_chan = t;
     c88:	89 58 40             	mov    %ebx,0x40(%eax)
        current_thread->state = T_SLEEPING;
     c8b:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
        thread_schedule();
     c92:	e8 59 fe ff ff       	call   af0 <thread_schedule>
    while (t->state != T_ZOMBIE) {
     c97:	83 7b 04 04          	cmpl   $0x4,0x4(%ebx)
     c9b:	74 43                	je     ce0 <thread_join+0x90>
        if (t->join_waiter) {
     c9d:	8b 43 3c             	mov    0x3c(%ebx),%eax
     ca0:	85 c0                	test   %eax,%eax
     ca2:	74 dc                	je     c80 <thread_join+0x30>
            printf(2, "[uthreads] 错误：线程 tid=%d 已被其他线程 join\n", tid);
     ca4:	83 ec 04             	sub    $0x4,%esp
     ca7:	56                   	push   %esi
     ca8:	68 dc 18 00 00       	push   $0x18dc
     cad:	6a 02                	push   $0x2
     caf:	e8 7c f9 ff ff       	call   630 <printf>
            return 0;
     cb4:	83 c4 10             	add    $0x10,%esp
}
     cb7:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     cba:	31 ff                	xor    %edi,%edi
}
     cbc:	5b                   	pop    %ebx
     cbd:	89 f8                	mov    %edi,%eax
     cbf:	5e                   	pop    %esi
     cc0:	5f                   	pop    %edi
     cc1:	5d                   	pop    %ebp
     cc2:	c3                   	ret
     cc3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "[uthreads] 错误：无效的 join 目标 tid=%d\n", tid);
     cc8:	83 ec 04             	sub    $0x4,%esp
     ccb:	56                   	push   %esi
     ccc:	68 a8 18 00 00       	push   $0x18a8
     cd1:	6a 02                	push   $0x2
     cd3:	e8 58 f9 ff ff       	call   630 <printf>
        return 0;
     cd8:	83 c4 10             	add    $0x10,%esp
     cdb:	eb da                	jmp    cb7 <thread_join+0x67>
     cdd:	8d 76 00             	lea    0x0(%esi),%esi
    retval = t->retval;
     ce0:	6b de 44             	imul   $0x44,%esi,%ebx
     ce3:	81 c3 c0 21 00 00    	add    $0x21c0,%ebx
    if (t->stack) {
     ce9:	8b 43 08             	mov    0x8(%ebx),%eax
    retval = t->retval;
     cec:	8b 7b 38             	mov    0x38(%ebx),%edi
    if (t->stack) {
     cef:	85 c0                	test   %eax,%eax
     cf1:	74 13                	je     d06 <thread_join+0xb6>
        free(t->stack);
     cf3:	83 ec 0c             	sub    $0xc,%esp
     cf6:	50                   	push   %eax
     cf7:	e8 c4 fa ff ff       	call   7c0 <free>
        t->stack = 0;
     cfc:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
     d03:	83 c4 10             	add    $0x10,%esp
    t->state = T_UNUSED;
     d06:	6b c6 44             	imul   $0x44,%esi,%eax
    printf(1, "[uthreads] 线程 tid=%d join 完成\n", tid);
     d09:	83 ec 04             	sub    $0x4,%esp
    t->state = T_UNUSED;
     d0c:	c7 80 c4 21 00 00 00 	movl   $0x0,0x21c4(%eax)
     d13:	00 00 00 
    printf(1, "[uthreads] 线程 tid=%d join 完成\n", tid);
     d16:	56                   	push   %esi
     d17:	68 18 19 00 00       	push   $0x1918
     d1c:	6a 01                	push   $0x1
     d1e:	e8 0d f9 ff ff       	call   630 <printf>
    return retval;
     d23:	83 c4 10             	add    $0x10,%esp
}
     d26:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d29:	89 f8                	mov    %edi,%eax
     d2b:	5b                   	pop    %ebx
     d2c:	5e                   	pop    %esi
     d2d:	5f                   	pop    %edi
     d2e:	5d                   	pop    %ebp
     d2f:	c3                   	ret

00000d30 <thread_yield>:
    current_thread->state = T_RUNNABLE;
     d30:	a1 a4 21 00 00       	mov    0x21a4,%eax
     d35:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    thread_schedule();
     d3c:	e9 af fd ff ff       	jmp    af0 <thread_schedule>
     d41:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d48:	00 
     d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d50 <thread_sleep>:

/* 线程睡眠 */
void thread_sleep(void *chan) {
     d50:	55                   	push   %ebp
    current_thread->sleep_chan = chan;
     d51:	a1 a4 21 00 00       	mov    0x21a4,%eax
    current_thread->state = T_SLEEPING;
     d56:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
void thread_sleep(void *chan) {
     d5d:	89 e5                	mov    %esp,%ebp
    current_thread->sleep_chan = chan;
     d5f:	8b 55 08             	mov    0x8(%ebp),%edx
     d62:	89 50 40             	mov    %edx,0x40(%eax)
    thread_schedule();
}
     d65:	5d                   	pop    %ebp
    thread_schedule();
     d66:	e9 85 fd ff ff       	jmp    af0 <thread_schedule>
     d6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000d70 <thread_wakeup>:

/* 唤醒线程 */
void thread_wakeup(void *chan) {
     d70:	55                   	push   %ebp
     d71:	b8 c4 21 00 00       	mov    $0x21c4,%eax
     d76:	ba c4 32 00 00       	mov    $0x32c4,%edx
     d7b:	89 e5                	mov    %esp,%ebp
     d7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d80:	eb 0d                	jmp    d8f <thread_wakeup+0x1f>
     d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
     d88:	83 c0 44             	add    $0x44,%eax
     d8b:	39 c2                	cmp    %eax,%edx
     d8d:	74 1e                	je     dad <thread_wakeup+0x3d>
        if (threads[i].state == T_SLEEPING && threads[i].sleep_chan == chan) {
     d8f:	83 38 03             	cmpl   $0x3,(%eax)
     d92:	75 f4                	jne    d88 <thread_wakeup+0x18>
     d94:	39 48 3c             	cmp    %ecx,0x3c(%eax)
     d97:	75 ef                	jne    d88 <thread_wakeup+0x18>
            threads[i].state = T_RUNNABLE;
     d99:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     d9f:	83 c0 44             	add    $0x44,%eax
            threads[i].sleep_chan = 0;
     da2:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     da9:	39 c2                	cmp    %eax,%edx
     dab:	75 e2                	jne    d8f <thread_wakeup+0x1f>
        }
    }
}
     dad:	5d                   	pop    %ebp
     dae:	c3                   	ret
     daf:	90                   	nop

00000db0 <mutex_init>:
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

/* ========== 互斥锁实现 ========== */

void mutex_init(mutex_t *m) {
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	8b 45 08             	mov    0x8(%ebp),%eax
    m->locked = 0;
     db6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    m->owner = -1;
     dbc:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    m->wait_chan = m;
     dc3:	89 40 08             	mov    %eax,0x8(%eax)
}
     dc6:	5d                   	pop    %ebp
     dc7:	c3                   	ret
     dc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     dcf:	00 

00000dd0 <mutex_lock>:

void mutex_lock(mutex_t *m) {
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	53                   	push   %ebx
     dd4:	83 ec 04             	sub    $0x4,%esp
     dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
     dda:	8b 13                	mov    (%ebx),%edx
     ddc:	85 d2                	test   %edx,%edx
     dde:	74 14                	je     df4 <mutex_lock+0x24>
        thread_sleep(m->wait_chan);
     de0:	83 ec 0c             	sub    $0xc,%esp
     de3:	ff 73 08             	push   0x8(%ebx)
     de6:	e8 65 ff ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
     deb:	8b 03                	mov    (%ebx),%eax
     ded:	83 c4 10             	add    $0x10,%esp
     df0:	85 c0                	test   %eax,%eax
     df2:	75 ec                	jne    de0 <mutex_lock+0x10>
    }
    
    m->locked = 1;
     df4:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
     dfa:	e8 e1 fc ff ff       	call   ae0 <thread_self>
     dff:	89 43 04             	mov    %eax,0x4(%ebx)
}
     e02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e05:	c9                   	leave
     e06:	c3                   	ret
     e07:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e0e:	00 
     e0f:	90                   	nop

00000e10 <mutex_unlock>:

void mutex_unlock(mutex_t *m) {
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	56                   	push   %esi
     e14:	53                   	push   %ebx
     e15:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (m->owner != thread_self()) {
     e18:	8b 73 04             	mov    0x4(%ebx),%esi
     e1b:	e8 c0 fc ff ff       	call   ae0 <thread_self>
     e20:	39 c6                	cmp    %eax,%esi
     e22:	74 1c                	je     e40 <mutex_unlock+0x30>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
     e24:	83 ec 08             	sub    $0x8,%esp
     e27:	68 40 19 00 00       	push   $0x1940
     e2c:	6a 02                	push   $0x2
     e2e:	e8 fd f7 ff ff       	call   630 <printf>
        return;
     e33:	83 c4 10             	add    $0x10,%esp
    
    m->locked = 0;
    m->owner = -1;
    
    thread_wakeup(m->wait_chan);
}
     e36:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e39:	5b                   	pop    %ebx
     e3a:	5e                   	pop    %esi
     e3b:	5d                   	pop    %ebp
     e3c:	c3                   	ret
     e3d:	8d 76 00             	lea    0x0(%esi),%esi
    thread_wakeup(m->wait_chan);
     e40:	8b 43 08             	mov    0x8(%ebx),%eax
    m->locked = 0;
     e43:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    m->owner = -1;
     e49:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
    thread_wakeup(m->wait_chan);
     e50:	89 45 08             	mov    %eax,0x8(%ebp)
}
     e53:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e56:	5b                   	pop    %ebx
     e57:	5e                   	pop    %esi
     e58:	5d                   	pop    %ebp
    thread_wakeup(m->wait_chan);
     e59:	e9 12 ff ff ff       	jmp    d70 <thread_wakeup>
     e5e:	66 90                	xchg   %ax,%ax

00000e60 <mutex_trylock>:

int mutex_trylock(mutex_t *m) {
     e60:	55                   	push   %ebp
     e61:	89 e5                	mov    %esp,%ebp
     e63:	53                   	push   %ebx
     e64:	83 ec 04             	sub    $0x4,%esp
     e67:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (m->locked) {
     e6a:	8b 03                	mov    (%ebx),%eax
     e6c:	85 c0                	test   %eax,%eax
     e6e:	74 10                	je     e80 <mutex_trylock+0x20>
    }
    
    m->locked = 1;
    m->owner = thread_self();
    return 1;
}
     e70:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e73:	31 c0                	xor    %eax,%eax
     e75:	c9                   	leave
     e76:	c3                   	ret
     e77:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e7e:	00 
     e7f:	90                   	nop
    m->locked = 1;
     e80:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
     e86:	e8 55 fc ff ff       	call   ae0 <thread_self>
     e8b:	89 43 04             	mov    %eax,0x4(%ebx)
    return 1;
     e8e:	b8 01 00 00 00       	mov    $0x1,%eax
}
     e93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e96:	c9                   	leave
     e97:	c3                   	ret
     e98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e9f:	00 

00000ea0 <cond_init>:

/* ========== 条件变量实现 ========== */

void cond_init(cond_t *c) {
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	8b 45 08             	mov    0x8(%ebp),%eax
    c->wait_chan = c;
     ea6:	89 00                	mov    %eax,(%eax)
}
     ea8:	5d                   	pop    %ebp
     ea9:	c3                   	ret
     eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000eb0 <cond_wait>:

void cond_wait(cond_t *c, mutex_t *m) {
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	83 ec 0c             	sub    $0xc,%esp
     eb9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     ebc:	8b 7d 08             	mov    0x8(%ebp),%edi
    if (m->owner != thread_self()) {
     ebf:	8b 73 04             	mov    0x4(%ebx),%esi
     ec2:	e8 19 fc ff ff       	call   ae0 <thread_self>
     ec7:	39 c6                	cmp    %eax,%esi
     ec9:	74 1d                	je     ee8 <cond_wait+0x38>
        printf(2, "[uthreads] 错误：cond_wait 时未持有 mutex\n");
     ecb:	c7 45 0c 78 19 00 00 	movl   $0x1978,0xc(%ebp)
     ed2:	c7 45 08 02 00 00 00 	movl   $0x2,0x8(%ebp)
    // 在条件变量上睡眠
    thread_sleep(c->wait_chan);
    
    // 被唤醒后重新获取 mutex
    mutex_lock(m);
}
     ed9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     edc:	5b                   	pop    %ebx
     edd:	5e                   	pop    %esi
     ede:	5f                   	pop    %edi
     edf:	5d                   	pop    %ebp
        printf(2, "[uthreads] 错误：cond_wait 时未持有 mutex\n");
     ee0:	e9 4b f7 ff ff       	jmp    630 <printf>
     ee5:	8d 76 00             	lea    0x0(%esi),%esi
    thread_wakeup(m->wait_chan);
     ee8:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
     eeb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    m->owner = -1;
     ef1:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
    thread_wakeup(m->wait_chan);
     ef8:	ff 73 08             	push   0x8(%ebx)
     efb:	e8 70 fe ff ff       	call   d70 <thread_wakeup>
    thread_sleep(c->wait_chan);
     f00:	5a                   	pop    %edx
     f01:	ff 37                	push   (%edi)
     f03:	e8 48 fe ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
     f08:	8b 0b                	mov    (%ebx),%ecx
     f0a:	83 c4 10             	add    $0x10,%esp
     f0d:	85 c9                	test   %ecx,%ecx
     f0f:	74 1b                	je     f2c <cond_wait+0x7c>
     f11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
     f18:	83 ec 0c             	sub    $0xc,%esp
     f1b:	ff 73 08             	push   0x8(%ebx)
     f1e:	e8 2d fe ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
     f23:	8b 03                	mov    (%ebx),%eax
     f25:	83 c4 10             	add    $0x10,%esp
     f28:	85 c0                	test   %eax,%eax
     f2a:	75 ec                	jne    f18 <cond_wait+0x68>
    m->locked = 1;
     f2c:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
     f32:	e8 a9 fb ff ff       	call   ae0 <thread_self>
     f37:	89 43 04             	mov    %eax,0x4(%ebx)
}
     f3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f3d:	5b                   	pop    %ebx
     f3e:	5e                   	pop    %esi
     f3f:	5f                   	pop    %edi
     f40:	5d                   	pop    %ebp
     f41:	c3                   	ret
     f42:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f49:	00 
     f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000f50 <cond_signal>:

void cond_signal(cond_t *c) {
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
    thread_wakeup(c->wait_chan);
     f53:	8b 45 08             	mov    0x8(%ebp),%eax
     f56:	8b 00                	mov    (%eax),%eax
     f58:	89 45 08             	mov    %eax,0x8(%ebp)
}
     f5b:	5d                   	pop    %ebp
    thread_wakeup(c->wait_chan);
     f5c:	e9 0f fe ff ff       	jmp    d70 <thread_wakeup>
     f61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f68:	00 
     f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f70 <cond_broadcast>:

void cond_broadcast(cond_t *c) {
     f70:	55                   	push   %ebp
     f71:	89 e5                	mov    %esp,%ebp
     f73:	8b 45 08             	mov    0x8(%ebp),%eax
     f76:	8b 00                	mov    (%eax),%eax
     f78:	89 45 08             	mov    %eax,0x8(%ebp)
     f7b:	5d                   	pop    %ebp
     f7c:	e9 ef fd ff ff       	jmp    d70 <thread_wakeup>
     f81:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f88:	00 
     f89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f90 <channel_create>:
    thread_wakeup(c->wait_chan);
}

/* ========== Channel 实现 ========== */

channel_t *channel_create(int capacity) {
     f90:	55                   	push   %ebp
     f91:	89 e5                	mov    %esp,%ebp
     f93:	56                   	push   %esi
     f94:	53                   	push   %ebx
     f95:	8b 75 08             	mov    0x8(%ebp),%esi
    channel_t *ch;
    
    if (capacity <= 0) {
     f98:	85 f6                	test   %esi,%esi
     f9a:	0f 8e 90 00 00 00    	jle    1030 <channel_create+0xa0>
        printf(2, "[uthreads] 错误：channel 容量必须大于 0\n");
        return 0;
    }
    
    ch = (channel_t*)malloc(sizeof(channel_t));
     fa0:	83 ec 0c             	sub    $0xc,%esp
     fa3:	6a 2c                	push   $0x2c
     fa5:	e8 a6 f8 ff ff       	call   850 <malloc>
    if (!ch) {
     faa:	83 c4 10             	add    $0x10,%esp
    ch = (channel_t*)malloc(sizeof(channel_t));
     fad:	89 c3                	mov    %eax,%ebx
    if (!ch) {
     faf:	85 c0                	test   %eax,%eax
     fb1:	0f 84 99 00 00 00    	je     1050 <channel_create+0xc0>
        printf(2, "[uthreads] 错误：channel 分配失败\n");
        return 0;
    }
    
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
     fb7:	83 ec 0c             	sub    $0xc,%esp
     fba:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
     fc1:	50                   	push   %eax
     fc2:	e8 89 f8 ff ff       	call   850 <malloc>
    if (!ch->buffer) {
     fc7:	83 c4 10             	add    $0x10,%esp
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
     fca:	89 03                	mov    %eax,(%ebx)
    if (!ch->buffer) {
     fcc:	85 c0                	test   %eax,%eax
     fce:	0f 84 9c 00 00 00    	je     1070 <channel_create+0xe0>
    ch->count = 0;
    ch->read_idx = 0;
    ch->write_idx = 0;
    ch->is_closed = 0;
    
    mutex_init(&ch->lock);
     fd4:	8d 43 18             	lea    0x18(%ebx),%eax
    cond_init(&ch->not_empty);
    cond_init(&ch->not_full);
    
    printf(1, "[uthreads] Channel 创建成功，容量=%d\n", capacity);
     fd7:	83 ec 04             	sub    $0x4,%esp
    ch->capacity = capacity;
     fda:	89 73 04             	mov    %esi,0x4(%ebx)
    mutex_init(&ch->lock);
     fdd:	89 43 20             	mov    %eax,0x20(%ebx)
    cond_init(&ch->not_empty);
     fe0:	8d 43 24             	lea    0x24(%ebx),%eax
     fe3:	89 43 24             	mov    %eax,0x24(%ebx)
    cond_init(&ch->not_full);
     fe6:	8d 43 28             	lea    0x28(%ebx),%eax
    ch->count = 0;
     fe9:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    ch->read_idx = 0;
     ff0:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    ch->write_idx = 0;
     ff7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    ch->is_closed = 0;
     ffe:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    m->locked = 0;
    1005:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    100c:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    cond_init(&ch->not_full);
    1013:	89 43 28             	mov    %eax,0x28(%ebx)
    printf(1, "[uthreads] Channel 创建成功，容量=%d\n", capacity);
    1016:	56                   	push   %esi
    1017:	68 40 1a 00 00       	push   $0x1a40
    101c:	6a 01                	push   $0x1
    101e:	e8 0d f6 ff ff       	call   630 <printf>
    return ch;
    1023:	83 c4 10             	add    $0x10,%esp
}
    1026:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1029:	89 d8                	mov    %ebx,%eax
    102b:	5b                   	pop    %ebx
    102c:	5e                   	pop    %esi
    102d:	5d                   	pop    %ebp
    102e:	c3                   	ret
    102f:	90                   	nop
        printf(2, "[uthreads] 错误：channel 容量必须大于 0\n");
    1030:	83 ec 08             	sub    $0x8,%esp
        return 0;
    1033:	31 db                	xor    %ebx,%ebx
        printf(2, "[uthreads] 错误：channel 容量必须大于 0\n");
    1035:	68 ac 19 00 00       	push   $0x19ac
    103a:	6a 02                	push   $0x2
    103c:	e8 ef f5 ff ff       	call   630 <printf>
        return 0;
    1041:	83 c4 10             	add    $0x10,%esp
    1044:	eb e0                	jmp    1026 <channel_create+0x96>
    1046:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    104d:	00 
    104e:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] 错误：channel 分配失败\n");
    1050:	83 ec 08             	sub    $0x8,%esp
        return 0;
    1053:	31 db                	xor    %ebx,%ebx
        printf(2, "[uthreads] 错误：channel 分配失败\n");
    1055:	68 e0 19 00 00       	push   $0x19e0
    105a:	6a 02                	push   $0x2
    105c:	e8 cf f5 ff ff       	call   630 <printf>
        return 0;
    1061:	83 c4 10             	add    $0x10,%esp
    1064:	eb c0                	jmp    1026 <channel_create+0x96>
    1066:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    106d:	00 
    106e:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] 错误：channel 缓冲区分配失败\n");
    1070:	83 ec 08             	sub    $0x8,%esp
    1073:	68 0c 1a 00 00       	push   $0x1a0c
    1078:	6a 02                	push   $0x2
    107a:	e8 b1 f5 ff ff       	call   630 <printf>
        free(ch);
    107f:	89 1c 24             	mov    %ebx,(%esp)
        return 0;
    1082:	31 db                	xor    %ebx,%ebx
        free(ch);
    1084:	e8 37 f7 ff ff       	call   7c0 <free>
        return 0;
    1089:	83 c4 10             	add    $0x10,%esp
    108c:	eb 98                	jmp    1026 <channel_create+0x96>
    108e:	66 90                	xchg   %ax,%ax

00001090 <channel_send>:

int channel_send(channel_t *ch, void *data) {
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	57                   	push   %edi
    1094:	56                   	push   %esi
    1095:	53                   	push   %ebx
    1096:	83 ec 0c             	sub    $0xc,%esp
    1099:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    109c:	8b 7b 18             	mov    0x18(%ebx),%edi
    109f:	85 ff                	test   %edi,%edi
    10a1:	74 1a                	je     10bd <channel_send+0x2d>
    10a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    10a8:	83 ec 0c             	sub    $0xc,%esp
    10ab:	ff 73 20             	push   0x20(%ebx)
    10ae:	e8 9d fc ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
    10b3:	8b 73 18             	mov    0x18(%ebx),%esi
    10b6:	83 c4 10             	add    $0x10,%esp
    10b9:	85 f6                	test   %esi,%esi
    10bb:	75 eb                	jne    10a8 <channel_send+0x18>
    m->locked = 1;
    10bd:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    10c4:	e8 17 fa ff ff       	call   ae0 <thread_self>
    mutex_lock(&ch->lock);
    
    if (ch->is_closed) {
    10c9:	8b 73 14             	mov    0x14(%ebx),%esi
    m->owner = thread_self();
    10cc:	89 43 1c             	mov    %eax,0x1c(%ebx)
    10cf:	89 c7                	mov    %eax,%edi
    if (ch->is_closed) {
    10d1:	85 f6                	test   %esi,%esi
    10d3:	0f 85 56 01 00 00    	jne    122f <channel_send+0x19f>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    // 等待非满
    while (ch->count == ch->capacity && !ch->is_closed) {
    10d9:	8b 43 04             	mov    0x4(%ebx),%eax
    10dc:	39 43 08             	cmp    %eax,0x8(%ebx)
    10df:	74 34                	je     1115 <channel_send+0x85>
    10e1:	e9 9d 00 00 00       	jmp    1183 <channel_send+0xf3>
    10e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10ed:	00 
    10ee:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] 错误：cond_wait 时未持有 mutex\n");
    10f0:	83 ec 08             	sub    $0x8,%esp
    10f3:	68 78 19 00 00       	push   $0x1978
    10f8:	6a 02                	push   $0x2
    10fa:	e8 31 f5 ff ff       	call   630 <printf>
        cond_wait(&ch->not_full, &ch->lock);
    }
    
    if (ch->is_closed) {
    10ff:	8b 43 14             	mov    0x14(%ebx),%eax
    while (ch->count == ch->capacity && !ch->is_closed) {
    1102:	8b 4b 04             	mov    0x4(%ebx),%ecx
        return;
    1105:	83 c4 10             	add    $0x10,%esp
    while (ch->count == ch->capacity && !ch->is_closed) {
    1108:	39 4b 08             	cmp    %ecx,0x8(%ebx)
    110b:	75 72                	jne    117f <channel_send+0xef>
    110d:	85 c0                	test   %eax,%eax
    110f:	0f 85 eb 00 00 00    	jne    1200 <channel_send+0x170>
    if (m->owner != thread_self()) {
    1115:	8b 7b 1c             	mov    0x1c(%ebx),%edi
    1118:	e8 c3 f9 ff ff       	call   ae0 <thread_self>
    111d:	39 c7                	cmp    %eax,%edi
    111f:	75 cf                	jne    10f0 <channel_send+0x60>
    thread_wakeup(m->wait_chan);
    1121:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1124:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    112b:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1132:	ff 73 20             	push   0x20(%ebx)
    1135:	e8 36 fc ff ff       	call   d70 <thread_wakeup>
    thread_sleep(c->wait_chan);
    113a:	5a                   	pop    %edx
    113b:	ff 73 28             	push   0x28(%ebx)
    113e:	e8 0d fc ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
    1143:	8b 4b 18             	mov    0x18(%ebx),%ecx
    1146:	83 c4 10             	add    $0x10,%esp
    1149:	85 c9                	test   %ecx,%ecx
    114b:	74 18                	je     1165 <channel_send+0xd5>
    114d:	8d 76 00             	lea    0x0(%esi),%esi
        thread_sleep(m->wait_chan);
    1150:	83 ec 0c             	sub    $0xc,%esp
    1153:	ff 73 20             	push   0x20(%ebx)
    1156:	e8 f5 fb ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
    115b:	8b 43 18             	mov    0x18(%ebx),%eax
    115e:	83 c4 10             	add    $0x10,%esp
    1161:	85 c0                	test   %eax,%eax
    1163:	75 eb                	jne    1150 <channel_send+0xc0>
    m->locked = 1;
    1165:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    116c:	e8 6f f9 ff ff       	call   ae0 <thread_self>
    while (ch->count == ch->capacity && !ch->is_closed) {
    1171:	8b 4b 04             	mov    0x4(%ebx),%ecx
    m->owner = thread_self();
    1174:	89 43 1c             	mov    %eax,0x1c(%ebx)
    if (ch->is_closed) {
    1177:	8b 43 14             	mov    0x14(%ebx),%eax
    while (ch->count == ch->capacity && !ch->is_closed) {
    117a:	39 4b 08             	cmp    %ecx,0x8(%ebx)
    117d:	74 8e                	je     110d <channel_send+0x7d>
    if (ch->is_closed) {
    117f:	85 c0                	test   %eax,%eax
    1181:	75 7d                	jne    1200 <channel_send+0x170>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    // 写入数据
    ch->buffer[ch->write_idx] = data;
    1183:	8b 53 10             	mov    0x10(%ebx),%edx
    1186:	8b 03                	mov    (%ebx),%eax
    thread_wakeup(c->wait_chan);
    1188:	83 ec 0c             	sub    $0xc,%esp
    ch->buffer[ch->write_idx] = data;
    118b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    118e:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    1191:	8b 43 10             	mov    0x10(%ebx),%eax
    ch->count++;
    1194:	83 43 08 01          	addl   $0x1,0x8(%ebx)
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    1198:	83 c0 01             	add    $0x1,%eax
    119b:	99                   	cltd
    119c:	f7 7b 04             	idivl  0x4(%ebx)
    119f:	89 53 10             	mov    %edx,0x10(%ebx)
    thread_wakeup(c->wait_chan);
    11a2:	ff 73 24             	push   0x24(%ebx)
    11a5:	e8 c6 fb ff ff       	call   d70 <thread_wakeup>
    if (m->owner != thread_self()) {
    11aa:	8b 7b 1c             	mov    0x1c(%ebx),%edi
    11ad:	e8 2e f9 ff ff       	call   ae0 <thread_self>
    11b2:	83 c4 10             	add    $0x10,%esp
    11b5:	39 c7                	cmp    %eax,%edi
    11b7:	75 27                	jne    11e0 <channel_send+0x150>
    thread_wakeup(m->wait_chan);
    11b9:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    11bc:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    11c3:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    11ca:	ff 73 20             	push   0x20(%ebx)
    11cd:	e8 9e fb ff ff       	call   d70 <thread_wakeup>
    11d2:	83 c4 10             	add    $0x10,%esp
    // 唤醒接收者
    cond_signal(&ch->not_empty);
    
    mutex_unlock(&ch->lock);
    return 0;
}
    11d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11d8:	89 f0                	mov    %esi,%eax
    11da:	5b                   	pop    %ebx
    11db:	5e                   	pop    %esi
    11dc:	5f                   	pop    %edi
    11dd:	5d                   	pop    %ebp
    11de:	c3                   	ret
    11df:	90                   	nop
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    11e0:	83 ec 08             	sub    $0x8,%esp
    11e3:	68 40 19 00 00       	push   $0x1940
    11e8:	6a 02                	push   $0x2
    11ea:	e8 41 f4 ff ff       	call   630 <printf>
        return;
    11ef:	83 c4 10             	add    $0x10,%esp
}
    11f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11f5:	89 f0                	mov    %esi,%eax
    11f7:	5b                   	pop    %ebx
    11f8:	5e                   	pop    %esi
    11f9:	5f                   	pop    %edi
    11fa:	5d                   	pop    %ebp
    11fb:	c3                   	ret
    11fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (m->owner != thread_self()) {
    1200:	8b 73 1c             	mov    0x1c(%ebx),%esi
    1203:	e8 d8 f8 ff ff       	call   ae0 <thread_self>
    1208:	39 c6                	cmp    %eax,%esi
    120a:	75 2c                	jne    1238 <channel_send+0x1a8>
    thread_wakeup(m->wait_chan);
    120c:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    120f:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    1216:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    121d:	ff 73 20             	push   0x20(%ebx)
    1220:	e8 4b fb ff ff       	call   d70 <thread_wakeup>
    1225:	83 c4 10             	add    $0x10,%esp
        return -1;
    1228:	be ff ff ff ff       	mov    $0xffffffff,%esi
    122d:	eb a6                	jmp    11d5 <channel_send+0x145>
    if (m->owner != thread_self()) {
    122f:	e8 ac f8 ff ff       	call   ae0 <thread_self>
    1234:	39 c7                	cmp    %eax,%edi
    1236:	74 d4                	je     120c <channel_send+0x17c>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    1238:	83 ec 08             	sub    $0x8,%esp
    123b:	68 40 19 00 00       	push   $0x1940
    1240:	6a 02                	push   $0x2
    1242:	e8 e9 f3 ff ff       	call   630 <printf>
        return;
    1247:	83 c4 10             	add    $0x10,%esp
    124a:	eb dc                	jmp    1228 <channel_send+0x198>
    124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001250 <channel_recv>:

int channel_recv(channel_t *ch, void **data) {
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	56                   	push   %esi
    1254:	53                   	push   %ebx
    1255:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    1258:	8b 43 18             	mov    0x18(%ebx),%eax
    125b:	85 c0                	test   %eax,%eax
    125d:	74 16                	je     1275 <channel_recv+0x25>
    125f:	90                   	nop
        thread_sleep(m->wait_chan);
    1260:	83 ec 0c             	sub    $0xc,%esp
    1263:	ff 73 20             	push   0x20(%ebx)
    1266:	e8 e5 fa ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
    126b:	8b 43 18             	mov    0x18(%ebx),%eax
    126e:	83 c4 10             	add    $0x10,%esp
    1271:	85 c0                	test   %eax,%eax
    1273:	75 eb                	jne    1260 <channel_recv+0x10>
    m->locked = 1;
    1275:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    127c:	e8 5f f8 ff ff       	call   ae0 <thread_self>
    1281:	89 43 1c             	mov    %eax,0x1c(%ebx)
    mutex_lock(&ch->lock);
    
    // 等待非空
    while (ch->count == 0 && !ch->is_closed) {
    1284:	8b 43 08             	mov    0x8(%ebx),%eax
    1287:	85 c0                	test   %eax,%eax
    1289:	74 1e                	je     12a9 <channel_recv+0x59>
    128b:	e9 8b 00 00 00       	jmp    131b <channel_recv+0xcb>
        printf(2, "[uthreads] 错误：cond_wait 时未持有 mutex\n");
    1290:	83 ec 08             	sub    $0x8,%esp
    1293:	68 78 19 00 00       	push   $0x1978
    1298:	6a 02                	push   $0x2
    129a:	e8 91 f3 ff ff       	call   630 <printf>
    while (ch->count == 0 && !ch->is_closed) {
    129f:	8b 53 08             	mov    0x8(%ebx),%edx
        return;
    12a2:	83 c4 10             	add    $0x10,%esp
    while (ch->count == 0 && !ch->is_closed) {
    12a5:	85 d2                	test   %edx,%edx
    12a7:	75 72                	jne    131b <channel_recv+0xcb>
    12a9:	8b 43 14             	mov    0x14(%ebx),%eax
    if (m->owner != thread_self()) {
    12ac:	8b 73 1c             	mov    0x1c(%ebx),%esi
    while (ch->count == 0 && !ch->is_closed) {
    12af:	85 c0                	test   %eax,%eax
    12b1:	0f 85 d9 00 00 00    	jne    1390 <channel_recv+0x140>
    if (m->owner != thread_self()) {
    12b7:	e8 24 f8 ff ff       	call   ae0 <thread_self>
    12bc:	39 c6                	cmp    %eax,%esi
    12be:	75 d0                	jne    1290 <channel_recv+0x40>
    thread_wakeup(m->wait_chan);
    12c0:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    12c3:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    12ca:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    12d1:	ff 73 20             	push   0x20(%ebx)
    12d4:	e8 97 fa ff ff       	call   d70 <thread_wakeup>
    thread_sleep(c->wait_chan);
    12d9:	5e                   	pop    %esi
    12da:	ff 73 24             	push   0x24(%ebx)
    12dd:	e8 6e fa ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
    12e2:	8b 43 18             	mov    0x18(%ebx),%eax
    12e5:	83 c4 10             	add    $0x10,%esp
    12e8:	85 c0                	test   %eax,%eax
    12ea:	74 19                	je     1305 <channel_recv+0xb5>
    12ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    12f0:	83 ec 0c             	sub    $0xc,%esp
    12f3:	ff 73 20             	push   0x20(%ebx)
    12f6:	e8 55 fa ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
    12fb:	8b 4b 18             	mov    0x18(%ebx),%ecx
    12fe:	83 c4 10             	add    $0x10,%esp
    1301:	85 c9                	test   %ecx,%ecx
    1303:	75 eb                	jne    12f0 <channel_recv+0xa0>
    m->locked = 1;
    1305:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    130c:	e8 cf f7 ff ff       	call   ae0 <thread_self>
    while (ch->count == 0 && !ch->is_closed) {
    1311:	8b 53 08             	mov    0x8(%ebx),%edx
    m->owner = thread_self();
    1314:	89 43 1c             	mov    %eax,0x1c(%ebx)
    while (ch->count == 0 && !ch->is_closed) {
    1317:	85 d2                	test   %edx,%edx
    1319:	74 8e                	je     12a9 <channel_recv+0x59>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    // 读取数据
    *data = ch->buffer[ch->read_idx];
    131b:	8b 53 0c             	mov    0xc(%ebx),%edx
    131e:	8b 03                	mov    (%ebx),%eax
    thread_wakeup(c->wait_chan);
    1320:	83 ec 0c             	sub    $0xc,%esp
    *data = ch->buffer[ch->read_idx];
    1323:	8b 14 90             	mov    (%eax,%edx,4),%edx
    1326:	8b 45 0c             	mov    0xc(%ebp),%eax
    1329:	89 10                	mov    %edx,(%eax)
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    132b:	8b 43 0c             	mov    0xc(%ebx),%eax
    ch->count--;
    132e:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    1332:	83 c0 01             	add    $0x1,%eax
    1335:	99                   	cltd
    1336:	f7 7b 04             	idivl  0x4(%ebx)
    1339:	89 53 0c             	mov    %edx,0xc(%ebx)
    thread_wakeup(c->wait_chan);
    133c:	ff 73 28             	push   0x28(%ebx)
    133f:	e8 2c fa ff ff       	call   d70 <thread_wakeup>
    if (m->owner != thread_self()) {
    1344:	8b 73 1c             	mov    0x1c(%ebx),%esi
    1347:	e8 94 f7 ff ff       	call   ae0 <thread_self>
    134c:	83 c4 10             	add    $0x10,%esp
    134f:	39 c6                	cmp    %eax,%esi
    1351:	74 1d                	je     1370 <channel_recv+0x120>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    1353:	83 ec 08             	sub    $0x8,%esp
    1356:	68 40 19 00 00       	push   $0x1940
    135b:	6a 02                	push   $0x2
    135d:	e8 ce f2 ff ff       	call   630 <printf>
        return;
    1362:	83 c4 10             	add    $0x10,%esp
    
    // 唤醒发送者
    cond_signal(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    return 0;
    1365:	31 c0                	xor    %eax,%eax
}
    1367:	8d 65 f8             	lea    -0x8(%ebp),%esp
    136a:	5b                   	pop    %ebx
    136b:	5e                   	pop    %esi
    136c:	5d                   	pop    %ebp
    136d:	c3                   	ret
    136e:	66 90                	xchg   %ax,%ax
    thread_wakeup(m->wait_chan);
    1370:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1373:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    137a:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1381:	ff 73 20             	push   0x20(%ebx)
    1384:	e8 e7 f9 ff ff       	call   d70 <thread_wakeup>
    1389:	83 c4 10             	add    $0x10,%esp
    138c:	eb d7                	jmp    1365 <channel_recv+0x115>
    138e:	66 90                	xchg   %ax,%ax
    if (m->owner != thread_self()) {
    1390:	e8 4b f7 ff ff       	call   ae0 <thread_self>
    1395:	39 c6                	cmp    %eax,%esi
    1397:	74 19                	je     13b2 <channel_recv+0x162>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    1399:	83 ec 08             	sub    $0x8,%esp
    139c:	68 40 19 00 00       	push   $0x1940
    13a1:	6a 02                	push   $0x2
    13a3:	e8 88 f2 ff ff       	call   630 <printf>
        return;
    13a8:	83 c4 10             	add    $0x10,%esp
        return -1;
    13ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    13b0:	eb b5                	jmp    1367 <channel_recv+0x117>
    thread_wakeup(m->wait_chan);
    13b2:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    13b5:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    13bc:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    13c3:	ff 73 20             	push   0x20(%ebx)
    13c6:	e8 a5 f9 ff ff       	call   d70 <thread_wakeup>
    13cb:	83 c4 10             	add    $0x10,%esp
    13ce:	eb db                	jmp    13ab <channel_recv+0x15b>

000013d0 <channel_close>:

void channel_close(channel_t *ch) {
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	56                   	push   %esi
    13d4:	53                   	push   %ebx
    13d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    13d8:	8b 4b 18             	mov    0x18(%ebx),%ecx
    13db:	85 c9                	test   %ecx,%ecx
    13dd:	74 16                	je     13f5 <channel_close+0x25>
    13df:	90                   	nop
        thread_sleep(m->wait_chan);
    13e0:	83 ec 0c             	sub    $0xc,%esp
    13e3:	ff 73 20             	push   0x20(%ebx)
    13e6:	e8 65 f9 ff ff       	call   d50 <thread_sleep>
    while (m->locked) {
    13eb:	8b 53 18             	mov    0x18(%ebx),%edx
    13ee:	83 c4 10             	add    $0x10,%esp
    13f1:	85 d2                	test   %edx,%edx
    13f3:	75 eb                	jne    13e0 <channel_close+0x10>
    m->locked = 1;
    13f5:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    13fc:	e8 df f6 ff ff       	call   ae0 <thread_self>
    thread_wakeup(c->wait_chan);
    1401:	83 ec 0c             	sub    $0xc,%esp
    mutex_lock(&ch->lock);
    
    ch->is_closed = 1;
    1404:	c7 43 14 01 00 00 00 	movl   $0x1,0x14(%ebx)
    m->owner = thread_self();
    140b:	89 43 1c             	mov    %eax,0x1c(%ebx)
    thread_wakeup(c->wait_chan);
    140e:	ff 73 24             	push   0x24(%ebx)
    1411:	e8 5a f9 ff ff       	call   d70 <thread_wakeup>
    1416:	58                   	pop    %eax
    1417:	ff 73 28             	push   0x28(%ebx)
    141a:	e8 51 f9 ff ff       	call   d70 <thread_wakeup>
    if (m->owner != thread_self()) {
    141f:	8b 73 1c             	mov    0x1c(%ebx),%esi
    1422:	e8 b9 f6 ff ff       	call   ae0 <thread_self>
    1427:	83 c4 10             	add    $0x10,%esp
    142a:	39 c6                	cmp    %eax,%esi
    142c:	74 32                	je     1460 <channel_close+0x90>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    142e:	83 ec 08             	sub    $0x8,%esp
    1431:	68 40 19 00 00       	push   $0x1940
    1436:	6a 02                	push   $0x2
    1438:	e8 f3 f1 ff ff       	call   630 <printf>
        return;
    143d:	83 c4 10             	add    $0x10,%esp
    cond_broadcast(&ch->not_empty);
    cond_broadcast(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    
    printf(1, "[uthreads] Channel 已关闭\n");
    1440:	83 ec 08             	sub    $0x8,%esp
    1443:	68 8e 15 00 00       	push   $0x158e
    1448:	6a 01                	push   $0x1
    144a:	e8 e1 f1 ff ff       	call   630 <printf>
}
    144f:	83 c4 10             	add    $0x10,%esp
    1452:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1455:	5b                   	pop    %ebx
    1456:	5e                   	pop    %esi
    1457:	5d                   	pop    %ebp
    1458:	c3                   	ret
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    thread_wakeup(m->wait_chan);
    1460:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1463:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    146a:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1471:	ff 73 20             	push   0x20(%ebx)
    1474:	e8 f7 f8 ff ff       	call   d70 <thread_wakeup>
    1479:	83 c4 10             	add    $0x10,%esp
    147c:	eb c2                	jmp    1440 <channel_close+0x70>
    147e:	66 90                	xchg   %ax,%ax

00001480 <channel_destroy>:

void channel_destroy(channel_t *ch) {
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	53                   	push   %ebx
    1484:	83 ec 04             	sub    $0x4,%esp
    1487:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (!ch)
    148a:	85 db                	test   %ebx,%ebx
    148c:	74 22                	je     14b0 <channel_destroy+0x30>
        return;
    
    if (ch->buffer) {
    148e:	8b 03                	mov    (%ebx),%eax
    1490:	85 c0                	test   %eax,%eax
    1492:	74 0c                	je     14a0 <channel_destroy+0x20>
        free(ch->buffer);
    1494:	83 ec 0c             	sub    $0xc,%esp
    1497:	50                   	push   %eax
    1498:	e8 23 f3 ff ff       	call   7c0 <free>
    149d:	83 c4 10             	add    $0x10,%esp
    }
    free(ch);
    14a0:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    14a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    14a6:	c9                   	leave
    free(ch);
    14a7:	e9 14 f3 ff ff       	jmp    7c0 <free>
    14ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
    14b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    14b3:	c9                   	leave
    14b4:	c3                   	ret

000014b5 <thread_switch>:

.text
.globl thread_switch
thread_switch:
    # 获取参数
    movl 4(%esp), %eax      # eax = old
    14b5:	8b 44 24 04          	mov    0x4(%esp),%eax
    movl 8(%esp), %edx      # edx = new
    14b9:	8b 54 24 08          	mov    0x8(%esp),%edx
    
    # 保存 old 的上下文
    movl %ebx, 4(%eax)      # 保存 ebx
    14bd:	89 58 04             	mov    %ebx,0x4(%eax)
    movl %ecx, 8(%eax)      # 保存 ecx
    14c0:	89 48 08             	mov    %ecx,0x8(%eax)
    movl %esi, 16(%eax)     # 保存 esi
    14c3:	89 70 10             	mov    %esi,0x10(%eax)
    movl %edi, 20(%eax)     # 保存 edi
    14c6:	89 78 14             	mov    %edi,0x14(%eax)
    movl %ebp, 24(%eax)     # 保存 ebp
    14c9:	89 68 18             	mov    %ebp,0x18(%eax)
    movl %esp, 28(%eax)     # 保存 esp
    14cc:	89 60 1c             	mov    %esp,0x1c(%eax)
    
    # 保存返回地址 (eip)
    movl (%esp), %ecx
    14cf:	8b 0c 24             	mov    (%esp),%ecx
    movl %ecx, 32(%eax)
    14d2:	89 48 20             	mov    %ecx,0x20(%eax)
    
    # 恢复 new 的上下文
    movl 4(%edx), %ebx      # 恢复 ebx
    14d5:	8b 5a 04             	mov    0x4(%edx),%ebx
    movl 8(%edx), %ecx      # 恢复 ecx
    14d8:	8b 4a 08             	mov    0x8(%edx),%ecx
    movl 16(%edx), %esi     # 恢复 esi
    14db:	8b 72 10             	mov    0x10(%edx),%esi
    movl 20(%edx), %edi     # 恢复 edi
    14de:	8b 7a 14             	mov    0x14(%edx),%edi
    movl 24(%edx), %ebp     # 恢复 ebp
    14e1:	8b 6a 18             	mov    0x18(%edx),%ebp
    movl 28(%edx), %esp     # 恢复 esp
    14e4:	8b 62 1c             	mov    0x1c(%edx),%esp
    
    # 恢复 eip（返回地址）
    movl 32(%edx), %eax
    14e7:	8b 42 20             	mov    0x20(%edx),%eax
    movl %eax, (%esp)
    14ea:	89 04 24             	mov    %eax,(%esp)
    
    # 返回（跳转到新线程）
    ret
    14ed:	c3                   	ret
