section	.text
global  mandel

mandel:
	push    ebp             	; save caller's frame pointer (convention)
	mov     ebp, esp        	; set base pointer to esp (convention)
	sub 	esp, 4				; allocate space on stack for 1 local value
	push 	ebx					; save ebx
	push 	esi					; save esi
	push 	edi					; save edi

	mov		dword [ebp-4], 0	; int(16:16) y = 0
	mov 	edi, 0				; int(16:16) x = 0
	mov 	ecx, 0				; iteration = 0

main_loop:
	mov		eax, edi			; multiplicand x in eax (deafult)
	imul 	edi					; mul x*x and result in edx:eax
	shld 	edx, eax, 16
	mov 	ebx, edx			; x^2 in ebx

	mov		eax, [ebp-4]		; y in eax
	imul 	eax					; mul y*y and result in edx:eax
	shld 	edx, eax, 16

	mov 	esi, edx			; y^2 in esi
	mov 	eax, ebx			; x^2 in eax
	add 	eax, esi			; x^2 + y^2 in eax
	cmp 	eax, 262144			; check if x^2 + y^2 > 4 (16:16 format)
	jg 		fin					; if so it is the end of loop

	sub 	ebx, esi			; x^2 - y^2 in ebx
	add 	ebx, [ebp+8]		; xtemp = x^2 - y^2 + re in ebx

	shl 	edi, 1				; 2x in edi
	mov 	eax, [ebp-4]		; y in eax
	imul 	edi					; 2xy in edx:eax
	shld 	edx, eax, 16
	add		edx, [ebp+12]		; 2xy + im in edx

	mov 	[ebp-4], edx		; y = 2xy + im
	mov     edi, ebx			; x = xtemp

	inc 	ecx
	cmp		ecx, 255			; check if iteration is bigger than 255
	jb		main_loop			; if below go back to the loop

fin:
	mov     eax, ecx	    	; return number of iterations

	pop 	edi
	pop 	esi
	pop 	ebx

	mov 	esp, ebp
	pop     ebp
	ret
