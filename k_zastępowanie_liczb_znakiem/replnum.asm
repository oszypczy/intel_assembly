;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  replnum

replnum:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer
	push 	ebx

	mov		eax, [ebp+8]	; reading pointer
	mov		cl, [ebp+12]	; char to replace
	mov		edx, eax		; writing pointer
	mov 	ebx, 0			; isNum flag

next_char:
	mov 	ch, [eax]		; load char to ch
	inc 	eax				; increment reading pointer
	cmp 	ch, '0'
	jb		replace			; if not a digit then replace
	cmp		ch, '9'
	ja		replace			; if not a digit then replace
	mov 	ebx, 1			; set isNum flag on
	jmp		next_char

replace:
	test	ebx, ebx
	jz		rewrite			; if not anumber then rewrite
	mov 	[edx], cl		; replace with sign loaded from user
	inc		edx				; increment writing pointer
	mov 	ebx, 0			; set isNum flag to off

rewrite:
	mov 	[edx], ch		; rewrite current char
	inc		edx				; increment writing pointer
	test	ch, ch
	jnz		next_char		; if not null then next char

	mov 	eax, [ebp+8]
	pop 	ebx
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
;  | function parameter - char a   | EBP+12
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
