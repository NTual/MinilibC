	BITS 64
	section .text

	global strpbrk

strpbrk:
	push rbp
	mov rbp, rsp

	mov r8, -1

loop:
	add r8, 1
	cmp BYTE[rdi + r8], 0
	je retnull
	mov r9, -1
	
semi_loop:
	add r9, 1
	cmp BYTE[rsi + r9], 0
	je loop
	mov r10b, BYTE[rsi + r9]
	cmp BYTE[rdi + r8], r10b
	jne semi_loop

end:
	xor r9, r9
loop_end:	
	cmp r9, r8
	je retend
	inc rdi
	add r9, 1
	jmp loop_end

retend:	
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

retnull:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret
