;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  getdec

getdec:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer
	push 	ebx

	mov		eax, [ebp+8]	; address of character buffer to eax
	mov 	ecx, 0			; set number to zero
	mov		ebx, 0			; flag that number first number was already found

next_char:
	xor 	edx, edx
	mov		dl, [eax]		; get character from buffer
	inc		eax				; increment buffer pointer
	test 	dl, dl
	jz		end				; if zero, end
	cmp 	dl, '0'
	jl		not_digit		; if less than '0', not a digit
	cmp 	dl, '9'
	jg		not_digit		; if greater than '9', not a digit

is_digit:
	sub 	dl, '0'			; convert to digit
	imul 	ecx, 10			; multiply number by 10
	add 	ecx, edx		; add digit to number
	mov 	ebx, 1			; set flag that first number was found
	jmp		next_char		; next character

not_digit:
	test 	ebx, ebx
	jz 		next_char		; if first number was not found, continue

end:
	mov 	eax, ecx		; return number in eax
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
