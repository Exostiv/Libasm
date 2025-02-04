section .text
global ft_strcmp

ft_strcmp:
.loop:
    mov al, [rdi]
    mov bl, [rsi]
    cmp al, bl
    jne .not_equal
    test al, al
    je .equal
    inc rdi
    inc rsi
    jmp .loop

.not_equal:
    mov eax, 1
    jl .return_neg
    ret
.return_neg:
    mov eax, -1
    ret
.equal:
    xor eax, eax
    ret
