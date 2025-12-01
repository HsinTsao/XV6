.text
.globl thread_switch
thread_switch:
    movl 4(%esp), %eax
    movl 8(%esp), %edx
    
    movl %ebx, 4(%eax)
    movl %ecx, 8(%eax)
    movl %esi, 16(%eax)
    movl %edi, 20(%eax)
    movl %ebp, 24(%eax)
    movl %esp, 28(%eax)
    
    movl (%esp), %ecx
    movl %ecx, 32(%eax)
    
    movl 4(%edx), %ebx
    movl 8(%edx), %ecx
    movl 16(%edx), %esi
    movl 20(%edx), %edi
    movl 24(%edx), %ebp
    movl 28(%edx), %esp
    
    movl 32(%edx), %eax
    movl %eax, (%esp)
    
    ret
