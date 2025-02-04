section .text
global ft_strlen

ft_strlen:
    test rdi, rdi            ; Vérifier si NULL
    je .return_zero          ; Retourner 0 si NULL
    xor rax, rax             ; Initialiser rax à 0
.loop:
    cmp byte [rdi + rax], 0  ; Vérifier si fin de chaîne
    je .done
    inc rax
    jmp .loop
.done:
    ret
.return_zero:
    xor rax, rax
    ret
