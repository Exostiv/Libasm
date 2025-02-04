section .text
global ft_strcpy

ft_strcpy:
    mov rax, rdi            ; Sauvegarde l'adresse de destination (retour de la fonction)

.loop:
    mov dl, byte [rsi]      ; Charge un caractère de src
    mov byte [rdi], dl      ; Copie dans dest
    inc rsi                 ; Avance src
    inc rdi                 ; Avance dest
    test dl, dl             ; Vérifie si c’est '\0'
    jnz .loop               ; Si non, continuer la boucle

    ret                     ; Retourne dest (déjà stocké dans rax)
