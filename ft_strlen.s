BITS 64 

SECTION .text
GLOBAL ft_strlen

ft_strlen:
    mov rax, 0              ; i = 0
loop:
    cmp byte [rdi + rax], 0 ; if (str[i] != 0)
    je ft_strlen_end
    add rax, 1              ; i++
    jmp loop                
ft_strlen_end:
    ret                     ; return i
