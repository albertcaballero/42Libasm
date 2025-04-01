section .text
    global ft_list_push_front


	;rdi-> list / rsi -> new
	;[rdi] -> *data
	;[rdi + 8] -> *next
ft_list_push_front:
	mov [rsi+8], [rdi]
	mov [rdi], rsi
