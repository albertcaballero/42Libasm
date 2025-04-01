extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

section .text
    global ft_strdup

ft_strdup:
	call ft_strlen
	push rdi
	inc rax
	mov rdi, rax
	call malloc wrt ..plt
	cmp rax, 0
	jl malloc_error

	pop rsi
	mov rdi, rax
	call ft_strcpy
	mov rax, rdi
	ret

malloc_error:
	neg rax
	mov rcx, rax
	call __errno_location wrt ..plt
	mov [rax], rcx
	mov rax, 0
	ret