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

    test rax, rax    ;check ft_list_create_elm (node) return
    jz finish

    mov rdx, [rdi]      ;tmp = *list
	mov [rdi], rax      ; *list = node
	mov [rax + t_list.next], rdx  ;node->next = tmp

finish:
    ret
