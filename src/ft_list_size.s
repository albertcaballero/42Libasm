%include "struct.inc"

section .text
	global ft_list_size

;rdi -> t_list *begin_list
ft_list_size:
	xor rax,rax         ;rax = 0

loop:
    test rdi,rdi
	jz end_func
	inc rax
	mov rdi, [rdi+t_list.next] ;list = list->next
	jmp loop

end_func:
	ret
