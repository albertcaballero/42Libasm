extern __errno_location
section .text
    global ft_read

;rdi = fd, rsi = str, rdx = bytes 
ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jl error
	ret

error:
	neg rax
	mov rcx, rax
	call __errno_location wrt ..plt
	mov [rax], rcx
	mov rax, -1
	ret