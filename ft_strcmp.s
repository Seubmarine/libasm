BITS 64

SECTION .text
GLOBAL ft_strcmp

ft_strcmp:                  ; rdi = s1 ; rsi = s2
    cld                     ; clear direction flag to go from left to right
    L1:
    cmp byte [rdi], 0 ; if *s1 == '\0'
    je end
    cmp byte [rsi], 0 ; if *s2 == '\0'
    je end
    cmpsb ; while (*s1 == *s2); s1++ s2++;
    je L1 ; loop

    dec rdi                 ; s1--;
    dec rsi                 ; s2--;
    end:
    movzx rax, byte [rdi]   ; put *s1 into destination register for subsraction
    movzx rsi, byte [rsi]   ; s2 becom *s2
    sub rax, rsi             ; s1 - s2
    ret