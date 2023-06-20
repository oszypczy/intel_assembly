;========================================================================
; ARKO - example Intel x86 assembly program
;
; description: x86 (32-bit) - function modifying the input string
;					int removerng(char* nts_buffer, char low, char high);
;				removes all characters in range <low, high> from
;				the input string
;				returns the pointer to the input buffer
;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  removerng

removerng:
;	eax - reading pointer
;	edx - writing pointer
;	cl - low char (a)
;	ch - high char (z)
;	bl - char loaded from given string

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
	cmp		bl, cl
	jl		save_char		; if char smaller than 'a' then save it
	cmp 	bl, ch
	jle		remove_loop		; if char smaller than or equal 'z' then remove it

save_char:
	mov 	[edx], bl		; rewrite current char
	inc 	edx				; increment writing pointer
	test 	bl, bl
	jnz 	remove_loop		; if current char is not 0 then go back to loop

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
