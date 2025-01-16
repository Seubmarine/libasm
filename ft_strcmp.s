BITS 64

SECTION .text
GLOBAL ft_strcmp

ft_strcmp:                  ; rdi = s1 ; rsi = s2
        xor     r8, r8      ; u64 i = 0
.loop:
        movzx   eax, BYTE [rdi+r8] ; u8 c1 = s1[i]
        movzx   ecx, BYTE [rsi+r8] ; u8 c2 = s2[i]
        test    eax, eax                  ; c1 != '\0' (only need to test 1)
        je      .end_of_string          ; 
        inc     r8                     ; i++
        cmp     al, cl                  ; c1 == c2
        je      .loop
.end_of_string:
        movzx   eax, al                 ; cast char to a int, 0 extend the rest of the register
        movzx   ecx, cl                 ; 
        sub     eax, ecx                ; c1 - c2 and return directly
        ret