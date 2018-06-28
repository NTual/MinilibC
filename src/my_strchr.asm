	BITS 64
	section .text

	global strchr

strchr:
	push rbp
	mov rbp, rsp

loop:
	add rdx, 1
	cmp BYTE[rdi], sil
	jz end
	cmp BYTE[rdi], 0
	jz retnull
	inc rdi
	jmp loop

end:
	mov rax, rdi
	
	mov rsp, rbp
	pop rbp
	ret

retnull:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret

ret_first_char:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
