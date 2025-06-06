extern __errno_location
section .text
    global ft_write

;rdi = fd, rsi = str, rdx = bytes 
ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl error
	ret

error:
	neg rax
	mov rcx, rax            ;rcx as tmp variable
	call __errno_location wrt ..plt
	mov [rax], rcx
	mov rax, -1
	ret
