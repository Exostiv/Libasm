section .text
global ft_strlen

ft_strlen:
    xor rax, rax            ; Rax = 0, compteur de caractères
.loop:
    cmp byte [rdi + rax], 0 ; Compare chaque caractère avec '\0'
    je .done                ; Si '\0', on sort
    inc rax                 ; Incrémente le compteur
    jmp .loop               ; Répète la boucle
.done:
    ret                     ; Retourne la longueur
