section .text
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy

ft_strdup:
    test rdi, rdi
    je .error
    push rdi
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc
    test rax, rax
    je .error
    pop rsi
    mov rdi, rax
    call ft_strcpy
    ret

.error:
    xor rax, rax
    ret
