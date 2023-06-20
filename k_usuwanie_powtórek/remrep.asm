;------------------------------------------------------------------------
;	EBX, EDI, ESI, EBP - have to be saved in function
;------------------------------------------------------------------------

section .data
    buffer_size equ 128         ; define the buffer size
    buffer: resb buffer_size    ; allocate memory for the buffer

section .text
global remrep


remrep:
    push    ebp             ; save caller's frame pointer (convention)
	mov     ebp, esp        ; set base pointer to esp (convention)
    push    ebx

	mov     eax, [ebp+8]    ; eax pointing to begining of str (reading pointer)
    mov     ebx, eax        ; ebx pointing to begining of str (writing pointer)
    mov     edx, buffer     ; edx pointing to begining of buffer (repetition pointer)
    mov     [edx], byte 0   ; set first char of buffer to null

next_char:
    mov     cl, [eax]       ; load char from str to cl
    inc     eax             ; increment reading pointer
    test    cl, cl         	; check if char is null
    jz      end             ; if null jump to end

check_char:
    mov     ch, [edx]       ; load char from buffer to ch
    inc     edx             ; increment edx
    cmp     cl, ch          ; compare cl and ch
    je      remove_char     ; if equal jump to remove_char
    test    ch, ch          ; check if char in buffor is null
    jnz     check_char      ; if not null jump to check_char (check next char in repetition buffor)

save_char:
    mov     [edx-1], cl     ; save char to buffer
    mov     [edx], ch       ; set last char in buffor to null
    mov     [ebx], cl       ; save char to str
    inc     ebx             ; increment ebx

remove_char:
    mov     edx, buffer     ; edx pointing to begining of buffer
    jmp     next_char       ; jump to next_char

end:
    mov     [ebx], cl       ; set last char of new str to null
	mov     eax, [ebp+8]    ; return original str

    pop     ebx
	pop     ebp             ; restore caller's frame pointer
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
