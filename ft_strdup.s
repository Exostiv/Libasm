section .text
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy

ft_strdup:
    push rdi                ; Sauvegarde src avant appel à ft_strlen
    mov rsi, rdi            ; Récupère src dans rsi
    call ft_strlen          ; rax = longueur de src
    inc rax                 ; Ajoute 1 pour '\0'

    mov rdi, rax            ; Prépare taille pour malloc
    call malloc             ; Alloue mémoire
    test rax, rax           ; Vérifie si malloc a échoué
    je .error               ; Si NULL, retourne 0

    pop rsi                 ; Restaure src
    mov rdi, rax            ; Prépare l'adresse de destination
    call ft_strcpy          ; Copie src dans dest

    ret                     ; Retourne l'adresse allouée

.error:
    xor rax, rax            ; Retourne NULL en cas d'erreur
    ret
