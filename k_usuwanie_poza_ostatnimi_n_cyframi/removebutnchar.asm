;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  removebutnchar

removebutnchar:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer
	push 	ebx
	push 	esi

	mov		eax, [ebp+8]	; address of character buffer to eax
	mov 	ecx, [ebp+12]	; read int n
	mov		ebx, [ebp+8]	; address of character buffer to ebx
	mov		esi, 0

length_loop:
	mov		dl, [eax]		; load char
	inc 	eax				; increment pointer
	test	dl, dl
	jnz		length_loop		; if char not zero go to next iteration
	dec 	eax				; go back to null terminator

back_loop:
	cmp		ecx, esi
	jle		end				; if no more chars to leave go to end
	dec		ecx				; decrement chars to leave
	dec 	eax				; decrement eax
	cmp		eax, ebx
	jne		back_loop		; if eax went back to begining go to end (save whole string)

end:
	pop 	esi
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
;  | function parameter - int n	   | EBP+12
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
