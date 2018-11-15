section .data
    msg db      `hello, world!\n`

section .text
    global start

start:
    mov     rax, 0x2000004 ; era 1
    mov     rdi, 1
    mov     rsi, msg
    mov     rdx, 14
    syscall
    mov    rax, 0x2000001 ; era 60
    mov    rdi, 0
    syscall
