# xv6 用户级线程库设计文档

**项目**: User Threading Library Core  
**环境**: xv6 操作系统用户态  
**架构**: x86 (32位)  
**日期**: 2025年11月30日

---

## 1. 项目概述

本项目在 **xv6 操作系统**的**用户态**实现了一个功能完整的线程库。

### 1.1 设计目标

1. 完全用户态实现（不依赖内核线程）
2. 手写 x86 汇编上下文切换
3. Round-Robin 调度算法
4. 完整的同步原语（mutex、cond、channel）

### 1.2 关键特性

- ✅ 支持最多 64 个并发线程
- ✅ 协作式调度
- ✅ 基于 sleep/wakeup 的同步机制
- ✅ x86 32位架构

---

## 2. 系统架构

### 2.1 分层架构

```
┌─────────────────────────────────────┐
│  应用层 (tests/ + examples/)         │
│  - uthreads_test.c                  │
│  - producer_consumer.c              │
│  - reader_writer.c                  │
└──────────────┬──────────────────────┘
               │
┌──────────────┴──────────────────────┐
│  同步原语层 (uthreads_sync.c)        │
│  - Mutex                            │
│  - Condition Variable               │
│  - Channel                          │
└──────────────┬──────────────────────┘
               │
┌──────────────┴──────────────────────┐
│  线程核心层 (uthreads.c)             │
│  - thread_create/exit/join/yield   │
│  - thread_schedule                 │
│  - thread_sleep/wakeup             │
└──────────────┬──────────────────────┘
               │
┌──────────────┴──────────────────────┐
│  上下文切换层 (uthreads_switch.S)    │
│  - 保存/恢复 x86 32位寄存器          │
└─────────────────────────────────────┘
```

---

## 3. 核心数据结构

### 3.1 线程控制块 (TCB)

```c
typedef struct thread {
    int tid;                        // 线程ID (0-63)
    thread_state_t state;           // 线程状态
    void *stack;                    // 栈底指针 (malloc分配)
    thread_context_t context;       // CPU上下文
    void *(*start_routine)(void*);  // 线程函数
    void *arg;                      // 函数参数
    void *retval;                   // 返回值
    struct thread *join_waiter;     // 等待者
    void *sleep_chan;               // 睡眠通道
} thread_t;
```

### 3.2 线程状态

```c
typedef enum {
    T_UNUSED,       // 未使用
    T_RUNNABLE,     // 就绪态
    T_RUNNING,      // 运行态
    T_SLEEPING,     // 睡眠态
    T_ZOMBIE        // 僵尸态
} thread_state_t;
```

**状态转换图**:

```
T_UNUSED ──create──> T_RUNNABLE ──schedule──> T_RUNNING
                          ↑                        │
                          └────── yield ───────────┘
                                                   │
                                              sleep│
                                                   ↓
                                             T_SLEEPING
                                                   │
                                              wakeup│
                                                   ↓
                                             T_RUNNABLE

T_RUNNING ──exit──> T_ZOMBIE ──join──> T_UNUSED
```

### 3.3 CPU上下文 (x86 32位)

```c
typedef struct {
    uint eax, ebx, ecx, edx;   // 通用寄存器
    uint esi, edi;             // 索引寄存器
    uint ebp;                  // 栈基址指针
    uint esp;                  // 栈顶指针
    uint eip;                  // 指令指针
} thread_context_t;
```

---

## 4. 核心机制

### 4.1 线程创建

**流程**:
1. 查找 T_UNUSED 槽位
2. 分配 4KB 栈 (malloc)
3. 初始化栈顶，放置返回地址
4. 设置 esp 和 eip
5. 状态设为 T_RUNNABLE

**栈布局**:

```
高地址
┌──────────────┐
│   未使用      │  ← stack + 4096
├──────────────┤
│ thread_entry │  ← esp 指向这里
├──────────────┤
│   未使用      │
└──────────────┘
低地址 ← stack
```

### 4.2 上下文切换 (汇编)

```asm
thread_switch:
    movl 4(%esp), %eax      # eax = old
    movl 8(%esp), %edx      # edx = new
    
    # 保存 old 的寄存器
    movl %ebx, 4(%eax)
    movl %ecx, 8(%eax)
    movl %esi, 16(%eax)
    movl %edi, 20(%eax)
    movl %ebp, 24(%eax)
    movl %esp, 28(%eax)
    
    # 保存返回地址
    movl (%esp), %ecx
    movl %ecx, 32(%eax)
    
    # 恢复 new 的寄存器
    movl 4(%edx), %ebx
    movl 8(%edx), %ecx
    movl 16(%edx), %esi
    movl 20(%edx), %edi
    movl 24(%edx), %ebp
    movl 28(%edx), %esp     # 切换栈！
    
    # 恢复返回地址
    movl 32(%edx), %eax
    movl %eax, (%esp)
    
    ret                     # 跳转到新线程
```

### 4.3 调度器 (Round-Robin)

**算法**:
```
1. 从 (current_tid + 1) 开始循环查找
2. 找到第一个 T_RUNNABLE 线程
3. 更新状态：old → T_RUNNABLE, new → T_RUNNING
4. 调用 thread_switch()
```

### 4.4 Sleep/Wakeup

**sleep(chan)**:
- 设置 sleep_chan = chan
- 设置状态为 T_SLEEPING
- 调用 schedule()

**wakeup(chan)**:
- 遍历所有线程
- 唤醒所有 sleep_chan == chan 的线程

---

## 5. 同步原语

### 5.1 Mutex

```c
typedef struct {
    int locked;         // 0=未锁, 1=已锁
    int owner;          // 持有者tid
    void *wait_chan;    // 等待通道
} mutex_t;
```

**lock**: 循环检查，如果已锁则 sleep  
**unlock**: 解锁并 wakeup 等待者

### 5.2 Condition Variable

```c
typedef struct {
    void *wait_chan;
} cond_t;
```

**cond_wait(c, m)**:
1. 释放 mutex m
2. sleep 在 c 上
3. 被唤醒后重新获取 m

### 5.3 Channel

```c
typedef struct {
    void **buffer;          // 循环缓冲区
    int capacity;
    int count;
    int read_idx, write_idx;
    int is_closed;
    mutex_t lock;
    cond_t not_empty, not_full;
} channel_t;
```

**send**: 等待 not_full，写入，signal not_empty  
**recv**: 等待 not_empty，读取，signal not_full

---

## 6. 文件说明

### src/uthreads.h
- 所有类型定义和 API 声明
- 线程、mutex、cond、channel

### src/uthreads.c
- 线程管理核心实现
- 创建、销毁、调度、sleep/wakeup

### src/uthreads_switch.S
- x86 汇编上下文切换
- 保存/恢复寄存器

### src/uthreads_sync.c
- 同步原语实现
- mutex、cond、channel

### tests/uthreads_test.c
- 基础功能测试
- 验证 create、join、yield

### examples/producer_consumer.c
- 生产者-消费者模式
- 使用 channel 通信

### examples/reader_writer.c
- 写优先读写锁
- 使用 mutex + cond 实现

---

## 7. 使用方法

### 7.1 编译

```bash
cd final/
make clean
make
```

### 7.2 运行

```bash
make qemu-nox

# 在 xv6 shell 中:
$ uthreads_test
$ producer_consumer
$ reader_writer
```

---

## 8. 限制与改进

### 8.1 当前限制

1. 协作式调度 - 必须主动 yield
2. 无原子操作 - mutex 有轻微竞态
3. 固定栈大小 - 4KB
4. 最多 64 线程

### 8.2 可能改进

1. 抢占式调度 - 使用 timer 中断
2. 优先级调度
3. 动态栈
4. 原子操作

---

## 9. 参考资料

- xv6 操作系统源码 - MIT
- OSTEP (Operating Systems: Three Easy Pieces)
- Go 语言 channel 实现

---

## 10. 总结

本项目在 **xv6 用户态**实现了功能完整的线程库，展示了：
- 用户级线程原理
- x86 上下文切换机制
- 同步原语设计
- 协作式调度算法

是学习操作系统的绝佳实践项目！

