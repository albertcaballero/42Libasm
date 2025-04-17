%include "struct.inc"

section .text
	global ft_list_size

	;rdi = t_list *begin_list
ft_list_size:
	xor rax,rax

loop:
	cmp rdi,0
	je end_func
	inc rax
	mov rdi, [rdi+t_list.next]
	jmp loop

end_func:
	ret
