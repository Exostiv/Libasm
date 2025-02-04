section .text
global ft_write
extern __errno_location

ft_write:
    mov rax, 1          ; syscall write
    syscall
    cmp rax, 0
    jge done            ; Si pas d'erreur, on retourne normalement

    ; En cas d'erreur, récupérer errno via PLT
    neg rax             ; rax = -errno
    ; Appel indirect à __errno_location via PLT
    mov rdi, [rel __errno_location]
    call rdi            ; Appel indirect via PLT
    mov [rax], rdi      ; errno = rdi

done:
    ret
