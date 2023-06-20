;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  capwords

capwords:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer

	mov		eax, [ebp+8]	; address of character buffer to eax
	mov		cl, 'a'			; 'a' in cl
	mov		ch, 'z'			; 'z' in ch
	mov		dl, 0			; flag if new word appears

upper:
	mov 	dh, [eax]		; load char to dh
	cmp		dh, cl
	jl		rewrite_char	; if char smaller than 'a' then rewrite it
	cmp 	dh, ch
	ja		rewrite_char	; if char bigger than 'z' then rewrite it
	test 	dl, dl
	jnz		rewrite_char	; if not a new word then rewrite
	sub 	dh, 32
	mov 	[eax], dh		; rewrite upper letter
	mov 	dl, 1			; set new word flag to true
	inc 	eax				; increment reading pointer
	jmp 	upper

rewrite_char:
	inc 	eax				; increment reading pointer
	cmp		dh, ' '
	ja		upper			; if above space then go to upper
	mov 	dl, 0			; set new word flag to false
	test	dh, dh
	jnz		upper			; if not end of str go back

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
