	BITS 64
	section .text

	global strcspn

strcspn:
	push rbp
	mov rbp, rsp

	mov rax, -1

loop:
	add rax, 1
	cmp BYTE[rdi + rax], 0
	je retend
	mov r9, -1
	
semi_loop:
	add r9, 1
	cmp BYTE[rsi + r9], 0
	je loop
	mov r10b, BYTE[rsi + r9]
	cmp BYTE[rdi + rax], r10b
	jne semi_loop

retend:	
	mov rsp, rbp
	pop rbp
	ret
