section .text
    global ft_strcmp

ft_strcmp:
    xor rax,rax

;rdi = s1, rsi = s2
loop:
    mov dl, [rsi]       ;dl = *rsi
    cmp byte [rdi], dl
    jne finish
    cmp byte [rdi], 0
    je finish
    inc rdi
    inc rsi
    jmp loop

finish:
    mov dl, [rdi]
    sub dl, [rsi]
    movsx rax, dl       ;movsx moves only 1 byte
    ret
