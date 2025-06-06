%include "struct.inc"
extern malloc
extern __errno_location

section .text
    global ft_list_create_elm


;rdi -> void *data
ft_list_create_elm:
	push rdi
	mov rdi, t_list_size                ; _size is ASM for sizeof (macro)
	call malloc wrt ..plt               ; rax = new node
	test rax,rax
	jz malloc_error
	pop rdi

	mov qword [rax + t_list.data], rdi      ; node.data = rdi (data)
	mov qword [rax + t_list.next], 0        ; node.next = NULL
	ret

malloc_error:
	neg rax
	mov rcx, rax
	call __errno_location wrt ..plt
	mov [rax], rcx
	mov rax, 0
	ret
