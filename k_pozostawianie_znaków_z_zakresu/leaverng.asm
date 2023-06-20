;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  leaverng

leaverng:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer
	push 	ebx				; push ebx to stack (convention)

	mov		eax, [ebp+8]	; address of character buffer to eax
	mov		edx, eax		; set writing pointer
	mov 	cl, [ebp+12]	; read low parameter
	mov 	ch, [ebp+16]	; read high parameter

remove_loop:
	mov 	bl, [eax]		; load char to bl
	inc 	eax				; increment reading pointer
	test 	bl, bl			; check if char is null
	jz		save_char		; if null then save char and exit
	cmp		bl, cl
	jl		remove_loop		; if char smaller than low char then remove it
	cmp 	bl, ch
	jg		remove_loop		; if char greater thez high char then remove it

save_char:
	mov 	[edx], bl		; rewrite current char
	inc 	edx				; increment writing pointer
	test 	bl, bl			; check if char is null
	jnz 	remove_loop		; go back to loop

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
;  | ...                           |
;  ---------------------------------
;  | function parameter - char high| EBP+16
;  ---------------------------------
;  | function parameter - char low | EBP+12
;  ---------------------------------
;  | function parameter - char *nts| EBP+8
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
