	BITS 64
	section .text

	global rindex

rindex:
	push rbp
	mov rbp, rsp

	mov rdx, -1
	mov r8, -1

loop:
	add rdx, 1
	cmp BYTE[rdi + rdx], sil
	je occ
end_occ:
	cmp BYTE[rdi + rdx], 0
	jnz loop

inc_ptr:
	cmp r8, -1
	je ret_null
	cmp r8, 0
	je ret_first_char
	inc rdi
	sub r8, 1
	cmp r8, 0
	jnz inc_ptr

	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret

ret_null:
	mov rax, 0

	mov rsp, rbp
	pop rbp
	ret

ret_first_char:
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret

occ:
	mov r8, rdx
	jmp end_occ
