section	.text
global  mandel

mandel:
	push 	rbp
	push 	rbx					; int(16:16) x in ebx (lower 32 bits)
	push 	r12					; int(16:16) y in r12d (lower 32 bits)
	push 	r13					; int iteration in r13d (lower 32 bits)

	xor 	rbx, rbx			; x = 0
	xor 	r12, r12			; y = 0
	xor 	r13, r13			; iteration = 0

main_loop:
	movsxd	rax, ebx			; multiplicand x in rax (sign extend)
	imul 	rax, rax			; x^2 in rax
	shr 	rax, 16				; addjust number to 16:16 format
	mov 	edx, eax			; move lower 32 bits of rax to edx (x^2)

	movsxd	rax, r12d			; multiplicand y in rax (sign extend)
	imul 	rax, rax			; y^2 in rax
	shr 	rax, 16				; addjust number to 16:16 format
	mov 	ecx, eax			; move lower 32 bits of rax to ecx (y^2)

	mov 	eax, edx			; x^2 in eax
	add 	eax, ecx			; x^2 + y^2 in eax
	cmp 	eax, 262144			; check if x^2 + y^2 > 4 (16:16 format)
	jg 		fin					; if so it is the end of loop

	sub 	edx, ecx			; x^2 - y^2 in edx
	add 	edx, edi			; xtemp = x^2 - y^2 + re in edx

	movsxd  rcx, ebx			; x in rcx
	shl 	rcx, 1				; 2x in rcx
	movsxd 	rax, r12d			; y in rax
	imul 	rax, rcx			; 2xy in rax
	shr 	rax, 16				; addjust number
	add 	eax, esi			; 2xy + im in eax

	mov     r12d, eax			; y = 2xy + im
	mov     ebx, edx			; x = xtemp

	mov 	ecx, r13d			; iteration in rcx
	inc 	ecx
	mov		r13d, ecx			; inc iterations by 1 and save it

	cmp		ecx, 255			; check if iteration is bigger than 255
	jb		main_loop			; if so it is the end of loop

fin:
	mov     rax, r13	    	; return number of iterations
	pop 	r13
	pop 	r12
	pop 	rbx
	pop 	rbp
	ret
