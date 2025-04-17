section .text
    global ft_strcpy

ft_strcpy:
    xor rax,rax
;rdi = dst, rsi = src
loop:
	mov dl, [rsi + rax]
	mov [rdi + rax], dl
    cmp dl, 0
    je finish
    inc rax
	jmp loop

finish:
	mov rax, rdi
    ret
