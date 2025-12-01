# Threading Library for xv6

Threading library running on xv6. Includes threads, mutexes, condition variables, and channels.

## Directory Structure

```
user_threading_library_core/
├── src/
│   ├── uthreads.h          - Header file
│   ├── uthreads.c          - Thread management
│   ├── uthreads_switch.S   - x86 context switch (assembly)
│   └── uthreads_sync.c     - Mutex, condition variables, channels
├── tests/
│   └── uthreads_test.c     - Basic test
├── examples/
│   ├── producer_consumer.c - Producer-consumer example
│   └── reader_writer.c     - Reader-writer lock example
└── DESIGN.md               - Design documentation
└── README.md               - This Doc

```

## Build and Run

```bash
make clean
make
make qemu-nox
```

In xv6 shell:

```bash
$ uthreads_test
```

Exit QEMU: `Ctrl+A` then `X`

## What's Inside

- Thread create/exit/join/yield
- x86 assembly context switching
- Round-robin scheduler
- Mutexes
- Condition variables
- Channels (Go-style)

## Documentation

All design details are in `DESIGN.md`.


