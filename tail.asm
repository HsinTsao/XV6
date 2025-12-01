
_tail:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  exit();
}

/* ===== main ===== */

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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 11                	mov    (%ecx),%edx
  16:	8b 71 04             	mov    0x4(%ecx),%esi
  int n = 10;
  int ai = 1;

  // Handle "-N" form (e.g., -5 means -n 5)
  if (ai < argc && argv[ai][0] == '-' && argv[ai][1] != '\0' && argv[ai][1] != 'n') {
  19:	83 fa 01             	cmp    $0x1,%edx
  1c:	7e 6d                	jle    8b <main+0x8b>
  1e:	8b 5e 04             	mov    0x4(%esi),%ebx
  21:	80 3b 2d             	cmpb   $0x2d,(%ebx)
  24:	75 11                	jne    37 <main+0x37>
  26:	0f be 4b 01          	movsbl 0x1(%ebx),%ecx
  2a:	84 c9                	test   %cl,%cl
  2c:	74 09                	je     37 <main+0x37>
  2e:	80 f9 6e             	cmp    $0x6e,%cl
  31:	0f 85 16 01 00 00    	jne    14d <main+0x14d>
      if (c < '0' || c > '9') usage();
      val = val * 10 + (c - '0');
    }
    n = val;
    ai++;
  } else if (ai < argc && strcmp(argv[ai], "-n") == 0) {
  37:	51                   	push   %ecx
  38:	51                   	push   %ecx
  39:	68 dd 0c 00 00       	push   $0xcdd
  3e:	53                   	push   %ebx
  3f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  42:	e8 f9 05 00 00       	call   640 <strcmp>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  4d:	85 c0                	test   %eax,%eax
  4f:	75 4d                	jne    9e <main+0x9e>
    ai++;
    if (ai >= argc) usage();
  51:	83 fa 02             	cmp    $0x2,%edx
  54:	0f 84 20 01 00 00    	je     17a <main+0x17a>
    n = atoi(argv[ai]);
  5a:	83 ec 0c             	sub    $0xc,%esp
  5d:	ff 76 08             	push   0x8(%esi)
    ai++;
  60:	bf 03 00 00 00       	mov    $0x3,%edi
    n = atoi(argv[ai]);
  65:	e8 76 07 00 00       	call   7e0 <atoi>
    ai++;
  6a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    n = atoi(argv[ai]);
  6d:	83 c4 10             	add    $0x10,%esp
  }

  if (n < 0) {
  70:	85 c0                	test   %eax,%eax
  72:	0f 89 15 01 00 00    	jns    18d <main+0x18d>
    printf(2, "tail: N must be non-negative\n");
  78:	52                   	push   %edx
  79:	52                   	push   %edx
  7a:	68 e0 0c 00 00       	push   $0xce0
  7f:	6a 02                	push   $0x2
  81:	e8 3a 09 00 00       	call   9c0 <printf>
    exit();
  86:	e8 c8 07 00 00       	call   853 <exit>
  int n = 10;
  8b:	b8 0a 00 00 00       	mov    $0xa,%eax
  }

  int files = argc - ai;
  if (files <= 0) {
    // stdin
    tail_fd(0, n);
  90:	89 c2                	mov    %eax,%edx
  92:	31 c0                	xor    %eax,%eax
  94:	e8 d7 02 00 00       	call   370 <tail_fd>
    exit();
  99:	e8 b5 07 00 00       	call   853 <exit>
  int files = argc - ai;
  9e:	8d 42 ff             	lea    -0x1(%edx),%eax
  }

  int show_headers = (files > 1);
  for (int i = ai; i < argc; i++) {
  a1:	bf 01 00 00 00       	mov    $0x1,%edi
  int files = argc - ai;
  a6:	89 45 dc             	mov    %eax,-0x24(%ebp)
  int n = 10;
  a9:	b8 0a 00 00 00       	mov    $0xa,%eax
    if (show_headers) {
      printf(1, "==> %s <==\n", argv[i]);
    }
    tail_fd(fd, n);
    close(fd);
    if (show_headers && i < argc - 1) {
  ae:	8d 4a ff             	lea    -0x1(%edx),%ecx
  b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  b4:	89 fb                	mov    %edi,%ebx
  b6:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  b9:	89 55 e0             	mov    %edx,-0x20(%ebp)
  bc:	eb 1e                	jmp    dc <main+0xdc>
  be:	66 90                	xchg   %ax,%ax
    tail_fd(fd, n);
  c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  c3:	e8 a8 02 00 00       	call   370 <tail_fd>
    close(fd);
  c8:	83 ec 0c             	sub    $0xc,%esp
  cb:	57                   	push   %edi
  cc:	e8 aa 07 00 00       	call   87b <close>
  d1:	83 c4 10             	add    $0x10,%esp
  for (int i = ai; i < argc; i++) {
  d4:	83 c3 01             	add    $0x1,%ebx
  d7:	39 5d e0             	cmp    %ebx,-0x20(%ebp)
  da:	74 bd                	je     99 <main+0x99>
    int fd = open(argv[i], O_RDONLY);
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	6a 00                	push   $0x0
  e1:	ff 34 9e             	push   (%esi,%ebx,4)
  e4:	e8 aa 07 00 00       	call   893 <open>
    if (fd < 0) {
  e9:	83 c4 10             	add    $0x10,%esp
    int fd = open(argv[i], O_RDONLY);
  ec:	89 c7                	mov    %eax,%edi
    if (fd < 0) {
  ee:	85 c0                	test   %eax,%eax
  f0:	78 46                	js     138 <main+0x138>
    if (show_headers) {
  f2:	83 7d dc 01          	cmpl   $0x1,-0x24(%ebp)
  f6:	74 c8                	je     c0 <main+0xc0>
      printf(1, "==> %s <==\n", argv[i]);
  f8:	83 ec 04             	sub    $0x4,%esp
  fb:	ff 34 9e             	push   (%esi,%ebx,4)
  fe:	68 14 0d 00 00       	push   $0xd14
 103:	6a 01                	push   $0x1
 105:	e8 b6 08 00 00       	call   9c0 <printf>
    tail_fd(fd, n);
 10a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 10d:	89 f8                	mov    %edi,%eax
 10f:	e8 5c 02 00 00       	call   370 <tail_fd>
    close(fd);
 114:	89 3c 24             	mov    %edi,(%esp)
 117:	e8 5f 07 00 00       	call   87b <close>
    if (show_headers && i < argc - 1) {
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	39 5d d8             	cmp    %ebx,-0x28(%ebp)
 122:	7e b0                	jle    d4 <main+0xd4>
      printf(1, "\n");
 124:	83 ec 08             	sub    $0x8,%esp
 127:	68 1e 0d 00 00       	push   $0xd1e
 12c:	6a 01                	push   $0x1
 12e:	e8 8d 08 00 00       	call   9c0 <printf>
 133:	83 c4 10             	add    $0x10,%esp
 136:	eb 9c                	jmp    d4 <main+0xd4>
      printf(2, "tail: cannot open %s\n", argv[i]);
 138:	50                   	push   %eax
 139:	ff 34 9e             	push   (%esi,%ebx,4)
 13c:	68 fe 0c 00 00       	push   $0xcfe
 141:	6a 02                	push   $0x2
 143:	e8 78 08 00 00       	call   9c0 <printf>
      continue;
 148:	83 c4 10             	add    $0x10,%esp
 14b:	eb 87                	jmp    d4 <main+0xd4>
    while (argv[ai][k]) {
 14d:	83 c3 02             	add    $0x2,%ebx
    int k = 1, val = 0;
 150:	31 c0                	xor    %eax,%eax
 152:	89 d7                	mov    %edx,%edi
 154:	eb 1c                	jmp    172 <main+0x172>
 156:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 15d:	00 
 15e:	66 90                	xchg   %ax,%ax
      val = val * 10 + (c - '0');
 160:	8d 04 80             	lea    (%eax,%eax,4),%eax
    while (argv[ai][k]) {
 163:	83 c3 01             	add    $0x1,%ebx
      val = val * 10 + (c - '0');
 166:	8d 44 41 d0          	lea    -0x30(%ecx,%eax,2),%eax
    while (argv[ai][k]) {
 16a:	0f be 4b ff          	movsbl -0x1(%ebx),%ecx
 16e:	84 c9                	test   %cl,%cl
 170:	74 37                	je     1a9 <main+0x1a9>
      if (c < '0' || c > '9') usage();
 172:	8d 51 d0             	lea    -0x30(%ecx),%edx
 175:	80 fa 09             	cmp    $0x9,%dl
 178:	76 e6                	jbe    160 <main+0x160>
  printf(2, "usage: tail [-N] | [-n N] [file...]\n");
 17a:	53                   	push   %ebx
 17b:	53                   	push   %ebx
 17c:	68 28 0d 00 00       	push   $0xd28
 181:	6a 02                	push   $0x2
 183:	e8 38 08 00 00       	call   9c0 <printf>
  exit();
 188:	e8 c6 06 00 00       	call   853 <exit>
  int files = argc - ai;
 18d:	89 d1                	mov    %edx,%ecx
 18f:	29 f9                	sub    %edi,%ecx
 191:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  if (files <= 0) {
 194:	85 c9                	test   %ecx,%ecx
 196:	0f 8e f4 fe ff ff    	jle    90 <main+0x90>
  for (int i = ai; i < argc; i++) {
 19c:	39 d7                	cmp    %edx,%edi
 19e:	0f 8c 0a ff ff ff    	jl     ae <main+0xae>
 1a4:	e9 f0 fe ff ff       	jmp    99 <main+0x99>
    ai++;
 1a9:	89 fa                	mov    %edi,%edx
 1ab:	bf 02 00 00 00       	mov    $0x2,%edi
 1b0:	e9 bb fe ff ff       	jmp    70 <main+0x70>
 1b5:	66 90                	xchg   %ax,%ax
 1b7:	66 90                	xchg   %ax,%ax
 1b9:	66 90                	xchg   %ax,%ax
 1bb:	66 90                	xchg   %ax,%ax
 1bd:	66 90                	xchg   %ax,%ax
 1bf:	90                   	nop

000001c0 <die_oom>:
static void die_oom(void) {
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	83 ec 10             	sub    $0x10,%esp
  printf(2, "tail: out of memory\n");
 1c6:	68 c8 0c 00 00       	push   $0xcc8
 1cb:	6a 02                	push   $0x2
 1cd:	e8 ee 07 00 00       	call   9c0 <printf>
  exit();  // xv6 x86: exit() takes no arg
 1d2:	e8 7c 06 00 00       	call   853 <exit>
 1d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1de:	00 
 1df:	90                   	nop

000001e0 <b_reserve.constprop.0>:
static void b_reserve(Builder *b, int need) {
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	89 c6                	mov    %eax,%esi
 1e7:	53                   	push   %ebx
 1e8:	83 ec 0c             	sub    $0xc,%esp
  if (b->len + need < b->cap) return;
 1eb:	8b 40 08             	mov    0x8(%eax),%eax
 1ee:	8b 56 04             	mov    0x4(%esi),%edx
 1f1:	83 c0 01             	add    $0x1,%eax
 1f4:	39 d0                	cmp    %edx,%eax
 1f6:	7c 4e                	jl     246 <b_reserve.constprop.0+0x66>
  int newcap = b->cap == 0 ? 64 : b->cap * 2;
 1f8:	8d 1c 12             	lea    (%edx,%edx,1),%ebx
 1fb:	85 d2                	test   %edx,%edx
 1fd:	ba 40 00 00 00       	mov    $0x40,%edx
 202:	0f 44 da             	cmove  %edx,%ebx
  while (b->len + need >= newcap) newcap *= 2;
 205:	39 d8                	cmp    %ebx,%eax
 207:	7c 0d                	jl     216 <b_reserve.constprop.0+0x36>
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 210:	01 db                	add    %ebx,%ebx
 212:	39 d8                	cmp    %ebx,%eax
 214:	7d fa                	jge    210 <b_reserve.constprop.0+0x30>
  char *np = (char*)malloc(newcap);
 216:	83 ec 0c             	sub    $0xc,%esp
 219:	53                   	push   %ebx
 21a:	e8 c1 09 00 00       	call   be0 <malloc>
  if (!np) die_oom();
 21f:	83 c4 10             	add    $0x10,%esp
  char *np = (char*)malloc(newcap);
 222:	89 c7                	mov    %eax,%edi
  if (!np) die_oom();
 224:	85 c0                	test   %eax,%eax
 226:	74 3e                	je     266 <b_reserve.constprop.0+0x86>
  if (b->buf && b->len > 0) memmove(np, b->buf, b->len);
 228:	8b 06                	mov    (%esi),%eax
 22a:	85 c0                	test   %eax,%eax
 22c:	74 13                	je     241 <b_reserve.constprop.0+0x61>
 22e:	8b 56 08             	mov    0x8(%esi),%edx
 231:	85 d2                	test   %edx,%edx
 233:	7f 1b                	jg     250 <b_reserve.constprop.0+0x70>
  if (b->buf) free(b->buf);
 235:	83 ec 0c             	sub    $0xc,%esp
 238:	50                   	push   %eax
 239:	e8 12 09 00 00       	call   b50 <free>
 23e:	83 c4 10             	add    $0x10,%esp
  b->buf = np;
 241:	89 3e                	mov    %edi,(%esi)
  b->cap = newcap;
 243:	89 5e 04             	mov    %ebx,0x4(%esi)
}
 246:	8d 65 f4             	lea    -0xc(%ebp),%esp
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5f                   	pop    %edi
 24c:	5d                   	pop    %ebp
 24d:	c3                   	ret
 24e:	66 90                	xchg   %ax,%ax
  if (b->buf && b->len > 0) memmove(np, b->buf, b->len);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	52                   	push   %edx
 254:	50                   	push   %eax
 255:	57                   	push   %edi
 256:	e8 c5 05 00 00       	call   820 <memmove>
  if (b->buf) free(b->buf);
 25b:	8b 06                	mov    (%esi),%eax
 25d:	83 c4 10             	add    $0x10,%esp
 260:	85 c0                	test   %eax,%eax
 262:	74 dd                	je     241 <b_reserve.constprop.0+0x61>
 264:	eb cf                	jmp    235 <b_reserve.constprop.0+0x55>
  if (!np) die_oom();
 266:	e8 55 ff ff ff       	call   1c0 <die_oom>
 26b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000270 <b_finish_line>:
static void b_finish_line(Builder *b, LineRing *r) {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	89 d6                	mov    %edx,%esi
 277:	53                   	push   %ebx
 278:	89 c3                	mov    %eax,%ebx
 27a:	83 ec 1c             	sub    $0x1c,%esp
  if (b->len == 0 || b->buf[b->len - 1] != '\n') b_pushc(b, '\n');
 27d:	8b 78 08             	mov    0x8(%eax),%edi
 280:	85 ff                	test   %edi,%edi
 282:	74 09                	je     28d <b_finish_line+0x1d>
 284:	8b 08                	mov    (%eax),%ecx
 286:	80 7c 39 ff 0a       	cmpb   $0xa,-0x1(%ecx,%edi,1)
 28b:	74 1b                	je     2a8 <b_finish_line+0x38>
  b_reserve(b, 1);
 28d:	89 d8                	mov    %ebx,%eax
 28f:	e8 4c ff ff ff       	call   1e0 <b_reserve.constprop.0>
  b->buf[b->len++] = c;
 294:	8b 43 08             	mov    0x8(%ebx),%eax
 297:	8b 13                	mov    (%ebx),%edx
 299:	8d 48 01             	lea    0x1(%eax),%ecx
 29c:	89 4b 08             	mov    %ecx,0x8(%ebx)
 29f:	c6 04 02 0a          	movb   $0xa,(%edx,%eax,1)
  ring_push(r, b->buf, b->len);
 2a3:	8b 7b 08             	mov    0x8(%ebx),%edi
 2a6:	8b 0b                	mov    (%ebx),%ecx
  if (r->cap == 0) return;
 2a8:	8b 46 04             	mov    0x4(%esi),%eax
 2ab:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 2ae:	85 c0                	test   %eax,%eax
 2b0:	75 16                	jne    2c8 <b_finish_line+0x58>
  b->len = 0;
 2b2:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
}
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  char *p = (char*)malloc(len + 1);
 2c8:	83 ec 0c             	sub    $0xc,%esp
 2cb:	8d 47 01             	lea    0x1(%edi),%eax
 2ce:	50                   	push   %eax
 2cf:	e8 0c 09 00 00       	call   be0 <malloc>
  if (!p) die_oom();
 2d4:	83 c4 10             	add    $0x10,%esp
 2d7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 2da:	85 c0                	test   %eax,%eax
 2dc:	0f 84 85 00 00 00    	je     367 <b_finish_line+0xf7>
  memmove(p, line, len);
 2e2:	83 ec 04             	sub    $0x4,%esp
 2e5:	57                   	push   %edi
 2e6:	51                   	push   %ecx
 2e7:	50                   	push   %eax
 2e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2eb:	e8 30 05 00 00       	call   820 <memmove>
  p[len] = '\0';
 2f0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  if (r->count >= r->cap && r->lines[r->head]) {
 2f3:	83 c4 10             	add    $0x10,%esp
  p[len] = '\0';
 2f6:	c6 04 3a 00          	movb   $0x0,(%edx,%edi,1)
  if (r->count >= r->cap && r->lines[r->head]) {
 2fa:	8b 46 04             	mov    0x4(%esi),%eax
 2fd:	8b 4e 0c             	mov    0xc(%esi),%ecx
 300:	39 46 08             	cmp    %eax,0x8(%esi)
 303:	8b 06                	mov    (%esi),%eax
 305:	8d 04 88             	lea    (%eax,%ecx,4),%eax
 308:	7c 2c                	jl     336 <b_finish_line+0xc6>
 30a:	8b 08                	mov    (%eax),%ecx
 30c:	85 c9                	test   %ecx,%ecx
 30e:	74 26                	je     336 <b_finish_line+0xc6>
    free(r->lines[r->head]);
 310:	83 ec 0c             	sub    $0xc,%esp
 313:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 316:	51                   	push   %ecx
 317:	e8 34 08 00 00       	call   b50 <free>
    r->lines[r->head] = 0;
 31c:	8b 4e 0c             	mov    0xc(%esi),%ecx
 31f:	8b 06                	mov    (%esi),%eax
  r->lines[r->head] = p;
 321:	83 c4 10             	add    $0x10,%esp
 324:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    r->lines[r->head] = 0;
 327:	c7 04 88 00 00 00 00 	movl   $0x0,(%eax,%ecx,4)
  r->lines[r->head] = p;
 32e:	8b 4e 0c             	mov    0xc(%esi),%ecx
 331:	8b 06                	mov    (%esi),%eax
 333:	8d 04 88             	lea    (%eax,%ecx,4),%eax
 336:	89 10                	mov    %edx,(%eax)
  r->head = (r->head + 1) % r->cap;
 338:	8b 46 0c             	mov    0xc(%esi),%eax
 33b:	8b 4e 04             	mov    0x4(%esi),%ecx
 33e:	83 c0 01             	add    $0x1,%eax
 341:	99                   	cltd
 342:	f7 f9                	idiv   %ecx
  if (r->count < r->cap) r->count++;
 344:	8b 46 08             	mov    0x8(%esi),%eax
  r->head = (r->head + 1) % r->cap;
 347:	89 56 0c             	mov    %edx,0xc(%esi)
  if (r->count < r->cap) r->count++;
 34a:	39 c1                	cmp    %eax,%ecx
 34c:	0f 8e 60 ff ff ff    	jle    2b2 <b_finish_line+0x42>
 352:	83 c0 01             	add    $0x1,%eax
 355:	89 46 08             	mov    %eax,0x8(%esi)
  b->len = 0;
 358:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
}
 35f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 362:	5b                   	pop    %ebx
 363:	5e                   	pop    %esi
 364:	5f                   	pop    %edi
 365:	5d                   	pop    %ebp
 366:	c3                   	ret
  if (!p) die_oom();
 367:	e8 54 fe ff ff       	call   1c0 <die_oom>
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <tail_fd>:
static void tail_fd(int fd, int n) {
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
 37c:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
  r->cap = cap;
 382:	89 95 dc fd ff ff    	mov    %edx,-0x224(%ebp)
  r->count = 0;
 388:	c7 85 e0 fd ff ff 00 	movl   $0x0,-0x220(%ebp)
 38f:	00 00 00 
  r->head = 0;
 392:	c7 85 e4 fd ff ff 00 	movl   $0x0,-0x21c(%ebp)
 399:	00 00 00 
  if (cap > 0) {
 39c:	85 d2                	test   %edx,%edx
 39e:	0f 85 0c 02 00 00    	jne    5b0 <tail_fd+0x240>
    r->lines = 0;
 3a4:	c7 85 d8 fd ff ff 00 	movl   $0x0,-0x228(%ebp)
 3ab:	00 00 00 
  b->buf = 0;
 3ae:	c7 85 cc fd ff ff 00 	movl   $0x0,-0x234(%ebp)
 3b5:	00 00 00 
  b->cap = 0;
 3b8:	c7 85 d0 fd ff ff 00 	movl   $0x0,-0x230(%ebp)
 3bf:	00 00 00 
  b->len = 0;
 3c2:	c7 85 d4 fd ff ff 00 	movl   $0x0,-0x22c(%ebp)
 3c9:	00 00 00 
  while ((nread = read(fd, buf, sizeof(buf))) > 0) {
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d0:	83 ec 04             	sub    $0x4,%esp
 3d3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 3d9:	68 00 02 00 00       	push   $0x200
 3de:	50                   	push   %eax
 3df:	ff b5 c4 fd ff ff    	push   -0x23c(%ebp)
 3e5:	e8 81 04 00 00       	call   86b <read>
 3ea:	83 c4 10             	add    $0x10,%esp
 3ed:	85 c0                	test   %eax,%eax
 3ef:	7e 5f                	jle    450 <tail_fd+0xe0>
 3f1:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
 3f7:	89 de                	mov    %ebx,%esi
 3f9:	01 c6                	add    %eax,%esi
 3fb:	eb 0a                	jmp    407 <tail_fd+0x97>
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    for (int i = 0; i < nread; i++) {
 400:	83 c3 01             	add    $0x1,%ebx
 403:	39 f3                	cmp    %esi,%ebx
 405:	74 c9                	je     3d0 <tail_fd+0x60>
  b_reserve(b, 1);
 407:	8d 85 cc fd ff ff    	lea    -0x234(%ebp),%eax
      char c = buf[i];
 40d:	0f b6 3b             	movzbl (%ebx),%edi
  b_reserve(b, 1);
 410:	e8 cb fd ff ff       	call   1e0 <b_reserve.constprop.0>
  b->buf[b->len++] = c;
 415:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
 41b:	89 fa                	mov    %edi,%edx
 41d:	8d 48 01             	lea    0x1(%eax),%ecx
 420:	89 8d d4 fd ff ff    	mov    %ecx,-0x22c(%ebp)
 426:	8b 8d cc fd ff ff    	mov    -0x234(%ebp),%ecx
 42c:	88 14 01             	mov    %dl,(%ecx,%eax,1)
      if (c == '\n') {
 42f:	80 fa 0a             	cmp    $0xa,%dl
 432:	75 cc                	jne    400 <tail_fd+0x90>
        b_finish_line(&cur, &ring);
 434:	8d 95 d8 fd ff ff    	lea    -0x228(%ebp),%edx
 43a:	8d 85 cc fd ff ff    	lea    -0x234(%ebp),%eax
 440:	e8 2b fe ff ff       	call   270 <b_finish_line>
 445:	eb b9                	jmp    400 <tail_fd+0x90>
 447:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 44e:	00 
 44f:	90                   	nop
  if (cur.len > 0) {
 450:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
 456:	85 c0                	test   %eax,%eax
 458:	7e 11                	jle    46b <tail_fd+0xfb>
    b_finish_line(&cur, &ring);
 45a:	8d 95 d8 fd ff ff    	lea    -0x228(%ebp),%edx
 460:	8d 85 cc fd ff ff    	lea    -0x234(%ebp),%eax
 466:	e8 05 fe ff ff       	call   270 <b_finish_line>
  if (r->cap == 0 || r->count == 0) return;
 46b:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
  if (r->lines) {
 471:	8b 8d d8 fd ff ff    	mov    -0x228(%ebp),%ecx
  if (r->cap == 0 || r->count == 0) return;
 477:	85 f6                	test   %esi,%esi
 479:	74 73                	je     4ee <tail_fd+0x17e>
 47b:	8b bd e0 fd ff ff    	mov    -0x220(%ebp),%edi
 481:	85 ff                	test   %edi,%edi
 483:	74 69                	je     4ee <tail_fd+0x17e>
  int start = r->head - r->count;
 485:	8b 9d e4 fd ff ff    	mov    -0x21c(%ebp),%ebx
 48b:	29 fb                	sub    %edi,%ebx
  if (start < 0) start += r->cap;
 48d:	8d 04 33             	lea    (%ebx,%esi,1),%eax
 490:	0f 48 d8             	cmovs  %eax,%ebx
  for (int i = 0; i < r->count; i++) {
 493:	85 ff                	test   %edi,%edi
 495:	7e 57                	jle    4ee <tail_fd+0x17e>
 497:	89 b5 c0 fd ff ff    	mov    %esi,-0x240(%ebp)
 49d:	01 df                	add    %ebx,%edi
 49f:	89 ce                	mov    %ecx,%esi
 4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    int idx = (start + i) % r->cap;
 4a8:	89 d8                	mov    %ebx,%eax
 4aa:	99                   	cltd
 4ab:	f7 bd c0 fd ff ff    	idivl  -0x240(%ebp)
    if (r->lines[idx]) {
 4b1:	8d 14 96             	lea    (%esi,%edx,4),%edx
 4b4:	8b 02                	mov    (%edx),%eax
 4b6:	89 95 c4 fd ff ff    	mov    %edx,-0x23c(%ebp)
 4bc:	85 c0                	test   %eax,%eax
 4be:	74 1f                	je     4df <tail_fd+0x16f>
      write(1, r->lines[idx], strlen(r->lines[idx])); // stdout
 4c0:	83 ec 0c             	sub    $0xc,%esp
 4c3:	50                   	push   %eax
 4c4:	e8 d7 01 00 00       	call   6a0 <strlen>
 4c9:	83 c4 0c             	add    $0xc,%esp
 4cc:	50                   	push   %eax
 4cd:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
 4d3:	ff 32                	push   (%edx)
 4d5:	6a 01                	push   $0x1
 4d7:	e8 97 03 00 00       	call   873 <write>
 4dc:	83 c4 10             	add    $0x10,%esp
  for (int i = 0; i < r->count; i++) {
 4df:	83 c3 01             	add    $0x1,%ebx
 4e2:	39 fb                	cmp    %edi,%ebx
 4e4:	75 c2                	jne    4a8 <tail_fd+0x138>
 4e6:	89 f1                	mov    %esi,%ecx
 4e8:	8b b5 c0 fd ff ff    	mov    -0x240(%ebp),%esi
  if (b->buf) free(b->buf);
 4ee:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
 4f4:	85 c0                	test   %eax,%eax
 4f6:	74 18                	je     510 <tail_fd+0x1a0>
 4f8:	83 ec 0c             	sub    $0xc,%esp
 4fb:	89 8d c4 fd ff ff    	mov    %ecx,-0x23c(%ebp)
 501:	50                   	push   %eax
 502:	e8 49 06 00 00       	call   b50 <free>
 507:	8b 8d c4 fd ff ff    	mov    -0x23c(%ebp),%ecx
 50d:	83 c4 10             	add    $0x10,%esp
  b->buf = 0;
 510:	c7 85 cc fd ff ff 00 	movl   $0x0,-0x234(%ebp)
 517:	00 00 00 
  b->cap = b->len = 0;
 51a:	c7 85 d4 fd ff ff 00 	movl   $0x0,-0x22c(%ebp)
 521:	00 00 00 
 524:	c7 85 d0 fd ff ff 00 	movl   $0x0,-0x230(%ebp)
 52b:	00 00 00 
  if (r->lines) {
 52e:	85 c9                	test   %ecx,%ecx
 530:	74 76                	je     5a8 <tail_fd+0x238>
    int m = r->count < r->cap ? r->count : r->cap;
 532:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
 538:	39 c6                	cmp    %eax,%esi
 53a:	0f 4e c6             	cmovle %esi,%eax
    for (int i = 0; i < m; i++) {
 53d:	85 c0                	test   %eax,%eax
 53f:	7e 5b                	jle    59c <tail_fd+0x22c>
      int idx = (r->head - 1 - i);
 541:	8b bd e4 fd ff ff    	mov    -0x21c(%ebp),%edi
 547:	8d 5f ff             	lea    -0x1(%edi),%ebx
 54a:	89 df                	mov    %ebx,%edi
 54c:	29 c7                	sub    %eax,%edi
 54e:	89 bd c0 fd ff ff    	mov    %edi,-0x240(%ebp)
 554:	89 cf                	mov    %ecx,%edi
 556:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 55d:	00 
 55e:	66 90                	xchg   %ax,%ax
      if (idx < 0) idx += r->cap;
 560:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
 563:	85 db                	test   %ebx,%ebx
 565:	0f 49 c3             	cmovns %ebx,%eax
      if (r->lines[idx]) {
 568:	8d 04 87             	lea    (%edi,%eax,4),%eax
 56b:	8b 10                	mov    (%eax),%edx
 56d:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
 573:	85 d2                	test   %edx,%edx
 575:	74 18                	je     58f <tail_fd+0x21f>
        free(r->lines[idx]);
 577:	83 ec 0c             	sub    $0xc,%esp
 57a:	52                   	push   %edx
 57b:	e8 d0 05 00 00       	call   b50 <free>
        r->lines[idx] = 0;
 580:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
 586:	83 c4 10             	add    $0x10,%esp
 589:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    for (int i = 0; i < m; i++) {
 58f:	83 eb 01             	sub    $0x1,%ebx
 592:	39 9d c0 fd ff ff    	cmp    %ebx,-0x240(%ebp)
 598:	75 c6                	jne    560 <tail_fd+0x1f0>
 59a:	89 f9                	mov    %edi,%ecx
    free(r->lines);
 59c:	83 ec 0c             	sub    $0xc,%esp
 59f:	51                   	push   %ecx
 5a0:	e8 ab 05 00 00       	call   b50 <free>
 5a5:	83 c4 10             	add    $0x10,%esp
}
 5a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ab:	5b                   	pop    %ebx
 5ac:	5e                   	pop    %esi
 5ad:	5f                   	pop    %edi
 5ae:	5d                   	pop    %ebp
 5af:	c3                   	ret
    r->lines = (char**)malloc(sizeof(char*) * cap);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	8d 1c 95 00 00 00 00 	lea    0x0(,%edx,4),%ebx
 5ba:	53                   	push   %ebx
 5bb:	e8 20 06 00 00       	call   be0 <malloc>
    if (!r->lines) die_oom();
 5c0:	83 c4 10             	add    $0x10,%esp
    r->lines = (char**)malloc(sizeof(char*) * cap);
 5c3:	89 85 d8 fd ff ff    	mov    %eax,-0x228(%ebp)
    if (!r->lines) die_oom();
 5c9:	85 c0                	test   %eax,%eax
 5cb:	74 3c                	je     609 <tail_fd+0x299>
 5cd:	8d 14 18             	lea    (%eax,%ebx,1),%edx
 5d0:	83 e3 04             	and    $0x4,%ebx
 5d3:	74 1b                	je     5f0 <tail_fd+0x280>
    for (int i = 0; i < cap; i++) r->lines[i] = 0;
 5d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 5db:	83 c0 04             	add    $0x4,%eax
 5de:	39 d0                	cmp    %edx,%eax
 5e0:	0f 84 c8 fd ff ff    	je     3ae <tail_fd+0x3e>
 5e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ed:	00 
 5ee:	66 90                	xchg   %ax,%ax
 5f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 5f6:	83 c0 08             	add    $0x8,%eax
 5f9:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
 600:	39 d0                	cmp    %edx,%eax
 602:	75 ec                	jne    5f0 <tail_fd+0x280>
 604:	e9 a5 fd ff ff       	jmp    3ae <tail_fd+0x3e>
    if (!r->lines) die_oom();
 609:	e8 b2 fb ff ff       	call   1c0 <die_oom>
 60e:	66 90                	xchg   %ax,%ax

00000610 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 610:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 611:	31 c0                	xor    %eax,%eax
{
 613:	89 e5                	mov    %esp,%ebp
 615:	53                   	push   %ebx
 616:	8b 4d 08             	mov    0x8(%ebp),%ecx
 619:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 620:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 624:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 627:	83 c0 01             	add    $0x1,%eax
 62a:	84 d2                	test   %dl,%dl
 62c:	75 f2                	jne    620 <strcpy+0x10>
    ;
  return os;
}
 62e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 631:	89 c8                	mov    %ecx,%eax
 633:	c9                   	leave
 634:	c3                   	ret
 635:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 63c:	00 
 63d:	8d 76 00             	lea    0x0(%esi),%esi

00000640 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	53                   	push   %ebx
 644:	8b 55 08             	mov    0x8(%ebp),%edx
 647:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 64a:	0f b6 02             	movzbl (%edx),%eax
 64d:	84 c0                	test   %al,%al
 64f:	75 17                	jne    668 <strcmp+0x28>
 651:	eb 3a                	jmp    68d <strcmp+0x4d>
 653:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 658:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 65c:	83 c2 01             	add    $0x1,%edx
 65f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 662:	84 c0                	test   %al,%al
 664:	74 1a                	je     680 <strcmp+0x40>
 666:	89 d9                	mov    %ebx,%ecx
 668:	0f b6 19             	movzbl (%ecx),%ebx
 66b:	38 c3                	cmp    %al,%bl
 66d:	74 e9                	je     658 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 66f:	29 d8                	sub    %ebx,%eax
}
 671:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 674:	c9                   	leave
 675:	c3                   	ret
 676:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 67d:	00 
 67e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 680:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 684:	31 c0                	xor    %eax,%eax
 686:	29 d8                	sub    %ebx,%eax
}
 688:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 68b:	c9                   	leave
 68c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 68d:	0f b6 19             	movzbl (%ecx),%ebx
 690:	31 c0                	xor    %eax,%eax
 692:	eb db                	jmp    66f <strcmp+0x2f>
 694:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 69b:	00 
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006a0 <strlen>:

uint
strlen(const char *s)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 6a6:	80 3a 00             	cmpb   $0x0,(%edx)
 6a9:	74 15                	je     6c0 <strlen+0x20>
 6ab:	31 c0                	xor    %eax,%eax
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
 6b0:	83 c0 01             	add    $0x1,%eax
 6b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 6b7:	89 c1                	mov    %eax,%ecx
 6b9:	75 f5                	jne    6b0 <strlen+0x10>
    ;
  return n;
}
 6bb:	89 c8                	mov    %ecx,%eax
 6bd:	5d                   	pop    %ebp
 6be:	c3                   	ret
 6bf:	90                   	nop
  for(n = 0; s[n]; n++)
 6c0:	31 c9                	xor    %ecx,%ecx
}
 6c2:	5d                   	pop    %ebp
 6c3:	89 c8                	mov    %ecx,%eax
 6c5:	c3                   	ret
 6c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6cd:	00 
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 6d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6da:	8b 45 0c             	mov    0xc(%ebp),%eax
 6dd:	89 d7                	mov    %edx,%edi
 6df:	fc                   	cld
 6e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 6e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 6e5:	89 d0                	mov    %edx,%eax
 6e7:	c9                   	leave
 6e8:	c3                   	ret
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006f0 <strchr>:

char*
strchr(const char *s, char c)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 6fa:	0f b6 10             	movzbl (%eax),%edx
 6fd:	84 d2                	test   %dl,%dl
 6ff:	75 12                	jne    713 <strchr+0x23>
 701:	eb 1d                	jmp    720 <strchr+0x30>
 703:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 708:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 70c:	83 c0 01             	add    $0x1,%eax
 70f:	84 d2                	test   %dl,%dl
 711:	74 0d                	je     720 <strchr+0x30>
    if(*s == c)
 713:	38 d1                	cmp    %dl,%cl
 715:	75 f1                	jne    708 <strchr+0x18>
      return (char*)s;
  return 0;
}
 717:	5d                   	pop    %ebp
 718:	c3                   	ret
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 720:	31 c0                	xor    %eax,%eax
}
 722:	5d                   	pop    %ebp
 723:	c3                   	ret
 724:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 72b:	00 
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000730 <gets>:

char*
gets(char *buf, int max)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 735:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 738:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 739:	31 db                	xor    %ebx,%ebx
{
 73b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 73e:	eb 27                	jmp    767 <gets+0x37>
    cc = read(0, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	6a 01                	push   $0x1
 745:	56                   	push   %esi
 746:	6a 00                	push   $0x0
 748:	e8 1e 01 00 00       	call   86b <read>
    if(cc < 1)
 74d:	83 c4 10             	add    $0x10,%esp
 750:	85 c0                	test   %eax,%eax
 752:	7e 1d                	jle    771 <gets+0x41>
      break;
    buf[i++] = c;
 754:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 758:	8b 55 08             	mov    0x8(%ebp),%edx
 75b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 75f:	3c 0a                	cmp    $0xa,%al
 761:	74 10                	je     773 <gets+0x43>
 763:	3c 0d                	cmp    $0xd,%al
 765:	74 0c                	je     773 <gets+0x43>
  for(i=0; i+1 < max; ){
 767:	89 df                	mov    %ebx,%edi
 769:	83 c3 01             	add    $0x1,%ebx
 76c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 76f:	7c cf                	jl     740 <gets+0x10>
 771:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 773:	8b 45 08             	mov    0x8(%ebp),%eax
 776:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 77a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 77d:	5b                   	pop    %ebx
 77e:	5e                   	pop    %esi
 77f:	5f                   	pop    %edi
 780:	5d                   	pop    %ebp
 781:	c3                   	ret
 782:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 789:	00 
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000790 <stat>:

int
stat(const char *n, struct stat *st)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	56                   	push   %esi
 794:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 795:	83 ec 08             	sub    $0x8,%esp
 798:	6a 00                	push   $0x0
 79a:	ff 75 08             	push   0x8(%ebp)
 79d:	e8 f1 00 00 00       	call   893 <open>
  if(fd < 0)
 7a2:	83 c4 10             	add    $0x10,%esp
 7a5:	85 c0                	test   %eax,%eax
 7a7:	78 27                	js     7d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 7a9:	83 ec 08             	sub    $0x8,%esp
 7ac:	ff 75 0c             	push   0xc(%ebp)
 7af:	89 c3                	mov    %eax,%ebx
 7b1:	50                   	push   %eax
 7b2:	e8 f4 00 00 00       	call   8ab <fstat>
  close(fd);
 7b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 7ba:	89 c6                	mov    %eax,%esi
  close(fd);
 7bc:	e8 ba 00 00 00       	call   87b <close>
  return r;
 7c1:	83 c4 10             	add    $0x10,%esp
}
 7c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 7c7:	89 f0                	mov    %esi,%eax
 7c9:	5b                   	pop    %ebx
 7ca:	5e                   	pop    %esi
 7cb:	5d                   	pop    %ebp
 7cc:	c3                   	ret
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 7d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 7d5:	eb ed                	jmp    7c4 <stat+0x34>
 7d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7de:	00 
 7df:	90                   	nop

000007e0 <atoi>:

int
atoi(const char *s)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	53                   	push   %ebx
 7e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 7e7:	0f be 02             	movsbl (%edx),%eax
 7ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 7ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 7f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 7f5:	77 1e                	ja     815 <atoi+0x35>
 7f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7fe:	00 
 7ff:	90                   	nop
    n = n*10 + *s++ - '0';
 800:	83 c2 01             	add    $0x1,%edx
 803:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 806:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 80a:	0f be 02             	movsbl (%edx),%eax
 80d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 810:	80 fb 09             	cmp    $0x9,%bl
 813:	76 eb                	jbe    800 <atoi+0x20>
  return n;
}
 815:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 818:	89 c8                	mov    %ecx,%eax
 81a:	c9                   	leave
 81b:	c3                   	ret
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000820 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	8b 45 10             	mov    0x10(%ebp),%eax
 827:	8b 55 08             	mov    0x8(%ebp),%edx
 82a:	56                   	push   %esi
 82b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 82e:	85 c0                	test   %eax,%eax
 830:	7e 13                	jle    845 <memmove+0x25>
 832:	01 d0                	add    %edx,%eax
  dst = vdst;
 834:	89 d7                	mov    %edx,%edi
 836:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 83d:	00 
 83e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 840:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 841:	39 f8                	cmp    %edi,%eax
 843:	75 fb                	jne    840 <memmove+0x20>
  return vdst;
}
 845:	5e                   	pop    %esi
 846:	89 d0                	mov    %edx,%eax
 848:	5f                   	pop    %edi
 849:	5d                   	pop    %ebp
 84a:	c3                   	ret

0000084b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 84b:	b8 01 00 00 00       	mov    $0x1,%eax
 850:	cd 40                	int    $0x40
 852:	c3                   	ret

00000853 <exit>:
SYSCALL(exit)
 853:	b8 02 00 00 00       	mov    $0x2,%eax
 858:	cd 40                	int    $0x40
 85a:	c3                   	ret

0000085b <wait>:
SYSCALL(wait)
 85b:	b8 03 00 00 00       	mov    $0x3,%eax
 860:	cd 40                	int    $0x40
 862:	c3                   	ret

00000863 <pipe>:
SYSCALL(pipe)
 863:	b8 04 00 00 00       	mov    $0x4,%eax
 868:	cd 40                	int    $0x40
 86a:	c3                   	ret

0000086b <read>:
SYSCALL(read)
 86b:	b8 05 00 00 00       	mov    $0x5,%eax
 870:	cd 40                	int    $0x40
 872:	c3                   	ret

00000873 <write>:
SYSCALL(write)
 873:	b8 10 00 00 00       	mov    $0x10,%eax
 878:	cd 40                	int    $0x40
 87a:	c3                   	ret

0000087b <close>:
SYSCALL(close)
 87b:	b8 15 00 00 00       	mov    $0x15,%eax
 880:	cd 40                	int    $0x40
 882:	c3                   	ret

00000883 <kill>:
SYSCALL(kill)
 883:	b8 06 00 00 00       	mov    $0x6,%eax
 888:	cd 40                	int    $0x40
 88a:	c3                   	ret

0000088b <exec>:
SYSCALL(exec)
 88b:	b8 07 00 00 00       	mov    $0x7,%eax
 890:	cd 40                	int    $0x40
 892:	c3                   	ret

00000893 <open>:
SYSCALL(open)
 893:	b8 0f 00 00 00       	mov    $0xf,%eax
 898:	cd 40                	int    $0x40
 89a:	c3                   	ret

0000089b <mknod>:
SYSCALL(mknod)
 89b:	b8 11 00 00 00       	mov    $0x11,%eax
 8a0:	cd 40                	int    $0x40
 8a2:	c3                   	ret

000008a3 <unlink>:
SYSCALL(unlink)
 8a3:	b8 12 00 00 00       	mov    $0x12,%eax
 8a8:	cd 40                	int    $0x40
 8aa:	c3                   	ret

000008ab <fstat>:
SYSCALL(fstat)
 8ab:	b8 08 00 00 00       	mov    $0x8,%eax
 8b0:	cd 40                	int    $0x40
 8b2:	c3                   	ret

000008b3 <link>:
SYSCALL(link)
 8b3:	b8 13 00 00 00       	mov    $0x13,%eax
 8b8:	cd 40                	int    $0x40
 8ba:	c3                   	ret

000008bb <mkdir>:
SYSCALL(mkdir)
 8bb:	b8 14 00 00 00       	mov    $0x14,%eax
 8c0:	cd 40                	int    $0x40
 8c2:	c3                   	ret

000008c3 <chdir>:
SYSCALL(chdir)
 8c3:	b8 09 00 00 00       	mov    $0x9,%eax
 8c8:	cd 40                	int    $0x40
 8ca:	c3                   	ret

000008cb <dup>:
SYSCALL(dup)
 8cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 8d0:	cd 40                	int    $0x40
 8d2:	c3                   	ret

000008d3 <getpid>:
SYSCALL(getpid)
 8d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 8d8:	cd 40                	int    $0x40
 8da:	c3                   	ret

000008db <sbrk>:
SYSCALL(sbrk)
 8db:	b8 0c 00 00 00       	mov    $0xc,%eax
 8e0:	cd 40                	int    $0x40
 8e2:	c3                   	ret

000008e3 <sleep>:
SYSCALL(sleep)
 8e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 8e8:	cd 40                	int    $0x40
 8ea:	c3                   	ret

000008eb <uptime>:
SYSCALL(uptime)
 8eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 8f0:	cd 40                	int    $0x40
 8f2:	c3                   	ret

000008f3 <getnice>:
SYSCALL(getnice)
 8f3:	b8 16 00 00 00       	mov    $0x16,%eax
 8f8:	cd 40                	int    $0x40
 8fa:	c3                   	ret

000008fb <lock>:
SYSCALL(lock)
 8fb:	b8 17 00 00 00       	mov    $0x17,%eax
 900:	cd 40                	int    $0x40
 902:	c3                   	ret

00000903 <release>:
SYSCALL(release)
 903:	b8 18 00 00 00       	mov    $0x18,%eax
 908:	cd 40                	int    $0x40
 90a:	c3                   	ret

0000090b <setnice>:
SYSCALL(setnice)
 90b:	b8 19 00 00 00       	mov    $0x19,%eax
 910:	cd 40                	int    $0x40
 912:	c3                   	ret
 913:	66 90                	xchg   %ax,%ax
 915:	66 90                	xchg   %ax,%ax
 917:	66 90                	xchg   %ax,%ax
 919:	66 90                	xchg   %ax,%ax
 91b:	66 90                	xchg   %ax,%ax
 91d:	66 90                	xchg   %ax,%ax
 91f:	90                   	nop

00000920 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
 924:	56                   	push   %esi
 925:	53                   	push   %ebx
 926:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 928:	89 d1                	mov    %edx,%ecx
{
 92a:	83 ec 3c             	sub    $0x3c,%esp
 92d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 930:	85 d2                	test   %edx,%edx
 932:	0f 89 80 00 00 00    	jns    9b8 <printint+0x98>
 938:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 93c:	74 7a                	je     9b8 <printint+0x98>
    x = -xx;
 93e:	f7 d9                	neg    %ecx
    neg = 1;
 940:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 945:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 948:	31 f6                	xor    %esi,%esi
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 950:	89 c8                	mov    %ecx,%eax
 952:	31 d2                	xor    %edx,%edx
 954:	89 f7                	mov    %esi,%edi
 956:	f7 f3                	div    %ebx
 958:	8d 76 01             	lea    0x1(%esi),%esi
 95b:	0f b6 92 a8 0d 00 00 	movzbl 0xda8(%edx),%edx
 962:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 966:	89 ca                	mov    %ecx,%edx
 968:	89 c1                	mov    %eax,%ecx
 96a:	39 da                	cmp    %ebx,%edx
 96c:	73 e2                	jae    950 <printint+0x30>
  if(neg)
 96e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 971:	85 c0                	test   %eax,%eax
 973:	74 07                	je     97c <printint+0x5c>
    buf[i++] = '-';
 975:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 97a:	89 f7                	mov    %esi,%edi
 97c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 97f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 982:	01 df                	add    %ebx,%edi
 984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 988:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 98b:	83 ec 04             	sub    $0x4,%esp
 98e:	88 45 d7             	mov    %al,-0x29(%ebp)
 991:	8d 45 d7             	lea    -0x29(%ebp),%eax
 994:	6a 01                	push   $0x1
 996:	50                   	push   %eax
 997:	56                   	push   %esi
 998:	e8 d6 fe ff ff       	call   873 <write>
  while(--i >= 0)
 99d:	89 f8                	mov    %edi,%eax
 99f:	83 c4 10             	add    $0x10,%esp
 9a2:	83 ef 01             	sub    $0x1,%edi
 9a5:	39 c3                	cmp    %eax,%ebx
 9a7:	75 df                	jne    988 <printint+0x68>
}
 9a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9ac:	5b                   	pop    %ebx
 9ad:	5e                   	pop    %esi
 9ae:	5f                   	pop    %edi
 9af:	5d                   	pop    %ebp
 9b0:	c3                   	ret
 9b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 9b8:	31 c0                	xor    %eax,%eax
 9ba:	eb 89                	jmp    945 <printint+0x25>
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	57                   	push   %edi
 9c4:	56                   	push   %esi
 9c5:	53                   	push   %ebx
 9c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9c9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 9cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 9cf:	0f b6 1e             	movzbl (%esi),%ebx
 9d2:	83 c6 01             	add    $0x1,%esi
 9d5:	84 db                	test   %bl,%bl
 9d7:	74 67                	je     a40 <printf+0x80>
 9d9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 9dc:	31 d2                	xor    %edx,%edx
 9de:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 9e1:	eb 34                	jmp    a17 <printf+0x57>
 9e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 9e8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 9eb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 9f0:	83 f8 25             	cmp    $0x25,%eax
 9f3:	74 18                	je     a0d <printf+0x4d>
  write(fd, &c, 1);
 9f5:	83 ec 04             	sub    $0x4,%esp
 9f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 9fb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 9fe:	6a 01                	push   $0x1
 a00:	50                   	push   %eax
 a01:	57                   	push   %edi
 a02:	e8 6c fe ff ff       	call   873 <write>
 a07:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 a0a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a0d:	0f b6 1e             	movzbl (%esi),%ebx
 a10:	83 c6 01             	add    $0x1,%esi
 a13:	84 db                	test   %bl,%bl
 a15:	74 29                	je     a40 <printf+0x80>
    c = fmt[i] & 0xff;
 a17:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 a1a:	85 d2                	test   %edx,%edx
 a1c:	74 ca                	je     9e8 <printf+0x28>
      }
    } else if(state == '%'){
 a1e:	83 fa 25             	cmp    $0x25,%edx
 a21:	75 ea                	jne    a0d <printf+0x4d>
      if(c == 'd'){
 a23:	83 f8 25             	cmp    $0x25,%eax
 a26:	0f 84 04 01 00 00    	je     b30 <printf+0x170>
 a2c:	83 e8 63             	sub    $0x63,%eax
 a2f:	83 f8 15             	cmp    $0x15,%eax
 a32:	77 1c                	ja     a50 <printf+0x90>
 a34:	ff 24 85 50 0d 00 00 	jmp    *0xd50(,%eax,4)
 a3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 a40:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a43:	5b                   	pop    %ebx
 a44:	5e                   	pop    %esi
 a45:	5f                   	pop    %edi
 a46:	5d                   	pop    %ebp
 a47:	c3                   	ret
 a48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a4f:	00 
  write(fd, &c, 1);
 a50:	83 ec 04             	sub    $0x4,%esp
 a53:	8d 55 e7             	lea    -0x19(%ebp),%edx
 a56:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a5a:	6a 01                	push   $0x1
 a5c:	52                   	push   %edx
 a5d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 a60:	57                   	push   %edi
 a61:	e8 0d fe ff ff       	call   873 <write>
 a66:	83 c4 0c             	add    $0xc,%esp
 a69:	88 5d e7             	mov    %bl,-0x19(%ebp)
 a6c:	6a 01                	push   $0x1
 a6e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 a71:	52                   	push   %edx
 a72:	57                   	push   %edi
 a73:	e8 fb fd ff ff       	call   873 <write>
        putc(fd, c);
 a78:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a7b:	31 d2                	xor    %edx,%edx
 a7d:	eb 8e                	jmp    a0d <printf+0x4d>
 a7f:	90                   	nop
        printint(fd, *ap, 16, 0);
 a80:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 a83:	83 ec 0c             	sub    $0xc,%esp
 a86:	b9 10 00 00 00       	mov    $0x10,%ecx
 a8b:	8b 13                	mov    (%ebx),%edx
 a8d:	6a 00                	push   $0x0
 a8f:	89 f8                	mov    %edi,%eax
        ap++;
 a91:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 a94:	e8 87 fe ff ff       	call   920 <printint>
        ap++;
 a99:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 a9c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a9f:	31 d2                	xor    %edx,%edx
 aa1:	e9 67 ff ff ff       	jmp    a0d <printf+0x4d>
        s = (char*)*ap;
 aa6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 aa9:	8b 18                	mov    (%eax),%ebx
        ap++;
 aab:	83 c0 04             	add    $0x4,%eax
 aae:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 ab1:	85 db                	test   %ebx,%ebx
 ab3:	0f 84 87 00 00 00    	je     b40 <printf+0x180>
        while(*s != 0){
 ab9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 abc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 abe:	84 c0                	test   %al,%al
 ac0:	0f 84 47 ff ff ff    	je     a0d <printf+0x4d>
 ac6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 ac9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 acc:	89 de                	mov    %ebx,%esi
 ace:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 ad0:	83 ec 04             	sub    $0x4,%esp
 ad3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 ad6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 ad9:	6a 01                	push   $0x1
 adb:	53                   	push   %ebx
 adc:	57                   	push   %edi
 add:	e8 91 fd ff ff       	call   873 <write>
        while(*s != 0){
 ae2:	0f b6 06             	movzbl (%esi),%eax
 ae5:	83 c4 10             	add    $0x10,%esp
 ae8:	84 c0                	test   %al,%al
 aea:	75 e4                	jne    ad0 <printf+0x110>
      state = 0;
 aec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 aef:	31 d2                	xor    %edx,%edx
 af1:	e9 17 ff ff ff       	jmp    a0d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 af6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 af9:	83 ec 0c             	sub    $0xc,%esp
 afc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 b01:	8b 13                	mov    (%ebx),%edx
 b03:	6a 01                	push   $0x1
 b05:	eb 88                	jmp    a8f <printf+0xcf>
        putc(fd, *ap);
 b07:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 b0a:	83 ec 04             	sub    $0x4,%esp
 b0d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 b10:	8b 03                	mov    (%ebx),%eax
        ap++;
 b12:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 b15:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 b18:	6a 01                	push   $0x1
 b1a:	52                   	push   %edx
 b1b:	57                   	push   %edi
 b1c:	e8 52 fd ff ff       	call   873 <write>
        ap++;
 b21:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 b24:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b27:	31 d2                	xor    %edx,%edx
 b29:	e9 df fe ff ff       	jmp    a0d <printf+0x4d>
 b2e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 b30:	83 ec 04             	sub    $0x4,%esp
 b33:	88 5d e7             	mov    %bl,-0x19(%ebp)
 b36:	8d 55 e7             	lea    -0x19(%ebp),%edx
 b39:	6a 01                	push   $0x1
 b3b:	e9 31 ff ff ff       	jmp    a71 <printf+0xb1>
 b40:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 b45:	bb 20 0d 00 00       	mov    $0xd20,%ebx
 b4a:	e9 77 ff ff ff       	jmp    ac6 <printf+0x106>
 b4f:	90                   	nop

00000b50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b50:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b51:	a1 0c 11 00 00       	mov    0x110c,%eax
{
 b56:	89 e5                	mov    %esp,%ebp
 b58:	57                   	push   %edi
 b59:	56                   	push   %esi
 b5a:	53                   	push   %ebx
 b5b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 b5e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b68:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b6a:	39 c8                	cmp    %ecx,%eax
 b6c:	73 32                	jae    ba0 <free+0x50>
 b6e:	39 d1                	cmp    %edx,%ecx
 b70:	72 04                	jb     b76 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b72:	39 d0                	cmp    %edx,%eax
 b74:	72 32                	jb     ba8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b76:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b79:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b7c:	39 fa                	cmp    %edi,%edx
 b7e:	74 30                	je     bb0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 b80:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 b83:	8b 50 04             	mov    0x4(%eax),%edx
 b86:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b89:	39 f1                	cmp    %esi,%ecx
 b8b:	74 3a                	je     bc7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 b8d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 b8f:	5b                   	pop    %ebx
  freep = p;
 b90:	a3 0c 11 00 00       	mov    %eax,0x110c
}
 b95:	5e                   	pop    %esi
 b96:	5f                   	pop    %edi
 b97:	5d                   	pop    %ebp
 b98:	c3                   	ret
 b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ba0:	39 d0                	cmp    %edx,%eax
 ba2:	72 04                	jb     ba8 <free+0x58>
 ba4:	39 d1                	cmp    %edx,%ecx
 ba6:	72 ce                	jb     b76 <free+0x26>
{
 ba8:	89 d0                	mov    %edx,%eax
 baa:	eb bc                	jmp    b68 <free+0x18>
 bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 bb0:	03 72 04             	add    0x4(%edx),%esi
 bb3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 bb6:	8b 10                	mov    (%eax),%edx
 bb8:	8b 12                	mov    (%edx),%edx
 bba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bbd:	8b 50 04             	mov    0x4(%eax),%edx
 bc0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bc3:	39 f1                	cmp    %esi,%ecx
 bc5:	75 c6                	jne    b8d <free+0x3d>
    p->s.size += bp->s.size;
 bc7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 bca:	a3 0c 11 00 00       	mov    %eax,0x110c
    p->s.size += bp->s.size;
 bcf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 bd2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 bd5:	89 08                	mov    %ecx,(%eax)
}
 bd7:	5b                   	pop    %ebx
 bd8:	5e                   	pop    %esi
 bd9:	5f                   	pop    %edi
 bda:	5d                   	pop    %ebp
 bdb:	c3                   	ret
 bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000be0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 be0:	55                   	push   %ebp
 be1:	89 e5                	mov    %esp,%ebp
 be3:	57                   	push   %edi
 be4:	56                   	push   %esi
 be5:	53                   	push   %ebx
 be6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 be9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bec:	8b 15 0c 11 00 00    	mov    0x110c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bf2:	8d 78 07             	lea    0x7(%eax),%edi
 bf5:	c1 ef 03             	shr    $0x3,%edi
 bf8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 bfb:	85 d2                	test   %edx,%edx
 bfd:	0f 84 8d 00 00 00    	je     c90 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c03:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 c05:	8b 48 04             	mov    0x4(%eax),%ecx
 c08:	39 f9                	cmp    %edi,%ecx
 c0a:	73 64                	jae    c70 <malloc+0x90>
  if(nu < 4096)
 c0c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c11:	39 df                	cmp    %ebx,%edi
 c13:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 c16:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 c1d:	eb 0a                	jmp    c29 <malloc+0x49>
 c1f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c20:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 c22:	8b 48 04             	mov    0x4(%eax),%ecx
 c25:	39 f9                	cmp    %edi,%ecx
 c27:	73 47                	jae    c70 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c29:	89 c2                	mov    %eax,%edx
 c2b:	3b 05 0c 11 00 00    	cmp    0x110c,%eax
 c31:	75 ed                	jne    c20 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 c33:	83 ec 0c             	sub    $0xc,%esp
 c36:	56                   	push   %esi
 c37:	e8 9f fc ff ff       	call   8db <sbrk>
  if(p == (char*)-1)
 c3c:	83 c4 10             	add    $0x10,%esp
 c3f:	83 f8 ff             	cmp    $0xffffffff,%eax
 c42:	74 1c                	je     c60 <malloc+0x80>
  hp->s.size = nu;
 c44:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c47:	83 ec 0c             	sub    $0xc,%esp
 c4a:	83 c0 08             	add    $0x8,%eax
 c4d:	50                   	push   %eax
 c4e:	e8 fd fe ff ff       	call   b50 <free>
  return freep;
 c53:	8b 15 0c 11 00 00    	mov    0x110c,%edx
      if((p = morecore(nunits)) == 0)
 c59:	83 c4 10             	add    $0x10,%esp
 c5c:	85 d2                	test   %edx,%edx
 c5e:	75 c0                	jne    c20 <malloc+0x40>
        return 0;
  }
}
 c60:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c63:	31 c0                	xor    %eax,%eax
}
 c65:	5b                   	pop    %ebx
 c66:	5e                   	pop    %esi
 c67:	5f                   	pop    %edi
 c68:	5d                   	pop    %ebp
 c69:	c3                   	ret
 c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 c70:	39 cf                	cmp    %ecx,%edi
 c72:	74 4c                	je     cc0 <malloc+0xe0>
        p->s.size -= nunits;
 c74:	29 f9                	sub    %edi,%ecx
 c76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 c79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 c7c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 c7f:	89 15 0c 11 00 00    	mov    %edx,0x110c
}
 c85:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c88:	83 c0 08             	add    $0x8,%eax
}
 c8b:	5b                   	pop    %ebx
 c8c:	5e                   	pop    %esi
 c8d:	5f                   	pop    %edi
 c8e:	5d                   	pop    %ebp
 c8f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 c90:	c7 05 0c 11 00 00 10 	movl   $0x1110,0x110c
 c97:	11 00 00 
    base.s.size = 0;
 c9a:	b8 10 11 00 00       	mov    $0x1110,%eax
    base.s.ptr = freep = prevp = &base;
 c9f:	c7 05 10 11 00 00 10 	movl   $0x1110,0x1110
 ca6:	11 00 00 
    base.s.size = 0;
 ca9:	c7 05 14 11 00 00 00 	movl   $0x0,0x1114
 cb0:	00 00 00 
    if(p->s.size >= nunits){
 cb3:	e9 54 ff ff ff       	jmp    c0c <malloc+0x2c>
 cb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 cbf:	00 
        prevp->s.ptr = p->s.ptr;
 cc0:	8b 08                	mov    (%eax),%ecx
 cc2:	89 0a                	mov    %ecx,(%edx)
 cc4:	eb b9                	jmp    c7f <malloc+0x9f>
