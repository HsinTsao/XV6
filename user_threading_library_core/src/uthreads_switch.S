# uthreads_switch.S - x86 context switch for user-level threads
# void thread_switch(thread_context_t *old, thread_context_t *new)

.text
.globl thread_switch
thread_switch:
    # 获取参数
    movl 4(%esp), %eax      # eax = old
    movl 8(%esp), %edx      # edx = new
    
    # 保存 old 的上下文
    movl %ebx, 4(%eax)      # 保存 ebx
    movl %ecx, 8(%eax)      # 保存 ecx
    movl %esi, 16(%eax)     # 保存 esi
    movl %edi, 20(%eax)     # 保存 edi
    movl %ebp, 24(%eax)     # 保存 ebp
    movl %esp, 28(%eax)     # 保存 esp
    
    # 保存返回地址 (eip)
    movl (%esp), %ecx
    movl %ecx, 32(%eax)
    
    # 恢复 new 的上下文
    movl 4(%edx), %ebx      # 恢复 ebx
    movl 8(%edx), %ecx      # 恢复 ecx
    movl 16(%edx), %esi     # 恢复 esi
    movl 20(%edx), %edi     # 恢复 edi
    movl 24(%edx), %ebp     # 恢复 ebp
    movl 28(%edx), %esp     # 恢复 esp
    
    # 恢复 eip（返回地址）
    movl 32(%edx), %eax
    movl %eax, (%esp)
    
    # 返回（跳转到新线程）
    ret

