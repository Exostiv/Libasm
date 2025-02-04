section .text
global ft_read
extern __errno_location

ft_read:
    mov rax, 0                 ; syscall number for read (0)
    syscall                    ; execute the syscall
    cmp rax, 0                 ; check if syscall failed (rax < 0)
    jl .error                  ; if less than 0, jump to error handling
    ret                        ; return normally

.error:
    neg rax                    ; rax = -rax (convert to positive errno)
    push rax                   ; save return value
    call __errno_location       ; get address of errno
    pop rdx                    ; restore error code
    mov [rax], edx             ; set errno = error code
    mov rax, -1                ; return -1
    ret
