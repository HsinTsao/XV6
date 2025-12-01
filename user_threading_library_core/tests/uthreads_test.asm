
_uthreads_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    
    printf(1, "[线程%d] 结束执行\n", id);
    return (void*)(id * 100);
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
      10:	51                   	push   %ecx
      11:	83 ec 10             	sub    $0x10,%esp
    int tid1, tid2, tid3;
    void *ret;
    
    printf(1, "========================================\n");
      14:	68 6c 14 00 00       	push   $0x146c
      19:	6a 01                	push   $0x1
      1b:	e8 f0 04 00 00       	call   510 <printf>
    printf(1, "      用户级线程基础测试\n");
      20:	58                   	pop    %eax
      21:	5a                   	pop    %edx
      22:	68 98 14 00 00       	push   $0x1498
      27:	6a 01                	push   $0x1
      29:	e8 e2 04 00 00       	call   510 <printf>
    printf(1, "========================================\n\n");
      2e:	59                   	pop    %ecx
      2f:	5b                   	pop    %ebx
      30:	68 bc 14 00 00       	push   $0x14bc
      35:	6a 01                	push   $0x1
      37:	e8 d4 04 00 00       	call   510 <printf>
    
    thread_init();
      3c:	e8 df 07 00 00       	call   820 <thread_init>
    
    tid1 = thread_create(simple_task, (void*)1);
      41:	5e                   	pop    %esi
      42:	5f                   	pop    %edi
      43:	6a 01                	push   $0x1
      45:	68 00 01 00 00       	push   $0x100
      4a:	e8 61 08 00 00       	call   8b0 <thread_create>
      4f:	89 c7                	mov    %eax,%edi
    tid2 = thread_create(simple_task, (void*)2);
      51:	58                   	pop    %eax
      52:	5a                   	pop    %edx
      53:	6a 02                	push   $0x2
      55:	68 00 01 00 00       	push   $0x100
      5a:	e8 51 08 00 00       	call   8b0 <thread_create>
    tid3 = thread_create(simple_task, (void*)3);
      5f:	59                   	pop    %ecx
      60:	5b                   	pop    %ebx
      61:	6a 03                	push   $0x3
      63:	68 00 01 00 00       	push   $0x100
    tid2 = thread_create(simple_task, (void*)2);
      68:	89 c6                	mov    %eax,%esi
    tid3 = thread_create(simple_task, (void*)3);
      6a:	e8 41 08 00 00       	call   8b0 <thread_create>
    
    printf(1, "创建了 3 个线程: tid=%d, %d, %d\n\n", tid1, tid2, tid3);
      6f:	89 04 24             	mov    %eax,(%esp)
    tid3 = thread_create(simple_task, (void*)3);
      72:	89 c3                	mov    %eax,%ebx
    printf(1, "创建了 3 个线程: tid=%d, %d, %d\n\n", tid1, tid2, tid3);
      74:	56                   	push   %esi
      75:	57                   	push   %edi
      76:	68 e8 14 00 00       	push   $0x14e8
      7b:	6a 01                	push   $0x1
      7d:	e8 8e 04 00 00       	call   510 <printf>
    
    ret = thread_join(tid1);
      82:	83 c4 14             	add    $0x14,%esp
      85:	57                   	push   %edi
      86:	e8 a5 0a 00 00       	call   b30 <thread_join>
    printf(1, "线程 tid=%d 返回值=%d\n", tid1, (int)ret);
      8b:	50                   	push   %eax
      8c:	57                   	push   %edi
      8d:	68 18 14 00 00       	push   $0x1418
      92:	6a 01                	push   $0x1
      94:	e8 77 04 00 00       	call   510 <printf>
    
    ret = thread_join(tid2);
      99:	83 c4 14             	add    $0x14,%esp
      9c:	56                   	push   %esi
      9d:	e8 8e 0a 00 00       	call   b30 <thread_join>
    printf(1, "线程 tid=%d 返回值=%d\n", tid2, (int)ret);
      a2:	50                   	push   %eax
      a3:	56                   	push   %esi
      a4:	68 18 14 00 00       	push   $0x1418
      a9:	6a 01                	push   $0x1
      ab:	e8 60 04 00 00       	call   510 <printf>
    
    ret = thread_join(tid3);
      b0:	83 c4 14             	add    $0x14,%esp
      b3:	53                   	push   %ebx
      b4:	e8 77 0a 00 00       	call   b30 <thread_join>
    printf(1, "线程 tid=%d 返回值=%d\n", tid3, (int)ret);
      b9:	50                   	push   %eax
      ba:	53                   	push   %ebx
      bb:	68 18 14 00 00       	push   $0x1418
      c0:	6a 01                	push   $0x1
      c2:	e8 49 04 00 00       	call   510 <printf>
    
    printf(1, "\n========================================\n");
      c7:	83 c4 18             	add    $0x18,%esp
      ca:	68 10 15 00 00       	push   $0x1510
      cf:	6a 01                	push   $0x1
      d1:	e8 3a 04 00 00       	call   510 <printf>
    printf(1, "测试完成！\n");
      d6:	5e                   	pop    %esi
      d7:	5f                   	pop    %edi
      d8:	68 34 14 00 00       	push   $0x1434
      dd:	6a 01                	push   $0x1
      df:	e8 2c 04 00 00       	call   510 <printf>
    printf(1, "========================================\n");
      e4:	58                   	pop    %eax
      e5:	5a                   	pop    %edx
      e6:	68 6c 14 00 00       	push   $0x146c
      eb:	6a 01                	push   $0x1
      ed:	e8 1e 04 00 00       	call   510 <printf>
    
    exit();
      f2:	e8 ac 02 00 00       	call   3a3 <exit>
      f7:	66 90                	xchg   %ax,%ax
      f9:	66 90                	xchg   %ax,%ax
      fb:	66 90                	xchg   %ax,%ax
      fd:	66 90                	xchg   %ax,%ax
      ff:	90                   	nop

00000100 <simple_task>:
void *simple_task(void *arg) {
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	8b 75 08             	mov    0x8(%ebp),%esi
    for (i = 0; i < 3; i++) {
     108:	31 db                	xor    %ebx,%ebx
    printf(1, "[线程%d] 开始执行\n", id);
     10a:	83 ec 04             	sub    $0x4,%esp
     10d:	56                   	push   %esi
     10e:	68 d0 13 00 00       	push   $0x13d0
     113:	6a 01                	push   $0x1
     115:	e8 f6 03 00 00       	call   510 <printf>
     11a:	83 c4 10             	add    $0x10,%esp
        printf(1, "[线程%d] 迭代 %d\n", id, i);
     11d:	53                   	push   %ebx
    for (i = 0; i < 3; i++) {
     11e:	83 c3 01             	add    $0x1,%ebx
        printf(1, "[线程%d] 迭代 %d\n", id, i);
     121:	56                   	push   %esi
     122:	68 e9 13 00 00       	push   $0x13e9
     127:	6a 01                	push   $0x1
     129:	e8 e2 03 00 00       	call   510 <printf>
        thread_yield();
     12e:	e8 dd 0a 00 00       	call   c10 <thread_yield>
    for (i = 0; i < 3; i++) {
     133:	83 c4 10             	add    $0x10,%esp
     136:	83 fb 03             	cmp    $0x3,%ebx
     139:	75 e2                	jne    11d <simple_task+0x1d>
    printf(1, "[线程%d] 结束执行\n", id);
     13b:	83 ec 04             	sub    $0x4,%esp
     13e:	56                   	push   %esi
     13f:	68 ff 13 00 00       	push   $0x13ff
     144:	6a 01                	push   $0x1
     146:	e8 c5 03 00 00       	call   510 <printf>
    return (void*)(id * 100);
     14b:	6b c6 64             	imul   $0x64,%esi,%eax
}
     14e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     151:	5b                   	pop    %ebx
     152:	5e                   	pop    %esi
     153:	5d                   	pop    %ebp
     154:	c3                   	ret
     155:	66 90                	xchg   %ax,%ax
     157:	66 90                	xchg   %ax,%ax
     159:	66 90                	xchg   %ax,%ax
     15b:	66 90                	xchg   %ax,%ax
     15d:	66 90                	xchg   %ax,%ax
     15f:	90                   	nop

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     160:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     161:	31 c0                	xor    %eax,%eax
{
     163:	89 e5                	mov    %esp,%ebp
     165:	53                   	push   %ebx
     166:	8b 4d 08             	mov    0x8(%ebp),%ecx
     169:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     170:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     174:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     177:	83 c0 01             	add    $0x1,%eax
     17a:	84 d2                	test   %dl,%dl
     17c:	75 f2                	jne    170 <strcpy+0x10>
    ;
  return os;
}
     17e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     181:	89 c8                	mov    %ecx,%eax
     183:	c9                   	leave
     184:	c3                   	ret
     185:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     18c:	00 
     18d:	8d 76 00             	lea    0x0(%esi),%esi

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	53                   	push   %ebx
     194:	8b 55 08             	mov    0x8(%ebp),%edx
     197:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     19a:	0f b6 02             	movzbl (%edx),%eax
     19d:	84 c0                	test   %al,%al
     19f:	75 17                	jne    1b8 <strcmp+0x28>
     1a1:	eb 3a                	jmp    1dd <strcmp+0x4d>
     1a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     1a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     1ac:	83 c2 01             	add    $0x1,%edx
     1af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     1b2:	84 c0                	test   %al,%al
     1b4:	74 1a                	je     1d0 <strcmp+0x40>
     1b6:	89 d9                	mov    %ebx,%ecx
     1b8:	0f b6 19             	movzbl (%ecx),%ebx
     1bb:	38 c3                	cmp    %al,%bl
     1bd:	74 e9                	je     1a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     1bf:	29 d8                	sub    %ebx,%eax
}
     1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1c4:	c9                   	leave
     1c5:	c3                   	ret
     1c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     1cd:	00 
     1ce:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
     1d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     1d4:	31 c0                	xor    %eax,%eax
     1d6:	29 d8                	sub    %ebx,%eax
}
     1d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1db:	c9                   	leave
     1dc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     1dd:	0f b6 19             	movzbl (%ecx),%ebx
     1e0:	31 c0                	xor    %eax,%eax
     1e2:	eb db                	jmp    1bf <strcmp+0x2f>
     1e4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     1eb:	00 
     1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strlen>:

uint
strlen(const char *s)
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     1f6:	80 3a 00             	cmpb   $0x0,(%edx)
     1f9:	74 15                	je     210 <strlen+0x20>
     1fb:	31 c0                	xor    %eax,%eax
     1fd:	8d 76 00             	lea    0x0(%esi),%esi
     200:	83 c0 01             	add    $0x1,%eax
     203:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     207:	89 c1                	mov    %eax,%ecx
     209:	75 f5                	jne    200 <strlen+0x10>
    ;
  return n;
}
     20b:	89 c8                	mov    %ecx,%eax
     20d:	5d                   	pop    %ebp
     20e:	c3                   	ret
     20f:	90                   	nop
  for(n = 0; s[n]; n++)
     210:	31 c9                	xor    %ecx,%ecx
}
     212:	5d                   	pop    %ebp
     213:	89 c8                	mov    %ecx,%eax
     215:	c3                   	ret
     216:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     21d:	00 
     21e:	66 90                	xchg   %ax,%ax

00000220 <memset>:

void*
memset(void *dst, int c, uint n)
{
     220:	55                   	push   %ebp
     221:	89 e5                	mov    %esp,%ebp
     223:	57                   	push   %edi
     224:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     227:	8b 4d 10             	mov    0x10(%ebp),%ecx
     22a:	8b 45 0c             	mov    0xc(%ebp),%eax
     22d:	89 d7                	mov    %edx,%edi
     22f:	fc                   	cld
     230:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     232:	8b 7d fc             	mov    -0x4(%ebp),%edi
     235:	89 d0                	mov    %edx,%eax
     237:	c9                   	leave
     238:	c3                   	ret
     239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000240 <strchr>:

char*
strchr(const char *s, char c)
{
     240:	55                   	push   %ebp
     241:	89 e5                	mov    %esp,%ebp
     243:	8b 45 08             	mov    0x8(%ebp),%eax
     246:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     24a:	0f b6 10             	movzbl (%eax),%edx
     24d:	84 d2                	test   %dl,%dl
     24f:	75 12                	jne    263 <strchr+0x23>
     251:	eb 1d                	jmp    270 <strchr+0x30>
     253:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     258:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     25c:	83 c0 01             	add    $0x1,%eax
     25f:	84 d2                	test   %dl,%dl
     261:	74 0d                	je     270 <strchr+0x30>
    if(*s == c)
     263:	38 d1                	cmp    %dl,%cl
     265:	75 f1                	jne    258 <strchr+0x18>
      return (char*)s;
  return 0;
}
     267:	5d                   	pop    %ebp
     268:	c3                   	ret
     269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     270:	31 c0                	xor    %eax,%eax
}
     272:	5d                   	pop    %ebp
     273:	c3                   	ret
     274:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     27b:	00 
     27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <gets>:

char*
gets(char *buf, int max)
{
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	57                   	push   %edi
     284:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     285:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     288:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     289:	31 db                	xor    %ebx,%ebx
{
     28b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     28e:	eb 27                	jmp    2b7 <gets+0x37>
    cc = read(0, &c, 1);
     290:	83 ec 04             	sub    $0x4,%esp
     293:	6a 01                	push   $0x1
     295:	56                   	push   %esi
     296:	6a 00                	push   $0x0
     298:	e8 1e 01 00 00       	call   3bb <read>
    if(cc < 1)
     29d:	83 c4 10             	add    $0x10,%esp
     2a0:	85 c0                	test   %eax,%eax
     2a2:	7e 1d                	jle    2c1 <gets+0x41>
      break;
    buf[i++] = c;
     2a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     2a8:	8b 55 08             	mov    0x8(%ebp),%edx
     2ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     2af:	3c 0a                	cmp    $0xa,%al
     2b1:	74 10                	je     2c3 <gets+0x43>
     2b3:	3c 0d                	cmp    $0xd,%al
     2b5:	74 0c                	je     2c3 <gets+0x43>
  for(i=0; i+1 < max; ){
     2b7:	89 df                	mov    %ebx,%edi
     2b9:	83 c3 01             	add    $0x1,%ebx
     2bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     2bf:	7c cf                	jl     290 <gets+0x10>
     2c1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     2c3:	8b 45 08             	mov    0x8(%ebp),%eax
     2c6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     2ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2cd:	5b                   	pop    %ebx
     2ce:	5e                   	pop    %esi
     2cf:	5f                   	pop    %edi
     2d0:	5d                   	pop    %ebp
     2d1:	c3                   	ret
     2d2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     2d9:	00 
     2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	56                   	push   %esi
     2e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2e5:	83 ec 08             	sub    $0x8,%esp
     2e8:	6a 00                	push   $0x0
     2ea:	ff 75 08             	push   0x8(%ebp)
     2ed:	e8 f1 00 00 00       	call   3e3 <open>
  if(fd < 0)
     2f2:	83 c4 10             	add    $0x10,%esp
     2f5:	85 c0                	test   %eax,%eax
     2f7:	78 27                	js     320 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     2f9:	83 ec 08             	sub    $0x8,%esp
     2fc:	ff 75 0c             	push   0xc(%ebp)
     2ff:	89 c3                	mov    %eax,%ebx
     301:	50                   	push   %eax
     302:	e8 f4 00 00 00       	call   3fb <fstat>
  close(fd);
     307:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     30a:	89 c6                	mov    %eax,%esi
  close(fd);
     30c:	e8 ba 00 00 00       	call   3cb <close>
  return r;
     311:	83 c4 10             	add    $0x10,%esp
}
     314:	8d 65 f8             	lea    -0x8(%ebp),%esp
     317:	89 f0                	mov    %esi,%eax
     319:	5b                   	pop    %ebx
     31a:	5e                   	pop    %esi
     31b:	5d                   	pop    %ebp
     31c:	c3                   	ret
     31d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     320:	be ff ff ff ff       	mov    $0xffffffff,%esi
     325:	eb ed                	jmp    314 <stat+0x34>
     327:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     32e:	00 
     32f:	90                   	nop

00000330 <atoi>:

int
atoi(const char *s)
{
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	53                   	push   %ebx
     334:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     337:	0f be 02             	movsbl (%edx),%eax
     33a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     33d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     340:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     345:	77 1e                	ja     365 <atoi+0x35>
     347:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     34e:	00 
     34f:	90                   	nop
    n = n*10 + *s++ - '0';
     350:	83 c2 01             	add    $0x1,%edx
     353:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     356:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     35a:	0f be 02             	movsbl (%edx),%eax
     35d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     360:	80 fb 09             	cmp    $0x9,%bl
     363:	76 eb                	jbe    350 <atoi+0x20>
  return n;
}
     365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     368:	89 c8                	mov    %ecx,%eax
     36a:	c9                   	leave
     36b:	c3                   	ret
     36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	57                   	push   %edi
     374:	8b 45 10             	mov    0x10(%ebp),%eax
     377:	8b 55 08             	mov    0x8(%ebp),%edx
     37a:	56                   	push   %esi
     37b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     37e:	85 c0                	test   %eax,%eax
     380:	7e 13                	jle    395 <memmove+0x25>
     382:	01 d0                	add    %edx,%eax
  dst = vdst;
     384:	89 d7                	mov    %edx,%edi
     386:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     38d:	00 
     38e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
     390:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     391:	39 f8                	cmp    %edi,%eax
     393:	75 fb                	jne    390 <memmove+0x20>
  return vdst;
}
     395:	5e                   	pop    %esi
     396:	89 d0                	mov    %edx,%eax
     398:	5f                   	pop    %edi
     399:	5d                   	pop    %ebp
     39a:	c3                   	ret

0000039b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     39b:	b8 01 00 00 00       	mov    $0x1,%eax
     3a0:	cd 40                	int    $0x40
     3a2:	c3                   	ret

000003a3 <exit>:
SYSCALL(exit)
     3a3:	b8 02 00 00 00       	mov    $0x2,%eax
     3a8:	cd 40                	int    $0x40
     3aa:	c3                   	ret

000003ab <wait>:
SYSCALL(wait)
     3ab:	b8 03 00 00 00       	mov    $0x3,%eax
     3b0:	cd 40                	int    $0x40
     3b2:	c3                   	ret

000003b3 <pipe>:
SYSCALL(pipe)
     3b3:	b8 04 00 00 00       	mov    $0x4,%eax
     3b8:	cd 40                	int    $0x40
     3ba:	c3                   	ret

000003bb <read>:
SYSCALL(read)
     3bb:	b8 05 00 00 00       	mov    $0x5,%eax
     3c0:	cd 40                	int    $0x40
     3c2:	c3                   	ret

000003c3 <write>:
SYSCALL(write)
     3c3:	b8 10 00 00 00       	mov    $0x10,%eax
     3c8:	cd 40                	int    $0x40
     3ca:	c3                   	ret

000003cb <close>:
SYSCALL(close)
     3cb:	b8 15 00 00 00       	mov    $0x15,%eax
     3d0:	cd 40                	int    $0x40
     3d2:	c3                   	ret

000003d3 <kill>:
SYSCALL(kill)
     3d3:	b8 06 00 00 00       	mov    $0x6,%eax
     3d8:	cd 40                	int    $0x40
     3da:	c3                   	ret

000003db <exec>:
SYSCALL(exec)
     3db:	b8 07 00 00 00       	mov    $0x7,%eax
     3e0:	cd 40                	int    $0x40
     3e2:	c3                   	ret

000003e3 <open>:
SYSCALL(open)
     3e3:	b8 0f 00 00 00       	mov    $0xf,%eax
     3e8:	cd 40                	int    $0x40
     3ea:	c3                   	ret

000003eb <mknod>:
SYSCALL(mknod)
     3eb:	b8 11 00 00 00       	mov    $0x11,%eax
     3f0:	cd 40                	int    $0x40
     3f2:	c3                   	ret

000003f3 <unlink>:
SYSCALL(unlink)
     3f3:	b8 12 00 00 00       	mov    $0x12,%eax
     3f8:	cd 40                	int    $0x40
     3fa:	c3                   	ret

000003fb <fstat>:
SYSCALL(fstat)
     3fb:	b8 08 00 00 00       	mov    $0x8,%eax
     400:	cd 40                	int    $0x40
     402:	c3                   	ret

00000403 <link>:
SYSCALL(link)
     403:	b8 13 00 00 00       	mov    $0x13,%eax
     408:	cd 40                	int    $0x40
     40a:	c3                   	ret

0000040b <mkdir>:
SYSCALL(mkdir)
     40b:	b8 14 00 00 00       	mov    $0x14,%eax
     410:	cd 40                	int    $0x40
     412:	c3                   	ret

00000413 <chdir>:
SYSCALL(chdir)
     413:	b8 09 00 00 00       	mov    $0x9,%eax
     418:	cd 40                	int    $0x40
     41a:	c3                   	ret

0000041b <dup>:
SYSCALL(dup)
     41b:	b8 0a 00 00 00       	mov    $0xa,%eax
     420:	cd 40                	int    $0x40
     422:	c3                   	ret

00000423 <getpid>:
SYSCALL(getpid)
     423:	b8 0b 00 00 00       	mov    $0xb,%eax
     428:	cd 40                	int    $0x40
     42a:	c3                   	ret

0000042b <sbrk>:
SYSCALL(sbrk)
     42b:	b8 0c 00 00 00       	mov    $0xc,%eax
     430:	cd 40                	int    $0x40
     432:	c3                   	ret

00000433 <sleep>:
SYSCALL(sleep)
     433:	b8 0d 00 00 00       	mov    $0xd,%eax
     438:	cd 40                	int    $0x40
     43a:	c3                   	ret

0000043b <uptime>:
SYSCALL(uptime)
     43b:	b8 0e 00 00 00       	mov    $0xe,%eax
     440:	cd 40                	int    $0x40
     442:	c3                   	ret

00000443 <getnice>:
SYSCALL(getnice)
     443:	b8 16 00 00 00       	mov    $0x16,%eax
     448:	cd 40                	int    $0x40
     44a:	c3                   	ret

0000044b <lock>:
SYSCALL(lock)
     44b:	b8 17 00 00 00       	mov    $0x17,%eax
     450:	cd 40                	int    $0x40
     452:	c3                   	ret

00000453 <release>:
SYSCALL(release)
     453:	b8 18 00 00 00       	mov    $0x18,%eax
     458:	cd 40                	int    $0x40
     45a:	c3                   	ret

0000045b <setnice>:
SYSCALL(setnice)
     45b:	b8 19 00 00 00       	mov    $0x19,%eax
     460:	cd 40                	int    $0x40
     462:	c3                   	ret
     463:	66 90                	xchg   %ax,%ax
     465:	66 90                	xchg   %ax,%ax
     467:	66 90                	xchg   %ax,%ax
     469:	66 90                	xchg   %ax,%ax
     46b:	66 90                	xchg   %ax,%ax
     46d:	66 90                	xchg   %ax,%ax
     46f:	90                   	nop

00000470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	57                   	push   %edi
     474:	56                   	push   %esi
     475:	53                   	push   %ebx
     476:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     478:	89 d1                	mov    %edx,%ecx
{
     47a:	83 ec 3c             	sub    $0x3c,%esp
     47d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     480:	85 d2                	test   %edx,%edx
     482:	0f 89 80 00 00 00    	jns    508 <printint+0x98>
     488:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     48c:	74 7a                	je     508 <printint+0x98>
    x = -xx;
     48e:	f7 d9                	neg    %ecx
    neg = 1;
     490:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     495:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     498:	31 f6                	xor    %esi,%esi
     49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     4a0:	89 c8                	mov    %ecx,%eax
     4a2:	31 d2                	xor    %edx,%edx
     4a4:	89 f7                	mov    %esi,%edi
     4a6:	f7 f3                	div    %ebx
     4a8:	8d 76 01             	lea    0x1(%esi),%esi
     4ab:	0f b6 92 88 18 00 00 	movzbl 0x1888(%edx),%edx
     4b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     4b6:	89 ca                	mov    %ecx,%edx
     4b8:	89 c1                	mov    %eax,%ecx
     4ba:	39 da                	cmp    %ebx,%edx
     4bc:	73 e2                	jae    4a0 <printint+0x30>
  if(neg)
     4be:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     4c1:	85 c0                	test   %eax,%eax
     4c3:	74 07                	je     4cc <printint+0x5c>
    buf[i++] = '-';
     4c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
     4ca:	89 f7                	mov    %esi,%edi
     4cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     4cf:	8b 75 c0             	mov    -0x40(%ebp),%esi
     4d2:	01 df                	add    %ebx,%edi
     4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
     4d8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
     4db:	83 ec 04             	sub    $0x4,%esp
     4de:	88 45 d7             	mov    %al,-0x29(%ebp)
     4e1:	8d 45 d7             	lea    -0x29(%ebp),%eax
     4e4:	6a 01                	push   $0x1
     4e6:	50                   	push   %eax
     4e7:	56                   	push   %esi
     4e8:	e8 d6 fe ff ff       	call   3c3 <write>
  while(--i >= 0)
     4ed:	89 f8                	mov    %edi,%eax
     4ef:	83 c4 10             	add    $0x10,%esp
     4f2:	83 ef 01             	sub    $0x1,%edi
     4f5:	39 c3                	cmp    %eax,%ebx
     4f7:	75 df                	jne    4d8 <printint+0x68>
}
     4f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4fc:	5b                   	pop    %ebx
     4fd:	5e                   	pop    %esi
     4fe:	5f                   	pop    %edi
     4ff:	5d                   	pop    %ebp
     500:	c3                   	ret
     501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     508:	31 c0                	xor    %eax,%eax
     50a:	eb 89                	jmp    495 <printint+0x25>
     50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	57                   	push   %edi
     514:	56                   	push   %esi
     515:	53                   	push   %ebx
     516:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     519:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     51c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     51f:	0f b6 1e             	movzbl (%esi),%ebx
     522:	83 c6 01             	add    $0x1,%esi
     525:	84 db                	test   %bl,%bl
     527:	74 67                	je     590 <printf+0x80>
     529:	8d 4d 10             	lea    0x10(%ebp),%ecx
     52c:	31 d2                	xor    %edx,%edx
     52e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
     531:	eb 34                	jmp    567 <printf+0x57>
     533:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     538:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     53b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     540:	83 f8 25             	cmp    $0x25,%eax
     543:	74 18                	je     55d <printf+0x4d>
  write(fd, &c, 1);
     545:	83 ec 04             	sub    $0x4,%esp
     548:	8d 45 e7             	lea    -0x19(%ebp),%eax
     54b:	88 5d e7             	mov    %bl,-0x19(%ebp)
     54e:	6a 01                	push   $0x1
     550:	50                   	push   %eax
     551:	57                   	push   %edi
     552:	e8 6c fe ff ff       	call   3c3 <write>
     557:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
     55a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     55d:	0f b6 1e             	movzbl (%esi),%ebx
     560:	83 c6 01             	add    $0x1,%esi
     563:	84 db                	test   %bl,%bl
     565:	74 29                	je     590 <printf+0x80>
    c = fmt[i] & 0xff;
     567:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     56a:	85 d2                	test   %edx,%edx
     56c:	74 ca                	je     538 <printf+0x28>
      }
    } else if(state == '%'){
     56e:	83 fa 25             	cmp    $0x25,%edx
     571:	75 ea                	jne    55d <printf+0x4d>
      if(c == 'd'){
     573:	83 f8 25             	cmp    $0x25,%eax
     576:	0f 84 04 01 00 00    	je     680 <printf+0x170>
     57c:	83 e8 63             	sub    $0x63,%eax
     57f:	83 f8 15             	cmp    $0x15,%eax
     582:	77 1c                	ja     5a0 <printf+0x90>
     584:	ff 24 85 30 18 00 00 	jmp    *0x1830(,%eax,4)
     58b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     590:	8d 65 f4             	lea    -0xc(%ebp),%esp
     593:	5b                   	pop    %ebx
     594:	5e                   	pop    %esi
     595:	5f                   	pop    %edi
     596:	5d                   	pop    %ebp
     597:	c3                   	ret
     598:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     59f:	00 
  write(fd, &c, 1);
     5a0:	83 ec 04             	sub    $0x4,%esp
     5a3:	8d 55 e7             	lea    -0x19(%ebp),%edx
     5a6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     5aa:	6a 01                	push   $0x1
     5ac:	52                   	push   %edx
     5ad:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     5b0:	57                   	push   %edi
     5b1:	e8 0d fe ff ff       	call   3c3 <write>
     5b6:	83 c4 0c             	add    $0xc,%esp
     5b9:	88 5d e7             	mov    %bl,-0x19(%ebp)
     5bc:	6a 01                	push   $0x1
     5be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     5c1:	52                   	push   %edx
     5c2:	57                   	push   %edi
     5c3:	e8 fb fd ff ff       	call   3c3 <write>
        putc(fd, c);
     5c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
     5cb:	31 d2                	xor    %edx,%edx
     5cd:	eb 8e                	jmp    55d <printf+0x4d>
     5cf:	90                   	nop
        printint(fd, *ap, 16, 0);
     5d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     5d3:	83 ec 0c             	sub    $0xc,%esp
     5d6:	b9 10 00 00 00       	mov    $0x10,%ecx
     5db:	8b 13                	mov    (%ebx),%edx
     5dd:	6a 00                	push   $0x0
     5df:	89 f8                	mov    %edi,%eax
        ap++;
     5e1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
     5e4:	e8 87 fe ff ff       	call   470 <printint>
        ap++;
     5e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     5ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
     5ef:	31 d2                	xor    %edx,%edx
     5f1:	e9 67 ff ff ff       	jmp    55d <printf+0x4d>
        s = (char*)*ap;
     5f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
     5f9:	8b 18                	mov    (%eax),%ebx
        ap++;
     5fb:	83 c0 04             	add    $0x4,%eax
     5fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     601:	85 db                	test   %ebx,%ebx
     603:	0f 84 87 00 00 00    	je     690 <printf+0x180>
        while(*s != 0){
     609:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
     60c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
     60e:	84 c0                	test   %al,%al
     610:	0f 84 47 ff ff ff    	je     55d <printf+0x4d>
     616:	8d 55 e7             	lea    -0x19(%ebp),%edx
     619:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     61c:	89 de                	mov    %ebx,%esi
     61e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
     620:	83 ec 04             	sub    $0x4,%esp
     623:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
     626:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
     629:	6a 01                	push   $0x1
     62b:	53                   	push   %ebx
     62c:	57                   	push   %edi
     62d:	e8 91 fd ff ff       	call   3c3 <write>
        while(*s != 0){
     632:	0f b6 06             	movzbl (%esi),%eax
     635:	83 c4 10             	add    $0x10,%esp
     638:	84 c0                	test   %al,%al
     63a:	75 e4                	jne    620 <printf+0x110>
      state = 0;
     63c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
     63f:	31 d2                	xor    %edx,%edx
     641:	e9 17 ff ff ff       	jmp    55d <printf+0x4d>
        printint(fd, *ap, 10, 1);
     646:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     649:	83 ec 0c             	sub    $0xc,%esp
     64c:	b9 0a 00 00 00       	mov    $0xa,%ecx
     651:	8b 13                	mov    (%ebx),%edx
     653:	6a 01                	push   $0x1
     655:	eb 88                	jmp    5df <printf+0xcf>
        putc(fd, *ap);
     657:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
     65a:	83 ec 04             	sub    $0x4,%esp
     65d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
     660:	8b 03                	mov    (%ebx),%eax
        ap++;
     662:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
     665:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     668:	6a 01                	push   $0x1
     66a:	52                   	push   %edx
     66b:	57                   	push   %edi
     66c:	e8 52 fd ff ff       	call   3c3 <write>
        ap++;
     671:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     674:	83 c4 10             	add    $0x10,%esp
      state = 0;
     677:	31 d2                	xor    %edx,%edx
     679:	e9 df fe ff ff       	jmp    55d <printf+0x4d>
     67e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
     680:	83 ec 04             	sub    $0x4,%esp
     683:	88 5d e7             	mov    %bl,-0x19(%ebp)
     686:	8d 55 e7             	lea    -0x19(%ebp),%edx
     689:	6a 01                	push   $0x1
     68b:	e9 31 ff ff ff       	jmp    5c1 <printf+0xb1>
     690:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
     695:	bb 45 14 00 00       	mov    $0x1445,%ebx
     69a:	e9 77 ff ff ff       	jmp    616 <printf+0x106>
     69f:	90                   	nop

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     6a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6a1:	a1 00 1f 00 00       	mov    0x1f00,%eax
{
     6a6:	89 e5                	mov    %esp,%ebp
     6a8:	57                   	push   %edi
     6a9:	56                   	push   %esi
     6aa:	53                   	push   %ebx
     6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
     6ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6b8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6ba:	39 c8                	cmp    %ecx,%eax
     6bc:	73 32                	jae    6f0 <free+0x50>
     6be:	39 d1                	cmp    %edx,%ecx
     6c0:	72 04                	jb     6c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6c2:	39 d0                	cmp    %edx,%eax
     6c4:	72 32                	jb     6f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
     6c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
     6c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     6cc:	39 fa                	cmp    %edi,%edx
     6ce:	74 30                	je     700 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
     6d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     6d3:	8b 50 04             	mov    0x4(%eax),%edx
     6d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     6d9:	39 f1                	cmp    %esi,%ecx
     6db:	74 3a                	je     717 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
     6dd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     6df:	5b                   	pop    %ebx
  freep = p;
     6e0:	a3 00 1f 00 00       	mov    %eax,0x1f00
}
     6e5:	5e                   	pop    %esi
     6e6:	5f                   	pop    %edi
     6e7:	5d                   	pop    %ebp
     6e8:	c3                   	ret
     6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6f0:	39 d0                	cmp    %edx,%eax
     6f2:	72 04                	jb     6f8 <free+0x58>
     6f4:	39 d1                	cmp    %edx,%ecx
     6f6:	72 ce                	jb     6c6 <free+0x26>
{
     6f8:	89 d0                	mov    %edx,%eax
     6fa:	eb bc                	jmp    6b8 <free+0x18>
     6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
     700:	03 72 04             	add    0x4(%edx),%esi
     703:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     706:	8b 10                	mov    (%eax),%edx
     708:	8b 12                	mov    (%edx),%edx
     70a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     70d:	8b 50 04             	mov    0x4(%eax),%edx
     710:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     713:	39 f1                	cmp    %esi,%ecx
     715:	75 c6                	jne    6dd <free+0x3d>
    p->s.size += bp->s.size;
     717:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
     71a:	a3 00 1f 00 00       	mov    %eax,0x1f00
    p->s.size += bp->s.size;
     71f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     722:	8b 4b f8             	mov    -0x8(%ebx),%ecx
     725:	89 08                	mov    %ecx,(%eax)
}
     727:	5b                   	pop    %ebx
     728:	5e                   	pop    %esi
     729:	5f                   	pop    %edi
     72a:	5d                   	pop    %ebp
     72b:	c3                   	ret
     72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     730:	55                   	push   %ebp
     731:	89 e5                	mov    %esp,%ebp
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	53                   	push   %ebx
     736:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     73c:	8b 15 00 1f 00 00    	mov    0x1f00,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     742:	8d 78 07             	lea    0x7(%eax),%edi
     745:	c1 ef 03             	shr    $0x3,%edi
     748:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     74b:	85 d2                	test   %edx,%edx
     74d:	0f 84 8d 00 00 00    	je     7e0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     753:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     755:	8b 48 04             	mov    0x4(%eax),%ecx
     758:	39 f9                	cmp    %edi,%ecx
     75a:	73 64                	jae    7c0 <malloc+0x90>
  if(nu < 4096)
     75c:	bb 00 10 00 00       	mov    $0x1000,%ebx
     761:	39 df                	cmp    %ebx,%edi
     763:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
     766:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
     76d:	eb 0a                	jmp    779 <malloc+0x49>
     76f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     770:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     772:	8b 48 04             	mov    0x4(%eax),%ecx
     775:	39 f9                	cmp    %edi,%ecx
     777:	73 47                	jae    7c0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     779:	89 c2                	mov    %eax,%edx
     77b:	3b 05 00 1f 00 00    	cmp    0x1f00,%eax
     781:	75 ed                	jne    770 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
     783:	83 ec 0c             	sub    $0xc,%esp
     786:	56                   	push   %esi
     787:	e8 9f fc ff ff       	call   42b <sbrk>
  if(p == (char*)-1)
     78c:	83 c4 10             	add    $0x10,%esp
     78f:	83 f8 ff             	cmp    $0xffffffff,%eax
     792:	74 1c                	je     7b0 <malloc+0x80>
  hp->s.size = nu;
     794:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
     797:	83 ec 0c             	sub    $0xc,%esp
     79a:	83 c0 08             	add    $0x8,%eax
     79d:	50                   	push   %eax
     79e:	e8 fd fe ff ff       	call   6a0 <free>
  return freep;
     7a3:	8b 15 00 1f 00 00    	mov    0x1f00,%edx
      if((p = morecore(nunits)) == 0)
     7a9:	83 c4 10             	add    $0x10,%esp
     7ac:	85 d2                	test   %edx,%edx
     7ae:	75 c0                	jne    770 <malloc+0x40>
        return 0;
  }
}
     7b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     7b3:	31 c0                	xor    %eax,%eax
}
     7b5:	5b                   	pop    %ebx
     7b6:	5e                   	pop    %esi
     7b7:	5f                   	pop    %edi
     7b8:	5d                   	pop    %ebp
     7b9:	c3                   	ret
     7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
     7c0:	39 cf                	cmp    %ecx,%edi
     7c2:	74 4c                	je     810 <malloc+0xe0>
        p->s.size -= nunits;
     7c4:	29 f9                	sub    %edi,%ecx
     7c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     7c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     7cc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
     7cf:	89 15 00 1f 00 00    	mov    %edx,0x1f00
}
     7d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
     7d8:	83 c0 08             	add    $0x8,%eax
}
     7db:	5b                   	pop    %ebx
     7dc:	5e                   	pop    %esi
     7dd:	5f                   	pop    %edi
     7de:	5d                   	pop    %ebp
     7df:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
     7e0:	c7 05 00 1f 00 00 04 	movl   $0x1f04,0x1f00
     7e7:	1f 00 00 
    base.s.size = 0;
     7ea:	b8 04 1f 00 00       	mov    $0x1f04,%eax
    base.s.ptr = freep = prevp = &base;
     7ef:	c7 05 04 1f 00 00 04 	movl   $0x1f04,0x1f04
     7f6:	1f 00 00 
    base.s.size = 0;
     7f9:	c7 05 08 1f 00 00 00 	movl   $0x0,0x1f08
     800:	00 00 00 
    if(p->s.size >= nunits){
     803:	e9 54 ff ff ff       	jmp    75c <malloc+0x2c>
     808:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     80f:	00 
        prevp->s.ptr = p->s.ptr;
     810:	8b 08                	mov    (%eax),%ecx
     812:	89 0a                	mov    %ecx,(%edx)
     814:	eb b9                	jmp    7cf <malloc+0x9f>
     816:	66 90                	xchg   %ax,%ax
     818:	66 90                	xchg   %ax,%ax
     81a:	66 90                	xchg   %ax,%ax
     81c:	66 90                	xchg   %ax,%ax
     81e:	66 90                	xchg   %ax,%ax

00000820 <thread_init>:
        return 0;
    return &threads[tid];
}

/* 初始化线程库 */
void thread_init(void) {
     820:	55                   	push   %ebp
     821:	b8 40 1f 00 00       	mov    $0x1f40,%eax
    int i;
    
    // 初始化线程表
    for (i = 0; i < MAX_THREADS; i++) {
     826:	31 d2                	xor    %edx,%edx
void thread_init(void) {
     828:	89 e5                	mov    %esp,%ebp
     82a:	83 ec 08             	sub    $0x8,%esp
     82d:	8d 76 00             	lea    0x0(%esi),%esi
        threads[i].state = T_UNUSED;
        threads[i].tid = i;
     830:	89 10                	mov    %edx,(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     832:	83 c2 01             	add    $0x1,%edx
     835:	83 c0 44             	add    $0x44,%eax
        threads[i].state = T_UNUSED;
     838:	c7 40 c0 00 00 00 00 	movl   $0x0,-0x40(%eax)
        threads[i].stack = 0;
     83f:	c7 40 c4 00 00 00 00 	movl   $0x0,-0x3c(%eax)
        threads[i].start_routine = 0;
     846:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
        threads[i].arg = 0;
     84d:	c7 40 f0 00 00 00 00 	movl   $0x0,-0x10(%eax)
        threads[i].retval = 0;
     854:	c7 40 f4 00 00 00 00 	movl   $0x0,-0xc(%eax)
        threads[i].join_waiter = 0;
     85b:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
        threads[i].sleep_chan = 0;
     862:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     869:	83 fa 40             	cmp    $0x40,%edx
     86c:	75 c2                	jne    830 <thread_init+0x10>
    }
    
    // 主线程
    threads[0].state = T_RUNNING;
     86e:	c7 05 44 1f 00 00 02 	movl   $0x2,0x1f44
     875:	00 00 00 
    threads[0].tid = 0;
    current_thread = &threads[0];
    next_tid = 1;
    
    printf(1, "[uthreads] 线程库初始化完成，主线程 tid=0\n");
     878:	83 ec 08             	sub    $0x8,%esp
     87b:	68 3c 15 00 00       	push   $0x153c
     880:	6a 01                	push   $0x1
    threads[0].tid = 0;
     882:	c7 05 40 1f 00 00 00 	movl   $0x0,0x1f40
     889:	00 00 00 
    current_thread = &threads[0];
     88c:	c7 05 24 1f 00 00 40 	movl   $0x1f40,0x1f24
     893:	1f 00 00 
    next_tid = 1;
     896:	c7 05 20 1f 00 00 01 	movl   $0x1,0x1f20
     89d:	00 00 00 
    printf(1, "[uthreads] 线程库初始化完成，主线程 tid=0\n");
     8a0:	e8 6b fc ff ff       	call   510 <printf>
}
     8a5:	83 c4 10             	add    $0x10,%esp
     8a8:	c9                   	leave
     8a9:	c3                   	ret
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008b0 <thread_create>:

/* 创建线程 */
int thread_create(void *(*start_routine)(void*), void *arg) {
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 0c             	sub    $0xc,%esp
     8b9:	8b 75 08             	mov    0x8(%ebp),%esi
    thread_t *t;
    int i;
    uint *sp;
    
    if (!start_routine)
     8bc:	85 f6                	test   %esi,%esi
     8be:	0f 84 d6 00 00 00    	je     99a <thread_create+0xea>
     8c4:	b8 44 1f 00 00       	mov    $0x1f44,%eax
        return -1;
    
    // 查找空闲线程槽
    t = 0;
    for (i = 0; i < MAX_THREADS; i++) {
     8c9:	31 db                	xor    %ebx,%ebx
     8cb:	eb 12                	jmp    8df <thread_create+0x2f>
     8cd:	8d 76 00             	lea    0x0(%esi),%esi
     8d0:	83 c3 01             	add    $0x1,%ebx
     8d3:	83 c0 44             	add    $0x44,%eax
     8d6:	83 fb 40             	cmp    $0x40,%ebx
     8d9:	0f 84 a9 00 00 00    	je     988 <thread_create+0xd8>
        if (threads[i].state == T_UNUSED) {
     8df:	8b 10                	mov    (%eax),%edx
     8e1:	85 d2                	test   %edx,%edx
     8e3:	75 eb                	jne    8d0 <thread_create+0x20>
        printf(2, "[uthreads] 错误：线程数已达上限\n");
        return -1;
    }
    
    // 分配栈
    t->stack = malloc(STACK_SIZE);
     8e5:	83 ec 0c             	sub    $0xc,%esp
     8e8:	6b db 44             	imul   $0x44,%ebx,%ebx
     8eb:	68 00 10 00 00       	push   $0x1000
     8f0:	8d bb 40 1f 00 00    	lea    0x1f40(%ebx),%edi
     8f6:	e8 35 fe ff ff       	call   730 <malloc>
    if (!t->stack) {
     8fb:	83 c4 10             	add    $0x10,%esp
    t->stack = malloc(STACK_SIZE);
     8fe:	89 47 08             	mov    %eax,0x8(%edi)
    if (!t->stack) {
     901:	85 c0                	test   %eax,%eax
     903:	0f 84 9e 00 00 00    	je     9a7 <thread_create+0xf7>
    }
    
    // 初始化 TCB
    t->state = T_RUNNABLE;
    t->start_routine = start_routine;
    t->arg = arg;
     909:	8b 45 0c             	mov    0xc(%ebp),%eax
    t->retval = 0;
    t->join_waiter = 0;
    t->sleep_chan = 0;
    
    // 初始化上下文
    memset(&t->context, 0, sizeof(thread_context_t));
     90c:	83 ec 04             	sub    $0x4,%esp
    t->start_routine = start_routine;
     90f:	89 77 30             	mov    %esi,0x30(%edi)
    t->state = T_RUNNABLE;
     912:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
    t->arg = arg;
     919:	89 47 34             	mov    %eax,0x34(%edi)
    memset(&t->context, 0, sizeof(thread_context_t));
     91c:	8d 83 4c 1f 00 00    	lea    0x1f4c(%ebx),%eax
    t->retval = 0;
     922:	c7 47 38 00 00 00 00 	movl   $0x0,0x38(%edi)
    t->join_waiter = 0;
     929:	c7 47 3c 00 00 00 00 	movl   $0x0,0x3c(%edi)
    t->sleep_chan = 0;
     930:	c7 47 40 00 00 00 00 	movl   $0x0,0x40(%edi)
    memset(&t->context, 0, sizeof(thread_context_t));
     937:	6a 24                	push   $0x24
     939:	6a 00                	push   $0x0
     93b:	50                   	push   %eax
     93c:	e8 df f8 ff ff       	call   220 <memset>
    
    // 设置栈顶
    sp = (uint*)((char*)t->stack + STACK_SIZE);
     941:	8b 47 08             	mov    0x8(%edi),%eax
    
    // 设置 esp 和 eip
    t->context.esp = (uint)sp;
    t->context.eip = (uint)thread_entry;
    
    printf(1, "[uthreads] 创建线程 tid=%d\n", t->tid);
     944:	83 c4 0c             	add    $0xc,%esp
    *sp = (uint)thread_entry;
     947:	c7 80 fc 0f 00 00 10 	movl   $0xb10,0xffc(%eax)
     94e:	0b 00 00 
    sp--;
     951:	05 fc 0f 00 00       	add    $0xffc,%eax
     956:	89 47 28             	mov    %eax,0x28(%edi)
    t->context.eip = (uint)thread_entry;
     959:	c7 47 2c 10 0b 00 00 	movl   $0xb10,0x2c(%edi)
    printf(1, "[uthreads] 创建线程 tid=%d\n", t->tid);
     960:	ff b3 40 1f 00 00    	push   0x1f40(%ebx)
     966:	68 c8 15 00 00       	push   $0x15c8
     96b:	6a 01                	push   $0x1
     96d:	e8 9e fb ff ff       	call   510 <printf>
    return t->tid;
     972:	8b 83 40 1f 00 00    	mov    0x1f40(%ebx),%eax
     978:	83 c4 10             	add    $0x10,%esp
}
     97b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     97e:	5b                   	pop    %ebx
     97f:	5e                   	pop    %esi
     980:	5f                   	pop    %edi
     981:	5d                   	pop    %ebp
     982:	c3                   	ret
     983:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "[uthreads] 错误：线程数已达上限\n");
     988:	83 ec 08             	sub    $0x8,%esp
     98b:	68 74 15 00 00       	push   $0x1574
     990:	6a 02                	push   $0x2
     992:	e8 79 fb ff ff       	call   510 <printf>
        return -1;
     997:	83 c4 10             	add    $0x10,%esp
}
     99a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
     99d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     9a2:	5b                   	pop    %ebx
     9a3:	5e                   	pop    %esi
     9a4:	5f                   	pop    %edi
     9a5:	5d                   	pop    %ebp
     9a6:	c3                   	ret
        printf(2, "[uthreads] 错误：栈分配失败\n");
     9a7:	83 ec 08             	sub    $0x8,%esp
     9aa:	68 a0 15 00 00       	push   $0x15a0
     9af:	6a 02                	push   $0x2
     9b1:	e8 5a fb ff ff       	call   510 <printf>
        return -1;
     9b6:	83 c4 10             	add    $0x10,%esp
     9b9:	eb df                	jmp    99a <thread_create+0xea>
     9bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000009c0 <thread_self>:
    thread_schedule();
}

/* 获取当前线程 ID */
int thread_self(void) {
    return current_thread->tid;
     9c0:	a1 24 1f 00 00       	mov    0x1f24,%eax
     9c5:	8b 00                	mov    (%eax),%eax
}
     9c7:	c3                   	ret
     9c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     9cf:	00 

000009d0 <thread_schedule>:

/* 调度器 */
void thread_schedule(void) {
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	57                   	push   %edi
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	83 ec 0c             	sub    $0xc,%esp
    thread_t *old_thread, *new_thread;
    int start, i, idx;
    
    old_thread = current_thread;
     9d9:	8b 35 24 1f 00 00    	mov    0x1f24,%esi
    new_thread = 0;
    
    // Round-robin 调度
    start = (current_thread->tid + 1) % MAX_THREADS;
     9df:	8b 06                	mov    (%esi),%eax
     9e1:	8d 50 01             	lea    0x1(%eax),%edx
     9e4:	89 d0                	mov    %edx,%eax
     9e6:	c1 f8 1f             	sar    $0x1f,%eax
     9e9:	c1 e8 1a             	shr    $0x1a,%eax
     9ec:	01 c2                	add    %eax,%edx
     9ee:	83 e2 3f             	and    $0x3f,%edx
     9f1:	29 c2                	sub    %eax,%edx
     9f3:	8d 5a 40             	lea    0x40(%edx),%ebx
     9f6:	eb 0f                	jmp    a07 <thread_schedule+0x37>
     9f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     9ff:	00 
    for (i = 0; i < MAX_THREADS; i++) {
     a00:	83 c2 01             	add    $0x1,%edx
     a03:	39 da                	cmp    %ebx,%edx
     a05:	74 71                	je     a78 <thread_schedule+0xa8>
        idx = (start + i) % MAX_THREADS;
     a07:	89 d1                	mov    %edx,%ecx
     a09:	c1 f9 1f             	sar    $0x1f,%ecx
     a0c:	c1 e9 1a             	shr    $0x1a,%ecx
     a0f:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
     a12:	83 e0 3f             	and    $0x3f,%eax
     a15:	29 c8                	sub    %ecx,%eax
        if (threads[idx].state == T_RUNNABLE) {
     a17:	6b c8 44             	imul   $0x44,%eax,%ecx
     a1a:	83 b9 44 1f 00 00 01 	cmpl   $0x1,0x1f44(%ecx)
     a21:	8d b9 40 1f 00 00    	lea    0x1f40(%ecx),%edi
     a27:	75 d7                	jne    a00 <thread_schedule+0x30>
        printf(1, "[uthreads] 所有线程已结束或阻塞\n");
        exit();
    }
    
    // 同一个线程
    if (new_thread == old_thread) {
     a29:	39 fe                	cmp    %edi,%esi
     a2b:	74 6b                	je     a98 <thread_schedule+0xc8>
        }
        return;
    }
    
    // 更新状态
    if (old_thread->state == T_RUNNING) {
     a2d:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
     a31:	74 35                	je     a68 <thread_schedule+0x98>
        old_thread->state = T_RUNNABLE;
    }
    new_thread->state = T_RUNNING;
     a33:	6b c0 44             	imul   $0x44,%eax,%eax
    current_thread = new_thread;
    
    // 上下文切换
    thread_switch(&old_thread->context, &new_thread->context);
     a36:	83 ec 08             	sub    $0x8,%esp
     a39:	81 c1 4c 1f 00 00    	add    $0x1f4c,%ecx
     a3f:	83 c6 0c             	add    $0xc,%esi
    current_thread = new_thread;
     a42:	89 3d 24 1f 00 00    	mov    %edi,0x1f24
    new_thread->state = T_RUNNING;
     a48:	c7 80 44 1f 00 00 02 	movl   $0x2,0x1f44(%eax)
     a4f:	00 00 00 
    thread_switch(&old_thread->context, &new_thread->context);
     a52:	51                   	push   %ecx
     a53:	56                   	push   %esi
     a54:	e8 3c 09 00 00       	call   1395 <thread_switch>
     a59:	83 c4 10             	add    $0x10,%esp
}
     a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a5f:	5b                   	pop    %ebx
     a60:	5e                   	pop    %esi
     a61:	5f                   	pop    %edi
     a62:	5d                   	pop    %ebp
     a63:	c3                   	ret
     a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        old_thread->state = T_RUNNABLE;
     a68:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
     a6f:	eb c2                	jmp    a33 <thread_schedule+0x63>
     a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (current_thread->state == T_RUNNING) {
     a78:	83 7e 04 02          	cmpl   $0x2,0x4(%esi)
     a7c:	74 de                	je     a5c <thread_schedule+0x8c>
        printf(1, "[uthreads] 所有线程已结束或阻塞\n");
     a7e:	50                   	push   %eax
     a7f:	50                   	push   %eax
     a80:	68 e8 15 00 00       	push   $0x15e8
     a85:	6a 01                	push   $0x1
     a87:	e8 84 fa ff ff       	call   510 <printf>
        exit();
     a8c:	e8 12 f9 ff ff       	call   3a3 <exit>
     a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            old_thread->state = T_RUNNING;
     a98:	c7 46 04 02 00 00 00 	movl   $0x2,0x4(%esi)
     a9f:	eb bb                	jmp    a5c <thread_schedule+0x8c>
     aa1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     aa8:	00 
     aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <thread_exit>:
void thread_exit(void *retval) {
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	83 ec 0c             	sub    $0xc,%esp
    current_thread->retval = retval;
     ab6:	a1 24 1f 00 00       	mov    0x1f24,%eax
     abb:	8b 55 08             	mov    0x8(%ebp),%edx
    current_thread->state = T_ZOMBIE;
     abe:	c7 40 04 04 00 00 00 	movl   $0x4,0x4(%eax)
    current_thread->retval = retval;
     ac5:	89 50 38             	mov    %edx,0x38(%eax)
    printf(1, "[uthreads] 线程 tid=%d 退出\n", current_thread->tid);
     ac8:	ff 30                	push   (%eax)
     aca:	68 14 16 00 00       	push   $0x1614
     acf:	6a 01                	push   $0x1
     ad1:	e8 3a fa ff ff       	call   510 <printf>
    if (current_thread->join_waiter) {
     ad6:	a1 24 1f 00 00       	mov    0x1f24,%eax
     adb:	83 c4 10             	add    $0x10,%esp
     ade:	8b 50 3c             	mov    0x3c(%eax),%edx
     ae1:	85 d2                	test   %edx,%edx
     ae3:	74 11                	je     af6 <thread_exit+0x46>
        current_thread->join_waiter->state = T_RUNNABLE;
     ae5:	c7 42 04 01 00 00 00 	movl   $0x1,0x4(%edx)
        current_thread->join_waiter->sleep_chan = 0;
     aec:	8b 40 3c             	mov    0x3c(%eax),%eax
     aef:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
    thread_schedule();
     af6:	e8 d5 fe ff ff       	call   9d0 <thread_schedule>
    printf(2, "[uthreads] 错误：thread_exit 不应返回\n");
     afb:	83 ec 08             	sub    $0x8,%esp
     afe:	68 38 16 00 00       	push   $0x1638
     b03:	6a 02                	push   $0x2
     b05:	e8 06 fa ff ff       	call   510 <printf>
    exit();
     b0a:	e8 94 f8 ff ff       	call   3a3 <exit>
     b0f:	90                   	nop

00000b10 <thread_entry>:
static void thread_entry(void) {
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	83 ec 14             	sub    $0x14,%esp
    void *ret = current_thread->start_routine(current_thread->arg);
     b16:	a1 24 1f 00 00       	mov    0x1f24,%eax
     b1b:	ff 70 34             	push   0x34(%eax)
     b1e:	ff 50 30             	call   *0x30(%eax)
    thread_exit(ret);
     b21:	89 04 24             	mov    %eax,(%esp)
     b24:	e8 87 ff ff ff       	call   ab0 <thread_exit>
     b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b30 <thread_join>:
void *thread_join(int tid) {
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
     b35:	53                   	push   %ebx
     b36:	83 ec 0c             	sub    $0xc,%esp
     b39:	8b 75 08             	mov    0x8(%ebp),%esi
    if (tid < 0 || tid >= MAX_THREADS)
     b3c:	83 fe 3f             	cmp    $0x3f,%esi
     b3f:	77 67                	ja     ba8 <thread_join+0x78>
    if (threads[tid].state == T_UNUSED)
     b41:	6b de 44             	imul   $0x44,%esi,%ebx
     b44:	81 c3 40 1f 00 00    	add    $0x1f40,%ebx
     b4a:	8b 43 04             	mov    0x4(%ebx),%eax
     b4d:	85 c0                	test   %eax,%eax
     b4f:	74 57                	je     ba8 <thread_join+0x78>
    if (!t || t == current_thread) {
     b51:	39 1d 24 1f 00 00    	cmp    %ebx,0x1f24
     b57:	74 4f                	je     ba8 <thread_join+0x78>
    while (t->state != T_ZOMBIE) {
     b59:	83 f8 04             	cmp    $0x4,%eax
     b5c:	75 1f                	jne    b7d <thread_join+0x4d>
     b5e:	eb 60                	jmp    bc0 <thread_join+0x90>
        t->join_waiter = current_thread;
     b60:	a1 24 1f 00 00       	mov    0x1f24,%eax
     b65:	89 43 3c             	mov    %eax,0x3c(%ebx)
        current_thread->sleep_chan = t;
     b68:	89 58 40             	mov    %ebx,0x40(%eax)
        current_thread->state = T_SLEEPING;
     b6b:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
        thread_schedule();
     b72:	e8 59 fe ff ff       	call   9d0 <thread_schedule>
    while (t->state != T_ZOMBIE) {
     b77:	83 7b 04 04          	cmpl   $0x4,0x4(%ebx)
     b7b:	74 43                	je     bc0 <thread_join+0x90>
        if (t->join_waiter) {
     b7d:	8b 43 3c             	mov    0x3c(%ebx),%eax
     b80:	85 c0                	test   %eax,%eax
     b82:	74 dc                	je     b60 <thread_join+0x30>
            printf(2, "[uthreads] 错误：线程 tid=%d 已被其他线程 join\n", tid);
     b84:	83 ec 04             	sub    $0x4,%esp
     b87:	56                   	push   %esi
     b88:	68 9c 16 00 00       	push   $0x169c
     b8d:	6a 02                	push   $0x2
     b8f:	e8 7c f9 ff ff       	call   510 <printf>
            return 0;
     b94:	83 c4 10             	add    $0x10,%esp
}
     b97:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     b9a:	31 ff                	xor    %edi,%edi
}
     b9c:	5b                   	pop    %ebx
     b9d:	89 f8                	mov    %edi,%eax
     b9f:	5e                   	pop    %esi
     ba0:	5f                   	pop    %edi
     ba1:	5d                   	pop    %ebp
     ba2:	c3                   	ret
     ba3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(2, "[uthreads] 错误：无效的 join 目标 tid=%d\n", tid);
     ba8:	83 ec 04             	sub    $0x4,%esp
     bab:	56                   	push   %esi
     bac:	68 68 16 00 00       	push   $0x1668
     bb1:	6a 02                	push   $0x2
     bb3:	e8 58 f9 ff ff       	call   510 <printf>
        return 0;
     bb8:	83 c4 10             	add    $0x10,%esp
     bbb:	eb da                	jmp    b97 <thread_join+0x67>
     bbd:	8d 76 00             	lea    0x0(%esi),%esi
    retval = t->retval;
     bc0:	6b de 44             	imul   $0x44,%esi,%ebx
     bc3:	81 c3 40 1f 00 00    	add    $0x1f40,%ebx
    if (t->stack) {
     bc9:	8b 43 08             	mov    0x8(%ebx),%eax
    retval = t->retval;
     bcc:	8b 7b 38             	mov    0x38(%ebx),%edi
    if (t->stack) {
     bcf:	85 c0                	test   %eax,%eax
     bd1:	74 13                	je     be6 <thread_join+0xb6>
        free(t->stack);
     bd3:	83 ec 0c             	sub    $0xc,%esp
     bd6:	50                   	push   %eax
     bd7:	e8 c4 fa ff ff       	call   6a0 <free>
        t->stack = 0;
     bdc:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
     be3:	83 c4 10             	add    $0x10,%esp
    t->state = T_UNUSED;
     be6:	6b c6 44             	imul   $0x44,%esi,%eax
    printf(1, "[uthreads] 线程 tid=%d join 完成\n", tid);
     be9:	83 ec 04             	sub    $0x4,%esp
    t->state = T_UNUSED;
     bec:	c7 80 44 1f 00 00 00 	movl   $0x0,0x1f44(%eax)
     bf3:	00 00 00 
    printf(1, "[uthreads] 线程 tid=%d join 完成\n", tid);
     bf6:	56                   	push   %esi
     bf7:	68 d8 16 00 00       	push   $0x16d8
     bfc:	6a 01                	push   $0x1
     bfe:	e8 0d f9 ff ff       	call   510 <printf>
    return retval;
     c03:	83 c4 10             	add    $0x10,%esp
}
     c06:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c09:	89 f8                	mov    %edi,%eax
     c0b:	5b                   	pop    %ebx
     c0c:	5e                   	pop    %esi
     c0d:	5f                   	pop    %edi
     c0e:	5d                   	pop    %ebp
     c0f:	c3                   	ret

00000c10 <thread_yield>:
    current_thread->state = T_RUNNABLE;
     c10:	a1 24 1f 00 00       	mov    0x1f24,%eax
     c15:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    thread_schedule();
     c1c:	e9 af fd ff ff       	jmp    9d0 <thread_schedule>
     c21:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c28:	00 
     c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c30 <thread_sleep>:

/* 线程睡眠 */
void thread_sleep(void *chan) {
     c30:	55                   	push   %ebp
    current_thread->sleep_chan = chan;
     c31:	a1 24 1f 00 00       	mov    0x1f24,%eax
    current_thread->state = T_SLEEPING;
     c36:	c7 40 04 03 00 00 00 	movl   $0x3,0x4(%eax)
void thread_sleep(void *chan) {
     c3d:	89 e5                	mov    %esp,%ebp
    current_thread->sleep_chan = chan;
     c3f:	8b 55 08             	mov    0x8(%ebp),%edx
     c42:	89 50 40             	mov    %edx,0x40(%eax)
    thread_schedule();
}
     c45:	5d                   	pop    %ebp
    thread_schedule();
     c46:	e9 85 fd ff ff       	jmp    9d0 <thread_schedule>
     c4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000c50 <thread_wakeup>:

/* 唤醒线程 */
void thread_wakeup(void *chan) {
     c50:	55                   	push   %ebp
     c51:	b8 44 1f 00 00       	mov    $0x1f44,%eax
     c56:	ba 44 30 00 00       	mov    $0x3044,%edx
     c5b:	89 e5                	mov    %esp,%ebp
     c5d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c60:	eb 0d                	jmp    c6f <thread_wakeup+0x1f>
     c62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int i;
    
    for (i = 0; i < MAX_THREADS; i++) {
     c68:	83 c0 44             	add    $0x44,%eax
     c6b:	39 c2                	cmp    %eax,%edx
     c6d:	74 1e                	je     c8d <thread_wakeup+0x3d>
        if (threads[i].state == T_SLEEPING && threads[i].sleep_chan == chan) {
     c6f:	83 38 03             	cmpl   $0x3,(%eax)
     c72:	75 f4                	jne    c68 <thread_wakeup+0x18>
     c74:	39 48 3c             	cmp    %ecx,0x3c(%eax)
     c77:	75 ef                	jne    c68 <thread_wakeup+0x18>
            threads[i].state = T_RUNNABLE;
     c79:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     c7f:	83 c0 44             	add    $0x44,%eax
            threads[i].sleep_chan = 0;
     c82:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    for (i = 0; i < MAX_THREADS; i++) {
     c89:	39 c2                	cmp    %eax,%edx
     c8b:	75 e2                	jne    c6f <thread_wakeup+0x1f>
        }
    }
}
     c8d:	5d                   	pop    %ebp
     c8e:	c3                   	ret
     c8f:	90                   	nop

00000c90 <mutex_init>:
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

/* ========== 互斥锁实现 ========== */

void mutex_init(mutex_t *m) {
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	8b 45 08             	mov    0x8(%ebp),%eax
    m->locked = 0;
     c96:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    m->owner = -1;
     c9c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    m->wait_chan = m;
     ca3:	89 40 08             	mov    %eax,0x8(%eax)
}
     ca6:	5d                   	pop    %ebp
     ca7:	c3                   	ret
     ca8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     caf:	00 

00000cb0 <mutex_lock>:

void mutex_lock(mutex_t *m) {
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	53                   	push   %ebx
     cb4:	83 ec 04             	sub    $0x4,%esp
     cb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
     cba:	8b 13                	mov    (%ebx),%edx
     cbc:	85 d2                	test   %edx,%edx
     cbe:	74 14                	je     cd4 <mutex_lock+0x24>
        thread_sleep(m->wait_chan);
     cc0:	83 ec 0c             	sub    $0xc,%esp
     cc3:	ff 73 08             	push   0x8(%ebx)
     cc6:	e8 65 ff ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
     ccb:	8b 03                	mov    (%ebx),%eax
     ccd:	83 c4 10             	add    $0x10,%esp
     cd0:	85 c0                	test   %eax,%eax
     cd2:	75 ec                	jne    cc0 <mutex_lock+0x10>
    }
    
    m->locked = 1;
     cd4:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
     cda:	e8 e1 fc ff ff       	call   9c0 <thread_self>
     cdf:	89 43 04             	mov    %eax,0x4(%ebx)
}
     ce2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ce5:	c9                   	leave
     ce6:	c3                   	ret
     ce7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     cee:	00 
     cef:	90                   	nop

00000cf0 <mutex_unlock>:

void mutex_unlock(mutex_t *m) {
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	53                   	push   %ebx
     cf5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (m->owner != thread_self()) {
     cf8:	8b 73 04             	mov    0x4(%ebx),%esi
     cfb:	e8 c0 fc ff ff       	call   9c0 <thread_self>
     d00:	39 c6                	cmp    %eax,%esi
     d02:	74 1c                	je     d20 <mutex_unlock+0x30>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
     d04:	83 ec 08             	sub    $0x8,%esp
     d07:	68 00 17 00 00       	push   $0x1700
     d0c:	6a 02                	push   $0x2
     d0e:	e8 fd f7 ff ff       	call   510 <printf>
        return;
     d13:	83 c4 10             	add    $0x10,%esp
    
    m->locked = 0;
    m->owner = -1;
    
    thread_wakeup(m->wait_chan);
}
     d16:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d19:	5b                   	pop    %ebx
     d1a:	5e                   	pop    %esi
     d1b:	5d                   	pop    %ebp
     d1c:	c3                   	ret
     d1d:	8d 76 00             	lea    0x0(%esi),%esi
    thread_wakeup(m->wait_chan);
     d20:	8b 43 08             	mov    0x8(%ebx),%eax
    m->locked = 0;
     d23:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    m->owner = -1;
     d29:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
    thread_wakeup(m->wait_chan);
     d30:	89 45 08             	mov    %eax,0x8(%ebp)
}
     d33:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d36:	5b                   	pop    %ebx
     d37:	5e                   	pop    %esi
     d38:	5d                   	pop    %ebp
    thread_wakeup(m->wait_chan);
     d39:	e9 12 ff ff ff       	jmp    c50 <thread_wakeup>
     d3e:	66 90                	xchg   %ax,%ax

00000d40 <mutex_trylock>:

int mutex_trylock(mutex_t *m) {
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	53                   	push   %ebx
     d44:	83 ec 04             	sub    $0x4,%esp
     d47:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (m->locked) {
     d4a:	8b 03                	mov    (%ebx),%eax
     d4c:	85 c0                	test   %eax,%eax
     d4e:	74 10                	je     d60 <mutex_trylock+0x20>
    }
    
    m->locked = 1;
    m->owner = thread_self();
    return 1;
}
     d50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d53:	31 c0                	xor    %eax,%eax
     d55:	c9                   	leave
     d56:	c3                   	ret
     d57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d5e:	00 
     d5f:	90                   	nop
    m->locked = 1;
     d60:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
     d66:	e8 55 fc ff ff       	call   9c0 <thread_self>
     d6b:	89 43 04             	mov    %eax,0x4(%ebx)
    return 1;
     d6e:	b8 01 00 00 00       	mov    $0x1,%eax
}
     d73:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d76:	c9                   	leave
     d77:	c3                   	ret
     d78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d7f:	00 

00000d80 <cond_init>:

/* ========== 条件变量实现 ========== */

void cond_init(cond_t *c) {
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	8b 45 08             	mov    0x8(%ebp),%eax
    c->wait_chan = c;
     d86:	89 00                	mov    %eax,(%eax)
}
     d88:	5d                   	pop    %ebp
     d89:	c3                   	ret
     d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d90 <cond_wait>:

void cond_wait(cond_t *c, mutex_t *m) {
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	57                   	push   %edi
     d94:	56                   	push   %esi
     d95:	53                   	push   %ebx
     d96:	83 ec 0c             	sub    $0xc,%esp
     d99:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     d9c:	8b 7d 08             	mov    0x8(%ebp),%edi
    if (m->owner != thread_self()) {
     d9f:	8b 73 04             	mov    0x4(%ebx),%esi
     da2:	e8 19 fc ff ff       	call   9c0 <thread_self>
     da7:	39 c6                	cmp    %eax,%esi
     da9:	74 1d                	je     dc8 <cond_wait+0x38>
        printf(2, "[uthreads] 错误：cond_wait 时未持有 mutex\n");
     dab:	c7 45 0c 38 17 00 00 	movl   $0x1738,0xc(%ebp)
     db2:	c7 45 08 02 00 00 00 	movl   $0x2,0x8(%ebp)
    // 在条件变量上睡眠
    thread_sleep(c->wait_chan);
    
    // 被唤醒后重新获取 mutex
    mutex_lock(m);
}
     db9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dbc:	5b                   	pop    %ebx
     dbd:	5e                   	pop    %esi
     dbe:	5f                   	pop    %edi
     dbf:	5d                   	pop    %ebp
        printf(2, "[uthreads] 错误：cond_wait 时未持有 mutex\n");
     dc0:	e9 4b f7 ff ff       	jmp    510 <printf>
     dc5:	8d 76 00             	lea    0x0(%esi),%esi
    thread_wakeup(m->wait_chan);
     dc8:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
     dcb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    m->owner = -1;
     dd1:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
    thread_wakeup(m->wait_chan);
     dd8:	ff 73 08             	push   0x8(%ebx)
     ddb:	e8 70 fe ff ff       	call   c50 <thread_wakeup>
    thread_sleep(c->wait_chan);
     de0:	5a                   	pop    %edx
     de1:	ff 37                	push   (%edi)
     de3:	e8 48 fe ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
     de8:	8b 0b                	mov    (%ebx),%ecx
     dea:	83 c4 10             	add    $0x10,%esp
     ded:	85 c9                	test   %ecx,%ecx
     def:	74 1b                	je     e0c <cond_wait+0x7c>
     df1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
     df8:	83 ec 0c             	sub    $0xc,%esp
     dfb:	ff 73 08             	push   0x8(%ebx)
     dfe:	e8 2d fe ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
     e03:	8b 03                	mov    (%ebx),%eax
     e05:	83 c4 10             	add    $0x10,%esp
     e08:	85 c0                	test   %eax,%eax
     e0a:	75 ec                	jne    df8 <cond_wait+0x68>
    m->locked = 1;
     e0c:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    m->owner = thread_self();
     e12:	e8 a9 fb ff ff       	call   9c0 <thread_self>
     e17:	89 43 04             	mov    %eax,0x4(%ebx)
}
     e1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e1d:	5b                   	pop    %ebx
     e1e:	5e                   	pop    %esi
     e1f:	5f                   	pop    %edi
     e20:	5d                   	pop    %ebp
     e21:	c3                   	ret
     e22:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e29:	00 
     e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000e30 <cond_signal>:

void cond_signal(cond_t *c) {
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
    thread_wakeup(c->wait_chan);
     e33:	8b 45 08             	mov    0x8(%ebp),%eax
     e36:	8b 00                	mov    (%eax),%eax
     e38:	89 45 08             	mov    %eax,0x8(%ebp)
}
     e3b:	5d                   	pop    %ebp
    thread_wakeup(c->wait_chan);
     e3c:	e9 0f fe ff ff       	jmp    c50 <thread_wakeup>
     e41:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e48:	00 
     e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e50 <cond_broadcast>:

void cond_broadcast(cond_t *c) {
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	8b 45 08             	mov    0x8(%ebp),%eax
     e56:	8b 00                	mov    (%eax),%eax
     e58:	89 45 08             	mov    %eax,0x8(%ebp)
     e5b:	5d                   	pop    %ebp
     e5c:	e9 ef fd ff ff       	jmp    c50 <thread_wakeup>
     e61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e68:	00 
     e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e70 <channel_create>:
    thread_wakeup(c->wait_chan);
}

/* ========== Channel 实现 ========== */

channel_t *channel_create(int capacity) {
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	56                   	push   %esi
     e74:	53                   	push   %ebx
     e75:	8b 75 08             	mov    0x8(%ebp),%esi
    channel_t *ch;
    
    if (capacity <= 0) {
     e78:	85 f6                	test   %esi,%esi
     e7a:	0f 8e 90 00 00 00    	jle    f10 <channel_create+0xa0>
        printf(2, "[uthreads] 错误：channel 容量必须大于 0\n");
        return 0;
    }
    
    ch = (channel_t*)malloc(sizeof(channel_t));
     e80:	83 ec 0c             	sub    $0xc,%esp
     e83:	6a 2c                	push   $0x2c
     e85:	e8 a6 f8 ff ff       	call   730 <malloc>
    if (!ch) {
     e8a:	83 c4 10             	add    $0x10,%esp
    ch = (channel_t*)malloc(sizeof(channel_t));
     e8d:	89 c3                	mov    %eax,%ebx
    if (!ch) {
     e8f:	85 c0                	test   %eax,%eax
     e91:	0f 84 99 00 00 00    	je     f30 <channel_create+0xc0>
        printf(2, "[uthreads] 错误：channel 分配失败\n");
        return 0;
    }
    
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
     e97:	83 ec 0c             	sub    $0xc,%esp
     e9a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
     ea1:	50                   	push   %eax
     ea2:	e8 89 f8 ff ff       	call   730 <malloc>
    if (!ch->buffer) {
     ea7:	83 c4 10             	add    $0x10,%esp
    ch->buffer = (void**)malloc(sizeof(void*) * capacity);
     eaa:	89 03                	mov    %eax,(%ebx)
    if (!ch->buffer) {
     eac:	85 c0                	test   %eax,%eax
     eae:	0f 84 9c 00 00 00    	je     f50 <channel_create+0xe0>
    ch->count = 0;
    ch->read_idx = 0;
    ch->write_idx = 0;
    ch->is_closed = 0;
    
    mutex_init(&ch->lock);
     eb4:	8d 43 18             	lea    0x18(%ebx),%eax
    cond_init(&ch->not_empty);
    cond_init(&ch->not_full);
    
    printf(1, "[uthreads] Channel 创建成功，容量=%d\n", capacity);
     eb7:	83 ec 04             	sub    $0x4,%esp
    ch->capacity = capacity;
     eba:	89 73 04             	mov    %esi,0x4(%ebx)
    mutex_init(&ch->lock);
     ebd:	89 43 20             	mov    %eax,0x20(%ebx)
    cond_init(&ch->not_empty);
     ec0:	8d 43 24             	lea    0x24(%ebx),%eax
     ec3:	89 43 24             	mov    %eax,0x24(%ebx)
    cond_init(&ch->not_full);
     ec6:	8d 43 28             	lea    0x28(%ebx),%eax
    ch->count = 0;
     ec9:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    ch->read_idx = 0;
     ed0:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    ch->write_idx = 0;
     ed7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    ch->is_closed = 0;
     ede:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    m->locked = 0;
     ee5:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
     eec:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    cond_init(&ch->not_full);
     ef3:	89 43 28             	mov    %eax,0x28(%ebx)
    printf(1, "[uthreads] Channel 创建成功，容量=%d\n", capacity);
     ef6:	56                   	push   %esi
     ef7:	68 00 18 00 00       	push   $0x1800
     efc:	6a 01                	push   $0x1
     efe:	e8 0d f6 ff ff       	call   510 <printf>
    return ch;
     f03:	83 c4 10             	add    $0x10,%esp
}
     f06:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f09:	89 d8                	mov    %ebx,%eax
     f0b:	5b                   	pop    %ebx
     f0c:	5e                   	pop    %esi
     f0d:	5d                   	pop    %ebp
     f0e:	c3                   	ret
     f0f:	90                   	nop
        printf(2, "[uthreads] 错误：channel 容量必须大于 0\n");
     f10:	83 ec 08             	sub    $0x8,%esp
        return 0;
     f13:	31 db                	xor    %ebx,%ebx
        printf(2, "[uthreads] 错误：channel 容量必须大于 0\n");
     f15:	68 6c 17 00 00       	push   $0x176c
     f1a:	6a 02                	push   $0x2
     f1c:	e8 ef f5 ff ff       	call   510 <printf>
        return 0;
     f21:	83 c4 10             	add    $0x10,%esp
     f24:	eb e0                	jmp    f06 <channel_create+0x96>
     f26:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f2d:	00 
     f2e:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] 错误：channel 分配失败\n");
     f30:	83 ec 08             	sub    $0x8,%esp
        return 0;
     f33:	31 db                	xor    %ebx,%ebx
        printf(2, "[uthreads] 错误：channel 分配失败\n");
     f35:	68 a0 17 00 00       	push   $0x17a0
     f3a:	6a 02                	push   $0x2
     f3c:	e8 cf f5 ff ff       	call   510 <printf>
        return 0;
     f41:	83 c4 10             	add    $0x10,%esp
     f44:	eb c0                	jmp    f06 <channel_create+0x96>
     f46:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f4d:	00 
     f4e:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] 错误：channel 缓冲区分配失败\n");
     f50:	83 ec 08             	sub    $0x8,%esp
     f53:	68 cc 17 00 00       	push   $0x17cc
     f58:	6a 02                	push   $0x2
     f5a:	e8 b1 f5 ff ff       	call   510 <printf>
        free(ch);
     f5f:	89 1c 24             	mov    %ebx,(%esp)
        return 0;
     f62:	31 db                	xor    %ebx,%ebx
        free(ch);
     f64:	e8 37 f7 ff ff       	call   6a0 <free>
        return 0;
     f69:	83 c4 10             	add    $0x10,%esp
     f6c:	eb 98                	jmp    f06 <channel_create+0x96>
     f6e:	66 90                	xchg   %ax,%ax

00000f70 <channel_send>:

int channel_send(channel_t *ch, void *data) {
     f70:	55                   	push   %ebp
     f71:	89 e5                	mov    %esp,%ebp
     f73:	57                   	push   %edi
     f74:	56                   	push   %esi
     f75:	53                   	push   %ebx
     f76:	83 ec 0c             	sub    $0xc,%esp
     f79:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
     f7c:	8b 7b 18             	mov    0x18(%ebx),%edi
     f7f:	85 ff                	test   %edi,%edi
     f81:	74 1a                	je     f9d <channel_send+0x2d>
     f83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
     f88:	83 ec 0c             	sub    $0xc,%esp
     f8b:	ff 73 20             	push   0x20(%ebx)
     f8e:	e8 9d fc ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
     f93:	8b 73 18             	mov    0x18(%ebx),%esi
     f96:	83 c4 10             	add    $0x10,%esp
     f99:	85 f6                	test   %esi,%esi
     f9b:	75 eb                	jne    f88 <channel_send+0x18>
    m->locked = 1;
     f9d:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
     fa4:	e8 17 fa ff ff       	call   9c0 <thread_self>
    mutex_lock(&ch->lock);
    
    if (ch->is_closed) {
     fa9:	8b 73 14             	mov    0x14(%ebx),%esi
    m->owner = thread_self();
     fac:	89 43 1c             	mov    %eax,0x1c(%ebx)
     faf:	89 c7                	mov    %eax,%edi
    if (ch->is_closed) {
     fb1:	85 f6                	test   %esi,%esi
     fb3:	0f 85 56 01 00 00    	jne    110f <channel_send+0x19f>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    // 等待非满
    while (ch->count == ch->capacity && !ch->is_closed) {
     fb9:	8b 43 04             	mov    0x4(%ebx),%eax
     fbc:	39 43 08             	cmp    %eax,0x8(%ebx)
     fbf:	74 34                	je     ff5 <channel_send+0x85>
     fc1:	e9 9d 00 00 00       	jmp    1063 <channel_send+0xf3>
     fc6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     fcd:	00 
     fce:	66 90                	xchg   %ax,%ax
        printf(2, "[uthreads] 错误：cond_wait 时未持有 mutex\n");
     fd0:	83 ec 08             	sub    $0x8,%esp
     fd3:	68 38 17 00 00       	push   $0x1738
     fd8:	6a 02                	push   $0x2
     fda:	e8 31 f5 ff ff       	call   510 <printf>
        cond_wait(&ch->not_full, &ch->lock);
    }
    
    if (ch->is_closed) {
     fdf:	8b 43 14             	mov    0x14(%ebx),%eax
    while (ch->count == ch->capacity && !ch->is_closed) {
     fe2:	8b 4b 04             	mov    0x4(%ebx),%ecx
        return;
     fe5:	83 c4 10             	add    $0x10,%esp
    while (ch->count == ch->capacity && !ch->is_closed) {
     fe8:	39 4b 08             	cmp    %ecx,0x8(%ebx)
     feb:	75 72                	jne    105f <channel_send+0xef>
     fed:	85 c0                	test   %eax,%eax
     fef:	0f 85 eb 00 00 00    	jne    10e0 <channel_send+0x170>
    if (m->owner != thread_self()) {
     ff5:	8b 7b 1c             	mov    0x1c(%ebx),%edi
     ff8:	e8 c3 f9 ff ff       	call   9c0 <thread_self>
     ffd:	39 c7                	cmp    %eax,%edi
     fff:	75 cf                	jne    fd0 <channel_send+0x60>
    thread_wakeup(m->wait_chan);
    1001:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1004:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    100b:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1012:	ff 73 20             	push   0x20(%ebx)
    1015:	e8 36 fc ff ff       	call   c50 <thread_wakeup>
    thread_sleep(c->wait_chan);
    101a:	5a                   	pop    %edx
    101b:	ff 73 28             	push   0x28(%ebx)
    101e:	e8 0d fc ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
    1023:	8b 4b 18             	mov    0x18(%ebx),%ecx
    1026:	83 c4 10             	add    $0x10,%esp
    1029:	85 c9                	test   %ecx,%ecx
    102b:	74 18                	je     1045 <channel_send+0xd5>
    102d:	8d 76 00             	lea    0x0(%esi),%esi
        thread_sleep(m->wait_chan);
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 73 20             	push   0x20(%ebx)
    1036:	e8 f5 fb ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
    103b:	8b 43 18             	mov    0x18(%ebx),%eax
    103e:	83 c4 10             	add    $0x10,%esp
    1041:	85 c0                	test   %eax,%eax
    1043:	75 eb                	jne    1030 <channel_send+0xc0>
    m->locked = 1;
    1045:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    104c:	e8 6f f9 ff ff       	call   9c0 <thread_self>
    while (ch->count == ch->capacity && !ch->is_closed) {
    1051:	8b 4b 04             	mov    0x4(%ebx),%ecx
    m->owner = thread_self();
    1054:	89 43 1c             	mov    %eax,0x1c(%ebx)
    if (ch->is_closed) {
    1057:	8b 43 14             	mov    0x14(%ebx),%eax
    while (ch->count == ch->capacity && !ch->is_closed) {
    105a:	39 4b 08             	cmp    %ecx,0x8(%ebx)
    105d:	74 8e                	je     fed <channel_send+0x7d>
    if (ch->is_closed) {
    105f:	85 c0                	test   %eax,%eax
    1061:	75 7d                	jne    10e0 <channel_send+0x170>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    // 写入数据
    ch->buffer[ch->write_idx] = data;
    1063:	8b 53 10             	mov    0x10(%ebx),%edx
    1066:	8b 03                	mov    (%ebx),%eax
    thread_wakeup(c->wait_chan);
    1068:	83 ec 0c             	sub    $0xc,%esp
    ch->buffer[ch->write_idx] = data;
    106b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    106e:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    1071:	8b 43 10             	mov    0x10(%ebx),%eax
    ch->count++;
    1074:	83 43 08 01          	addl   $0x1,0x8(%ebx)
    ch->write_idx = (ch->write_idx + 1) % ch->capacity;
    1078:	83 c0 01             	add    $0x1,%eax
    107b:	99                   	cltd
    107c:	f7 7b 04             	idivl  0x4(%ebx)
    107f:	89 53 10             	mov    %edx,0x10(%ebx)
    thread_wakeup(c->wait_chan);
    1082:	ff 73 24             	push   0x24(%ebx)
    1085:	e8 c6 fb ff ff       	call   c50 <thread_wakeup>
    if (m->owner != thread_self()) {
    108a:	8b 7b 1c             	mov    0x1c(%ebx),%edi
    108d:	e8 2e f9 ff ff       	call   9c0 <thread_self>
    1092:	83 c4 10             	add    $0x10,%esp
    1095:	39 c7                	cmp    %eax,%edi
    1097:	75 27                	jne    10c0 <channel_send+0x150>
    thread_wakeup(m->wait_chan);
    1099:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    109c:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    10a3:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    10aa:	ff 73 20             	push   0x20(%ebx)
    10ad:	e8 9e fb ff ff       	call   c50 <thread_wakeup>
    10b2:	83 c4 10             	add    $0x10,%esp
    // 唤醒接收者
    cond_signal(&ch->not_empty);
    
    mutex_unlock(&ch->lock);
    return 0;
}
    10b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10b8:	89 f0                	mov    %esi,%eax
    10ba:	5b                   	pop    %ebx
    10bb:	5e                   	pop    %esi
    10bc:	5f                   	pop    %edi
    10bd:	5d                   	pop    %ebp
    10be:	c3                   	ret
    10bf:	90                   	nop
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    10c0:	83 ec 08             	sub    $0x8,%esp
    10c3:	68 00 17 00 00       	push   $0x1700
    10c8:	6a 02                	push   $0x2
    10ca:	e8 41 f4 ff ff       	call   510 <printf>
        return;
    10cf:	83 c4 10             	add    $0x10,%esp
}
    10d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10d5:	89 f0                	mov    %esi,%eax
    10d7:	5b                   	pop    %ebx
    10d8:	5e                   	pop    %esi
    10d9:	5f                   	pop    %edi
    10da:	5d                   	pop    %ebp
    10db:	c3                   	ret
    10dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (m->owner != thread_self()) {
    10e0:	8b 73 1c             	mov    0x1c(%ebx),%esi
    10e3:	e8 d8 f8 ff ff       	call   9c0 <thread_self>
    10e8:	39 c6                	cmp    %eax,%esi
    10ea:	75 2c                	jne    1118 <channel_send+0x1a8>
    thread_wakeup(m->wait_chan);
    10ec:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    10ef:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    10f6:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    10fd:	ff 73 20             	push   0x20(%ebx)
    1100:	e8 4b fb ff ff       	call   c50 <thread_wakeup>
    1105:	83 c4 10             	add    $0x10,%esp
        return -1;
    1108:	be ff ff ff ff       	mov    $0xffffffff,%esi
    110d:	eb a6                	jmp    10b5 <channel_send+0x145>
    if (m->owner != thread_self()) {
    110f:	e8 ac f8 ff ff       	call   9c0 <thread_self>
    1114:	39 c7                	cmp    %eax,%edi
    1116:	74 d4                	je     10ec <channel_send+0x17c>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    1118:	83 ec 08             	sub    $0x8,%esp
    111b:	68 00 17 00 00       	push   $0x1700
    1120:	6a 02                	push   $0x2
    1122:	e8 e9 f3 ff ff       	call   510 <printf>
        return;
    1127:	83 c4 10             	add    $0x10,%esp
    112a:	eb dc                	jmp    1108 <channel_send+0x198>
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001130 <channel_recv>:

int channel_recv(channel_t *ch, void **data) {
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	56                   	push   %esi
    1134:	53                   	push   %ebx
    1135:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    1138:	8b 43 18             	mov    0x18(%ebx),%eax
    113b:	85 c0                	test   %eax,%eax
    113d:	74 16                	je     1155 <channel_recv+0x25>
    113f:	90                   	nop
        thread_sleep(m->wait_chan);
    1140:	83 ec 0c             	sub    $0xc,%esp
    1143:	ff 73 20             	push   0x20(%ebx)
    1146:	e8 e5 fa ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
    114b:	8b 43 18             	mov    0x18(%ebx),%eax
    114e:	83 c4 10             	add    $0x10,%esp
    1151:	85 c0                	test   %eax,%eax
    1153:	75 eb                	jne    1140 <channel_recv+0x10>
    m->locked = 1;
    1155:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    115c:	e8 5f f8 ff ff       	call   9c0 <thread_self>
    1161:	89 43 1c             	mov    %eax,0x1c(%ebx)
    mutex_lock(&ch->lock);
    
    // 等待非空
    while (ch->count == 0 && !ch->is_closed) {
    1164:	8b 43 08             	mov    0x8(%ebx),%eax
    1167:	85 c0                	test   %eax,%eax
    1169:	74 1e                	je     1189 <channel_recv+0x59>
    116b:	e9 8b 00 00 00       	jmp    11fb <channel_recv+0xcb>
        printf(2, "[uthreads] 错误：cond_wait 时未持有 mutex\n");
    1170:	83 ec 08             	sub    $0x8,%esp
    1173:	68 38 17 00 00       	push   $0x1738
    1178:	6a 02                	push   $0x2
    117a:	e8 91 f3 ff ff       	call   510 <printf>
    while (ch->count == 0 && !ch->is_closed) {
    117f:	8b 53 08             	mov    0x8(%ebx),%edx
        return;
    1182:	83 c4 10             	add    $0x10,%esp
    while (ch->count == 0 && !ch->is_closed) {
    1185:	85 d2                	test   %edx,%edx
    1187:	75 72                	jne    11fb <channel_recv+0xcb>
    1189:	8b 43 14             	mov    0x14(%ebx),%eax
    if (m->owner != thread_self()) {
    118c:	8b 73 1c             	mov    0x1c(%ebx),%esi
    while (ch->count == 0 && !ch->is_closed) {
    118f:	85 c0                	test   %eax,%eax
    1191:	0f 85 d9 00 00 00    	jne    1270 <channel_recv+0x140>
    if (m->owner != thread_self()) {
    1197:	e8 24 f8 ff ff       	call   9c0 <thread_self>
    119c:	39 c6                	cmp    %eax,%esi
    119e:	75 d0                	jne    1170 <channel_recv+0x40>
    thread_wakeup(m->wait_chan);
    11a0:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    11a3:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    11aa:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    11b1:	ff 73 20             	push   0x20(%ebx)
    11b4:	e8 97 fa ff ff       	call   c50 <thread_wakeup>
    thread_sleep(c->wait_chan);
    11b9:	5e                   	pop    %esi
    11ba:	ff 73 24             	push   0x24(%ebx)
    11bd:	e8 6e fa ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
    11c2:	8b 43 18             	mov    0x18(%ebx),%eax
    11c5:	83 c4 10             	add    $0x10,%esp
    11c8:	85 c0                	test   %eax,%eax
    11ca:	74 19                	je     11e5 <channel_recv+0xb5>
    11cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(m->wait_chan);
    11d0:	83 ec 0c             	sub    $0xc,%esp
    11d3:	ff 73 20             	push   0x20(%ebx)
    11d6:	e8 55 fa ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
    11db:	8b 4b 18             	mov    0x18(%ebx),%ecx
    11de:	83 c4 10             	add    $0x10,%esp
    11e1:	85 c9                	test   %ecx,%ecx
    11e3:	75 eb                	jne    11d0 <channel_recv+0xa0>
    m->locked = 1;
    11e5:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    11ec:	e8 cf f7 ff ff       	call   9c0 <thread_self>
    while (ch->count == 0 && !ch->is_closed) {
    11f1:	8b 53 08             	mov    0x8(%ebx),%edx
    m->owner = thread_self();
    11f4:	89 43 1c             	mov    %eax,0x1c(%ebx)
    while (ch->count == 0 && !ch->is_closed) {
    11f7:	85 d2                	test   %edx,%edx
    11f9:	74 8e                	je     1189 <channel_recv+0x59>
        mutex_unlock(&ch->lock);
        return -1;
    }
    
    // 读取数据
    *data = ch->buffer[ch->read_idx];
    11fb:	8b 53 0c             	mov    0xc(%ebx),%edx
    11fe:	8b 03                	mov    (%ebx),%eax
    thread_wakeup(c->wait_chan);
    1200:	83 ec 0c             	sub    $0xc,%esp
    *data = ch->buffer[ch->read_idx];
    1203:	8b 14 90             	mov    (%eax,%edx,4),%edx
    1206:	8b 45 0c             	mov    0xc(%ebp),%eax
    1209:	89 10                	mov    %edx,(%eax)
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    120b:	8b 43 0c             	mov    0xc(%ebx),%eax
    ch->count--;
    120e:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
    ch->read_idx = (ch->read_idx + 1) % ch->capacity;
    1212:	83 c0 01             	add    $0x1,%eax
    1215:	99                   	cltd
    1216:	f7 7b 04             	idivl  0x4(%ebx)
    1219:	89 53 0c             	mov    %edx,0xc(%ebx)
    thread_wakeup(c->wait_chan);
    121c:	ff 73 28             	push   0x28(%ebx)
    121f:	e8 2c fa ff ff       	call   c50 <thread_wakeup>
    if (m->owner != thread_self()) {
    1224:	8b 73 1c             	mov    0x1c(%ebx),%esi
    1227:	e8 94 f7 ff ff       	call   9c0 <thread_self>
    122c:	83 c4 10             	add    $0x10,%esp
    122f:	39 c6                	cmp    %eax,%esi
    1231:	74 1d                	je     1250 <channel_recv+0x120>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    1233:	83 ec 08             	sub    $0x8,%esp
    1236:	68 00 17 00 00       	push   $0x1700
    123b:	6a 02                	push   $0x2
    123d:	e8 ce f2 ff ff       	call   510 <printf>
        return;
    1242:	83 c4 10             	add    $0x10,%esp
    
    // 唤醒发送者
    cond_signal(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    return 0;
    1245:	31 c0                	xor    %eax,%eax
}
    1247:	8d 65 f8             	lea    -0x8(%ebp),%esp
    124a:	5b                   	pop    %ebx
    124b:	5e                   	pop    %esi
    124c:	5d                   	pop    %ebp
    124d:	c3                   	ret
    124e:	66 90                	xchg   %ax,%ax
    thread_wakeup(m->wait_chan);
    1250:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1253:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    125a:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1261:	ff 73 20             	push   0x20(%ebx)
    1264:	e8 e7 f9 ff ff       	call   c50 <thread_wakeup>
    1269:	83 c4 10             	add    $0x10,%esp
    126c:	eb d7                	jmp    1245 <channel_recv+0x115>
    126e:	66 90                	xchg   %ax,%ax
    if (m->owner != thread_self()) {
    1270:	e8 4b f7 ff ff       	call   9c0 <thread_self>
    1275:	39 c6                	cmp    %eax,%esi
    1277:	74 19                	je     1292 <channel_recv+0x162>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    1279:	83 ec 08             	sub    $0x8,%esp
    127c:	68 00 17 00 00       	push   $0x1700
    1281:	6a 02                	push   $0x2
    1283:	e8 88 f2 ff ff       	call   510 <printf>
        return;
    1288:	83 c4 10             	add    $0x10,%esp
        return -1;
    128b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1290:	eb b5                	jmp    1247 <channel_recv+0x117>
    thread_wakeup(m->wait_chan);
    1292:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1295:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    129c:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    12a3:	ff 73 20             	push   0x20(%ebx)
    12a6:	e8 a5 f9 ff ff       	call   c50 <thread_wakeup>
    12ab:	83 c4 10             	add    $0x10,%esp
    12ae:	eb db                	jmp    128b <channel_recv+0x15b>

000012b0 <channel_close>:

void channel_close(channel_t *ch) {
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	56                   	push   %esi
    12b4:	53                   	push   %ebx
    12b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (m->locked) {
    12b8:	8b 4b 18             	mov    0x18(%ebx),%ecx
    12bb:	85 c9                	test   %ecx,%ecx
    12bd:	74 16                	je     12d5 <channel_close+0x25>
    12bf:	90                   	nop
        thread_sleep(m->wait_chan);
    12c0:	83 ec 0c             	sub    $0xc,%esp
    12c3:	ff 73 20             	push   0x20(%ebx)
    12c6:	e8 65 f9 ff ff       	call   c30 <thread_sleep>
    while (m->locked) {
    12cb:	8b 53 18             	mov    0x18(%ebx),%edx
    12ce:	83 c4 10             	add    $0x10,%esp
    12d1:	85 d2                	test   %edx,%edx
    12d3:	75 eb                	jne    12c0 <channel_close+0x10>
    m->locked = 1;
    12d5:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    m->owner = thread_self();
    12dc:	e8 df f6 ff ff       	call   9c0 <thread_self>
    thread_wakeup(c->wait_chan);
    12e1:	83 ec 0c             	sub    $0xc,%esp
    mutex_lock(&ch->lock);
    
    ch->is_closed = 1;
    12e4:	c7 43 14 01 00 00 00 	movl   $0x1,0x14(%ebx)
    m->owner = thread_self();
    12eb:	89 43 1c             	mov    %eax,0x1c(%ebx)
    thread_wakeup(c->wait_chan);
    12ee:	ff 73 24             	push   0x24(%ebx)
    12f1:	e8 5a f9 ff ff       	call   c50 <thread_wakeup>
    12f6:	58                   	pop    %eax
    12f7:	ff 73 28             	push   0x28(%ebx)
    12fa:	e8 51 f9 ff ff       	call   c50 <thread_wakeup>
    if (m->owner != thread_self()) {
    12ff:	8b 73 1c             	mov    0x1c(%ebx),%esi
    1302:	e8 b9 f6 ff ff       	call   9c0 <thread_self>
    1307:	83 c4 10             	add    $0x10,%esp
    130a:	39 c6                	cmp    %eax,%esi
    130c:	74 32                	je     1340 <channel_close+0x90>
        printf(2, "[uthreads] 错误：试图解锁不属于自己的锁\n");
    130e:	83 ec 08             	sub    $0x8,%esp
    1311:	68 00 17 00 00       	push   $0x1700
    1316:	6a 02                	push   $0x2
    1318:	e8 f3 f1 ff ff       	call   510 <printf>
        return;
    131d:	83 c4 10             	add    $0x10,%esp
    cond_broadcast(&ch->not_empty);
    cond_broadcast(&ch->not_full);
    
    mutex_unlock(&ch->lock);
    
    printf(1, "[uthreads] Channel 已关闭\n");
    1320:	83 ec 08             	sub    $0x8,%esp
    1323:	68 4c 14 00 00       	push   $0x144c
    1328:	6a 01                	push   $0x1
    132a:	e8 e1 f1 ff ff       	call   510 <printf>
}
    132f:	83 c4 10             	add    $0x10,%esp
    1332:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1335:	5b                   	pop    %ebx
    1336:	5e                   	pop    %esi
    1337:	5d                   	pop    %ebp
    1338:	c3                   	ret
    1339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    thread_wakeup(m->wait_chan);
    1340:	83 ec 0c             	sub    $0xc,%esp
    m->locked = 0;
    1343:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    m->owner = -1;
    134a:	c7 43 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%ebx)
    thread_wakeup(m->wait_chan);
    1351:	ff 73 20             	push   0x20(%ebx)
    1354:	e8 f7 f8 ff ff       	call   c50 <thread_wakeup>
    1359:	83 c4 10             	add    $0x10,%esp
    135c:	eb c2                	jmp    1320 <channel_close+0x70>
    135e:	66 90                	xchg   %ax,%ax

00001360 <channel_destroy>:

void channel_destroy(channel_t *ch) {
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	83 ec 04             	sub    $0x4,%esp
    1367:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (!ch)
    136a:	85 db                	test   %ebx,%ebx
    136c:	74 22                	je     1390 <channel_destroy+0x30>
        return;
    
    if (ch->buffer) {
    136e:	8b 03                	mov    (%ebx),%eax
    1370:	85 c0                	test   %eax,%eax
    1372:	74 0c                	je     1380 <channel_destroy+0x20>
        free(ch->buffer);
    1374:	83 ec 0c             	sub    $0xc,%esp
    1377:	50                   	push   %eax
    1378:	e8 23 f3 ff ff       	call   6a0 <free>
    137d:	83 c4 10             	add    $0x10,%esp
    }
    free(ch);
    1380:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    1383:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1386:	c9                   	leave
    free(ch);
    1387:	e9 14 f3 ff ff       	jmp    6a0 <free>
    138c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
    1390:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1393:	c9                   	leave
    1394:	c3                   	ret

00001395 <thread_switch>:

.text
.globl thread_switch
thread_switch:
    # 获取参数
    movl 4(%esp), %eax      # eax = old
    1395:	8b 44 24 04          	mov    0x4(%esp),%eax
    movl 8(%esp), %edx      # edx = new
    1399:	8b 54 24 08          	mov    0x8(%esp),%edx
    
    # 保存 old 的上下文
    movl %ebx, 4(%eax)      # 保存 ebx
    139d:	89 58 04             	mov    %ebx,0x4(%eax)
    movl %ecx, 8(%eax)      # 保存 ecx
    13a0:	89 48 08             	mov    %ecx,0x8(%eax)
    movl %esi, 16(%eax)     # 保存 esi
    13a3:	89 70 10             	mov    %esi,0x10(%eax)
    movl %edi, 20(%eax)     # 保存 edi
    13a6:	89 78 14             	mov    %edi,0x14(%eax)
    movl %ebp, 24(%eax)     # 保存 ebp
    13a9:	89 68 18             	mov    %ebp,0x18(%eax)
    movl %esp, 28(%eax)     # 保存 esp
    13ac:	89 60 1c             	mov    %esp,0x1c(%eax)
    
    # 保存返回地址 (eip)
    movl (%esp), %ecx
    13af:	8b 0c 24             	mov    (%esp),%ecx
    movl %ecx, 32(%eax)
    13b2:	89 48 20             	mov    %ecx,0x20(%eax)
    
    # 恢复 new 的上下文
    movl 4(%edx), %ebx      # 恢复 ebx
    13b5:	8b 5a 04             	mov    0x4(%edx),%ebx
    movl 8(%edx), %ecx      # 恢复 ecx
    13b8:	8b 4a 08             	mov    0x8(%edx),%ecx
    movl 16(%edx), %esi     # 恢复 esi
    13bb:	8b 72 10             	mov    0x10(%edx),%esi
    movl 20(%edx), %edi     # 恢复 edi
    13be:	8b 7a 14             	mov    0x14(%edx),%edi
    movl 24(%edx), %ebp     # 恢复 ebp
    13c1:	8b 6a 18             	mov    0x18(%edx),%ebp
    movl 28(%edx), %esp     # 恢复 esp
    13c4:	8b 62 1c             	mov    0x1c(%edx),%esp
    
    # 恢复 eip（返回地址）
    movl 32(%edx), %eax
    13c7:	8b 42 20             	mov    0x20(%edx),%eax
    movl %eax, (%esp)
    13ca:	89 04 24             	mov    %eax,(%esp)
    
    # 返回（跳转到新线程）
    ret
    13cd:	c3                   	ret
