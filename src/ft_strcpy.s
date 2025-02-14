section .text
    global ft_strcpy

ft_strcpy:
    xor rax, rax 
;rdi = dst, rsi = src
loop:
	mov rdi + rax, [rsi + rax]
    cmp byte [rsi + rax], 0
    je finish
    inc rax
	jmp loop

finish:
	mov rax, rdi
    ret