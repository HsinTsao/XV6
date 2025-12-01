# xv6 用户级线程库 (User Threading Library Core)

这是一个在 xv6 操作系统用户态实现的完整线程库。

## 📂 目录结构

```
user_threading_library_core/
├── src/                      # 核心库源代码
│   ├── uthreads.h           # 线程库头文件
│   ├── uthreads.c           # 线程管理实现
│   ├── uthreads_switch.S    # x86汇编上下文切换
│   └── uthreads_sync.c      # 同步原语实现
├── tests/                    # 测试程序
│   └── uthreads_test.c      # 基础功能测试
├── examples/                 # 示例程序
│   ├── producer_consumer.c  # 生产者消费者示例
│   └── reader_writer.c      # 写优先读写锁示例
├── README.md                 # 本文件
└── DESIGN.md                 # 详细设计文档
```

## ✨ 功能特性

### Part 1: 线程系统基础
- 线程创建、销毁、join、yield
- 手写 x86 汇编上下文切换
- Round-Robin 调度器
- Sleep/Wakeup 机制

### Part 2: 同步原语
- **Mutex** 互斥锁
- **Condition Variable** 条件变量
- **Channel** 消息通道（Go 语言风格）

### Part 3: 实际应用
- 生产者-消费者模式
- 写优先读写锁

## 🚀 编译和运行

### 1. 编译 xv6

```bash
cd /Users/HsinCao/Code/Test/final
make clean
make
```

### 2. 运行 xv6

```bash
make qemu-nox
```

### 3. 在 xv6 shell 中运行测试

```bash
# 基础功能测试
$ uthreads_test

# 生产者消费者示例
$ producer_consumer

# 读写锁示例
$ reader_writer
```

### 4. 退出 QEMU

按 `Ctrl+A`，然后按 `X`

## 📖 API 文档

### 线程管理

```c
void thread_init(void);                                    // 初始化线程库
int thread_create(void *(*start_routine)(void*), void *arg); // 创建线程
void thread_exit(void *retval);                           // 退出线程
void *thread_join(int tid);                               // 等待线程结束
void thread_yield(void);                                  // 主动让出CPU
int thread_self(void);                                    // 获取当前线程ID
```

### 互斥锁

```c
void mutex_init(mutex_t *m);       // 初始化
void mutex_lock(mutex_t *m);       // 加锁
void mutex_unlock(mutex_t *m);     // 解锁
int mutex_trylock(mutex_t *m);     // 尝试加锁
```

### 条件变量

```c
void cond_init(cond_t *c);                  // 初始化
void cond_wait(cond_t *c, mutex_t *m);     // 等待
void cond_signal(cond_t *c);               // 唤醒一个
void cond_broadcast(cond_t *c);            // 唤醒所有
```

### Channel

```c
channel_t *channel_create(int capacity);      // 创建
int channel_send(channel_t *ch, void *data);  // 发送
int channel_recv(channel_t *ch, void **data); // 接收
void channel_close(channel_t *ch);            // 关闭
void channel_destroy(channel_t *ch);          // 销毁
```

## 💡 使用示例

### 创建和运行线程

```c
#include "types.h"
#include "user.h"
#include "user_threading_library_core/src/uthreads.h"

void *my_thread(void *arg) {
    int id = (int)arg;
    printf(1, "线程 %d 正在运行\n", id);
    return (void*)(id * 10);
}

int main(void) {
    thread_init();
    
    int tid = thread_create(my_thread, (void*)42);
    void *ret = thread_join(tid);
    
    printf(1, "线程返回值: %d\n", (int)ret);
    exit();
}
```

## 🎯 技术亮点

1. ✨ **纯用户态实现** - 不依赖内核线程
2. ✨ **手写 x86 汇编** - 深入理解上下文切换
3. ✨ **完整同步原语** - mutex、cond、channel 齐全
4. ✨ **实际应用示例** - 解决真实并发问题
5. ✨ **x86 32位架构** - 满足作业要求

## 📝 设计文档

详细的设计文档请参阅 `DESIGN.md`，包含：
- 系统架构图
- 数据结构详解
- 核心算法流程
- 同步原语实现原理
- 汇编代码解析

## ⚙️ 架构说明

- **环境**: xv6 操作系统用户态
- **架构**: x86 (32位)
- **最大线程数**: 64
- **栈大小**: 4096 字节
- **调度算法**: Round-Robin

## 📊 项目统计

| 类别 | 文件数 | 代码行数（估计） |
|------|--------|------------------|
| 核心库 | 4 | ~700 行 |
| 测试程序 | 1 | ~60 行 |
| 示例程序 | 2 | ~340 行 |
| **总计** | **7** | **~1100 行** |

## 🎓 学习价值

本项目完整展示了：
- 用户级线程的实现原理
- x86 上下文切换的底层机制
- 同步原语的设计与实现
- 协作式调度算法
- 在真实操作系统（xv6）中运行

适合操作系统课程的大作业！

## 📄 许可证

基于 xv6 的 MIT 许可证。

---

**运行环境**: xv6 操作系统 (x86 32位)  
**编译器**: gcc -m32  
**模拟器**: QEMU

