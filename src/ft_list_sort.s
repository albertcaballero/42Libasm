%include "struct.inc"

section .text
    global ft_list_sort


;rdi-> t_list **begin / rsi -> int (*cmp)()
ft_list_sort:
	cmp rdi,0
	jz end_func
	call ft_list_size
	test rax,rax
	jz end_func

	call [rsi]	
	
end_func:
	ret
