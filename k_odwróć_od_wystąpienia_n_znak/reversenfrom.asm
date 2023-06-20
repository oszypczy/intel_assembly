;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  reversenfrom

reversenfrom:
	push    ebp             		; save caller's frame pointer (convention)
	mov     ebp, esp        		; set base pointer to esp (convention)
	push 	ebx
	push 	edi

	mov     eax, [ebp+8]    		; eax pointing to begining of str
	mov 	dl,  [ebp+12]			; looked char in dl
	mov 	ebx, [ebp+16]			; unsigned int n in ebx

look_for_char:
    mov 	cl, [eax]				; next char in cl
	inc 	eax						; next char
	test 	cl, cl					; end of string?
	jz 		fin
	cmp 	cl, dl					; is it the char we are looking for?
	jne 	look_for_char			; no, continue looking
	dec 	eax						; eax pointing to looked char
	mov 	edi, eax				; edi pointing to looked char
	test 	ebx, ebx
	jz 		fin

move_reverse_pointer:
	mov 	dh, [edi]
	test	dh, dh
	jz 		adjust
	inc 	edi						; increment reverse pointer
	dec 	ebx						; decrement n
	jnz 	move_reverse_pointer	; no, continue moving

adjust:
	dec 	edi						; adjust reverse pointer

reverse:
	cmp     edi, eax
    jbe     fin
	mov  	ch, [edi]      		; high char in ch
	xchg 	ch, [eax]      		; swap ch with low char at [eax]
	mov  	[edi], ch      		; store swapped high char
	inc 	eax					; inc eax
	dec 	edi					; dec edi
	jmp		reverse				; continue reversing

fin:
	mov 	eax, [ebp+8]		; eax pointing to begining of str
	pop 	edi
	pop 	ebx
	pop     ebp             	; restore caller's frame pointer
	ret

;
;============================================
; 				 THE STACK
;============================================
;
; larger addresses
;
;  |                               |
;  | 	                           |
;  ---------------------------------
;  | function parameter - int n    | EBP+16
;  ---------------------------------
;  | function parameter - char c   | EBP+12
;  ---------------------------------
;  | function parameter - char *s  | EBP+8
;  ---------------------------------
;  | return address                | EBP+4
;  ---------------------------------
;  | saved ebp                     | EBP, ESP
;  ---------------------------------
;  | ... here local variables      | EBP-x
;  |     when needed               |
;
; \/                              \/
; \/ the stack grows in this      \/
; \/ direction                    \/
;
; lower addresses
;
;
;============================================
