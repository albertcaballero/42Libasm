%include "struct.inc"
extern ft_list_create_elm

section .text
    global ft_list_push_front


;rdi-> list / rsi -> data
ft_list_push_front:
	push rdi
	mov rdi, rsi
	call ft_list_create_elm
	pop rdi

	mov qword [rax + t_list.next], [rdi]
	mov [rdi], rax
	ret
