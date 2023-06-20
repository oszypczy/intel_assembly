;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  reversepairs

reversepairs:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer

	mov		eax, [ebp+8]	; reading pointer
	mov 	edx, eax		; second pointer
	inc 	edx				; increment second pointer

next_char:
	mov 	cl, [eax]		; read character
	test 	cl, cl
	jz 		end				; if null character then go to end
	mov 	ch, [edx]		; read next character
	test 	ch, ch
	jz		end				; if null character then go to end
	mov		[eax], ch		; reverse in pairs
	mov 	[edx], cl		; reverse in pairs
	add		eax, 2			; increment pointer
	add 	edx, 2			; increment second pointer
	jmp 	next_char

end:
	mov 	eax, [ebp+8]
	pop		ebp				; pop ebp (always)
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
