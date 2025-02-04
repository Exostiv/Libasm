section .text
global ft_write
extern __errno_location

ft_write:
    mov rax, 1                ; syscall number for write
    syscall
    cmp rax, 0                ; Vérifie si erreur (rax < 0)
    jl .error
    ret

.error:
    neg rax
    push rax
    call __errno_location
    pop rdx
    mov [rax], edx
    mov rax, -1
    ret