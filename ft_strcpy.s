section .text
global ft_strcpy

ft_strcpy:
    test rdi, rdi            ; Vérifier si dest NULL
    je .error
    test rsi, rsi            ; Vérifier si src NULL
    je .error
    mov rdx, rdi             ; Sauvegarder dest
.loop:
    mov al, [rsi]
    mov [rdi], al
    inc rdi
    inc rsi
    test al, al
    jne .loop
    mov rax, rdx             ; Retourner dest
    ret
.error:
    xor rax, rax
    ret
