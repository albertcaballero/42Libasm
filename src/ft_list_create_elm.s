%include "struct.inc"
extern malloc

section .text
    global ft_list_create_elm


ft_list_create_elm:
	push rdi
	mov rdi, t_list_size
	call malloc wrt ..plt
	test rax,rax
	je malloc_error
	pop rdi

	mov qword [rax + t_list.data], rdi
	mov qword [rax + t_list.next], 0
	ret

malloc_error:
	neg rax
	mov rcx, rax
	call __errno_location wrt ..plt
	mov [rax], rcx
	mov rax, 0
	ret
