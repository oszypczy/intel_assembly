;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  gethex

gethex:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer to stack pointer

	mov		eax, [ebp+8]	; address of character buffer to eax
	mov 	ecx, 0			; set number to zero

next_char:
	xor 	edx, edx
	mov		dl, [eax]		; get character from buffer
	inc		eax				; increment buffer pointer
	test 	dl, dl
	jz		end				; if zero, end
	cmp 	dl, '0'
	jne		next_char		; if less than '0', not a hex prefix

check_if_hex:
	xor 	edx, edx
	mov		dl, [eax]		; get character from buffer
	inc		eax				; increment buffer pointer
	cmp 	dl, 'x'			; if next char is x, it is hex
	jne 	next_char		; if not, continue

hex_loop:
	xor 	edx, edx
	mov		dl, [eax]		; get character from buffer
	inc		eax				; increment buffer pointer
	test	dl, dl
	jz		end				; if zero, end
	cmp		dl, '0'
	jl		next_char		; if less than '0', next character
	cmp		dl, '9'
	jle		is_digit		; if less than or equal to '9', it is a digit
	cmp		dl, 'A'
	jl		next_char		; if less than 'A', next character
	cmp		dl, 'F'
	jg		next_char		; if greater than 'F', next character

is_hex:
	sub		dl, 'A'			; subtract 'A' from character
	add		dl, 10			; add 10 to character
	jmp 	convert

is_digit:
	sub		dl, '0'			; subtract '0' from character

convert:
	shl		ecx, 4			; shift number left 4 bits
	add		ecx, edx		; add character to number
	jmp 	hex_loop

end:
	mov 	eax, ecx		; return number in eax
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
