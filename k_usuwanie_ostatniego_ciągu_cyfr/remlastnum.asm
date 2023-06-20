;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  remlastnum

remlastnum:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer to stack pointer

	mov 	edx, [ebp+8]	; save address of character buffer to edx
	mov 	ecx, 0			; set flag that first number was not found

find_eos:                   ; moving edx to end of str
	mov     al, [edx]       ; current char in al
	inc     edx             ; edx to next char
	test    al, al
	jnz     find_eos        ; edx points past the trailing NUL now
	sub     edx, 2          ; make edx point to the last char of the string

next_char:
	mov		al, [edx]		; get character from buffer
	dec		edx				; increment buffer pointer
	cmp 	al, '0'
	jl		not_digit		; if less than '0', not a digit
	cmp 	al, '9'
	jg		not_digit		; if greater than '9', not a digit

is_digit:
	mov 	ecx, 1			; set flag that first number was found
	jmp		next_char		; next character

not_digit:
	test 	ecx, ecx
	jz 		next_char		; if first number was not found, continue

end:
	mov 	ah, 0			; set end of string
	add 	edx, 2			; increment buffer pointer
	mov 	[edx], ah		; set end of string
	mov		eax, [ebp+8]	; address of character buffer to eax
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
