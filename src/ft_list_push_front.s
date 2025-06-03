%include "struct.inc"
extern ft_list_create_elm

section .text
    global ft_list_push_front


;rdi-> list / rsi -> data
ft_list_push_front:
    test rdi, rdi
    jz finish

	push rdi
	mov rdi, rsi
	call ft_list_create_elm
	pop rdi

    test rax, rax
    jz finish

    mov rdx, [rdi]
	mov [rdi], rax
	mov [rax + t_list.next], rdx

finish:
    ret
