;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  reversedig

reversedig:
	push    ebp             	; save caller's frame pointer (convention)
	mov     ebp, esp        	; set base pointer to esp (convention)

	mov     ecx, [ebp+8]    	; ecx pointing to begining of str
	mov     edx, ecx        	; edx pointing to begining of str

find_eos:                       ; moving edx to end of str
	mov     al, [edx]       	; current char in al
	inc     edx             	; edx to next char
	test    al, al
	jnz     find_eos        	; edx points past the trailing NUL now
	sub     edx, 2          	; make edx point to the last char of the string

find_low_dig:
	cmp     edx, ecx
	jbe     fin					; end if pointer passed each other
	mov     al, [ecx]			; get low char into al
	inc     ecx					; increment low pointer
	cmp 	al, '0'
	jb 		find_low_dig		; if not a digit, go to next char
	cmp 	al, '9'
	ja  	find_low_dig		; if not a digit, go to next char
	dec 	ecx					; point to that found digit

find_high_dig:
	cmp     edx, ecx
	jbe     fin					; end if pointer passed each other
	mov     ah, [edx]			; get high char into ah
	dec 	edx					; decrement high pointer
	cmp 	ah, '0'
	jb 		find_high_dig		; if not a digit, go to next char
	cmp 	ah, '9'
	ja  	find_high_dig 		; if not a digit, go to next char
	inc 	edx					; point to that found digit

swap:
	mov    	[edx], al			; move low digit to the place of high digit
	mov     [ecx], ah			; move high digit to the place of low digit
	inc 	ecx					; increment low pointer
	dec     edx					; decrement high pointer
	jmp     find_low_dig

fin:
	mov     eax, [ebp+8]    	; return the original arg
	pop     ebp             	; restore caller's frame pointer
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
