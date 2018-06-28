	BITS 64
	section .text

	global strstr

strstr:
	push rbp
	mov rbp, rsp

	mov r8, -1
	cmp BYTE[rsi], 0
	jz ret_first

loop:
	add r8, 1
	cmp BYTE[rdi + r8], 0
	je ret_null
	mov r11b, BYTE[rsi]
	cmp BYTE[rdi + r8], r11b
	je compare
	jnz loop

compare:
	mov r9, -1
	mov r10, r8
	sub r10, 1
loop_compare:
	add r9, 1
	add r10, 1
	cmp BYTE[rsi + r9], 0
	je return
	mov r11b, BYTE[rsi + r9]
	cmp BYTE[rdi + r10], r11b
	je loop_compare
	jmp loop
	
return:
	cmp r8, 0
	je ret_first
	
loop_ret:	
	inc rdi
	sub r8, 1
	cmp r8, 0
	jnz loop_ret
	
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret

ret_first:
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret
	
ret_null:
	mov rax, 0

	mov rsp, rbp
	pop rbp
	ret
