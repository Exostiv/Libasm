section .text
global ft_strcmp

ft_strcmp:
.loop:
    mov al, [rdi]   ; Charger s1[i]
    mov bl, [rsi]   ; Charger s2[i]
    cmp al, bl      ; Comparer les caractères
    jne .not_equal  ; Si différents, on passe à la normalisation
    test al, al     ; Si al == 0 (fin de chaîne)
    je .equal       ; Les deux chaînes sont identiques, retourne 0
    inc rdi         ; Passer au caractère suivant de s1
    inc rsi         ; Passer au caractère suivant de s2
    jmp .loop       ; Continuer la boucle

.not_equal:
    movzx eax, al   ; Convertir en entier non signé (évite problèmes de signe)
    movzx ebx, bl   ; Idem pour ebx
    sub eax, ebx    ; eax = (s1[i] - s2[i])
    
    ; Normaliser le résultat à -1, 0 ou 1
    test eax, eax   ; Vérifie si eax == 0 (juste au cas où)
    jz .equal       ; Si eax == 0, retourne 0
    jl .return_neg  ; Si eax < 0, retourne -1
    mov eax, 1      ; Sinon, eax > 0 donc retourne 1
    ret

.return_neg:
    mov eax, -1     ; Retourne -1 si s1 < s2
    ret

.equal:
    xor eax, eax    ; eax = 0
    ret
