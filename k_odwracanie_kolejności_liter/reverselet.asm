;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  reverselet

reverselet:
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

find_low_let:
	cmp     edx, ecx
	jbe     fin					; end if pointers passed each other
	mov     al, [ecx]			; get low char
	inc     ecx					; increment low pointer
	cmp 	al, 'A'
	jb 		find_low_let
	cmp 	al, 'Z'
	jbe 	low_letter_found
	cmp 	al, 'a'
	jb  	find_low_let
	cmp 	al, 'z'
	ja 		find_low_let

low_letter_found:
	dec 	ecx					; point to found letter

find_high_let:
	cmp     edx, ecx
	jbe     fin					; end if pointers passed each other
	mov     ah, [edx]			; get low char
	dec 	edx					; decrement high pointer
	cmp 	ah, 'A'
	jb 		find_high_let
	cmp 	ah, 'Z'
	jbe  	high_letter_found
	cmp 	ah, 'a'
	jb  	find_high_let
	cmp 	ah, 'z'
	ja 		find_high_let

high_letter_found:
	inc 	edx					; point to found letter

swap:
	mov    	[edx], al			; move low letter to the place where high used to be
	mov     [ecx], ah			; move high letter to the place where low used to be
	inc 	ecx					; inc low pointer
	dec     edx					; dec high pointer
	jmp     find_low_let

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
