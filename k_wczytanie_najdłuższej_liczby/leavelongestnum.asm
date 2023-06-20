;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section	.text
global  leavelongestnum

leavelongestnum:
	push	ebp				; push ebp to stack (always)
	mov		ebp, esp		; set base pointer
	push 	ebx
	push 	edi

	mov		eax, [ebp+8]	; eax - reading pointer
	mov 	ecx, 0			; set current size
	mov 	edx, eax		; edx - longest number pointer
	mov		edi, 0			; set maximum size

find_num:
	mov 	bl, [eax]		; read char
	cmp 	bl, '0'			; check if it is a number
	jl 		not_num			; if it is not a number, go to not_num
	cmp 	bl, '9'			; check if it is a number
	jg 		not_num			; if it is not a number, go to not_num
	inc 	ecx				; if it is a number, increase current size
	inc 	eax				; increase reading pointer
	jmp 	find_num		; go to find_num

not_num:
	cmp 	ecx, edi		; compare current size with maximum size
	jl 		clean_up		; if current size is lower than maximum, then clean up

new_max:
	mov     edx, eax		; set longest number pointer
	sub 	edx, ecx		; set longest number pointer
	mov 	edi, ecx		; set maximum size

clean_up:
	mov 	ecx, 0			; clear current size
	test 	bl, bl			; check if it is null
	jz 		create_num		; if it is null, end
	inc 	eax				; increase reading pointer
	jmp 	find_num		; go to find_num

create_num:
	xor 	ebx, ebx		; clear ebx
	test 	edi, edi		; check if size is 0
	jz 		end				; if size is 0, end
	mov     bl, [edx]		; read char
	sub 	bl, '0'			; convert char to number
	imul 	ecx, 10			; multiply number by 10
	add 	ecx, ebx		; add number to accumulator
	inc 	edx				; increase reading pointer
	dec 	edi				; decrease size
	test 	edi, edi		; check if size is 0
	jnz 	create_num		; if size is 0, end

end:
	mov 	eax, ecx		; return longest number
	pop 	edi
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
