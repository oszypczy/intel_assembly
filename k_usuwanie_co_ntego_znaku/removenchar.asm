;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  removenchar

removenchar:

	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer
	push 	ebx				; push ebx to stack (convention)

	mov		eax, [ebp+8]	; address of character buffer to eax
	mov		edx, eax		; set writing pointer
	mov 	ecx, [ebp+12]	; read int n
	sub		ecx, 1			; we will remove when n=0 so we have to decrement by 1

save_loop:
	mov 	bl, [eax]		; load char to bl
	test 	bl, bl
	jz		end				; if current char is not 0 then go back to loop
	inc 	eax				; increment reading pointer
	test 	ecx, ecx
	jz 		remove_char		; if n=0 then remove char
	dec 	ecx				; decrement n
	mov 	[edx], bl		; rewrite current char
	inc 	edx				; increment writing pointer
	jmp 	save_loop

remove_char:
	mov 	ecx, [ebp+12]	; read int n
	sub		ecx, 1			; we will remove when n=0 so we have to decrement by 1
	jmp	 	save_loop

end:
	mov 	[edx], bl		; add null terminator
	mov		eax, [ebp+8]	; return character buffer address
	pop 	ebx				; pop ebx (pushed at the beggining)
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
