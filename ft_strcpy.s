BITS 64

SECTION .text
GLOBAL ft_strcpy

ft_strcpy:                  ; rdi = dest ; rsi = src
    mov rax, rdi            ; value to return is set to dest
    cld                     ; clear direction flag to go from left to right
    L1:
    movsb                   ; //copy byte from src to dest and increment their ptr
    cmp byte [rsi], 0       ; if (src[i] == 0)
    jne L1
    mov byte [rdi], 0
    ret