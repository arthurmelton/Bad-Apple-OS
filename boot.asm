[bits 16]           ; tell assembler that working in real mode(16 bit mode)
[org 0x7c00]        ; organize from 0x7C00 memory location where BIOS will load us

start:              ; start label from where our code starts

	xor ax,ax           ; set ax register to 0
	mov ds,ax           ; set data segment(ds) to 0
	mov es,ax           ; set extra segment(es) to 0
	mov bx,0x8000

	mov si, BadApple              ; point BadApple to source index
	call print_string				 ; call print different color string function

	BadApple db  ';;;;;;ff@@@@ff;;;;;;;;;;;;;;;;;;ff@@@@@@@@@@@@88LL;;;;;;;;;;;;;;;;;;ii11/;;;;;;ff@@@@tt;;;;;;;;;;;;;;;;;;00@@@@@@@@CCtt;;;;;;;;;;;;;;;;;;;;;;;;;;/;;;;;;tt@@@@tt;;;;;;;;;;;;;;;;tt@@CC@@@@@@ii;;;;;;;;;;;;;;;;;;;;;;;;;;;;/;;;;;;11@@@@LL;;;;;;;;;;;;;;;;11@@88@@@@@@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;/;;;;;;;;88@@GG;;;;;;;;;;;;;;;;;;1188@@@@@@ff;;;;;;;;;;;;;;;;;;;;;;;;;;;;/;;;;;;;;CC@@@@;;;;;;;;;;;;;;;;;;;;00@@@@@@00;;;;;;;;;;;;;;;;;;;;;;;;;;;;',13,0

print_string:
	mov ah, 0x0E            ; value to tell interrupt handler that take value from al & print it

.repeat_next_char:
	lodsb   			         ; get character from string
	cmp al, ' '                  ; cmp al with end of string
	je .wait	    			 ; if char is zero, end of string	
	cmp al, '/'                  ; cmp al with end of string
	je .newline	    			 ; if char is zero, end of string				  
	cmp al, 0                    ; cmp al with end of string
	je .done_print		    	 ; if char is zero, end of string
	int 0x10                	 ; otherwise, print it
	jmp .repeat_next_char   	 ; jmp to .repeat_next_char if not 0

.done_print:
	ret                 	    ;return

.newline:
	mov ah, 0Eh       ;print new line sequence
	mov al, 0Dh
	int 10h
	mov al, 0Ah
	int 10h
	jmp .repeat_next_char

.wait:
	
	jmp .repeat_next_char

times (510 - ($ - $$)) db 0x00     ;set 512 bytes for boot sector which are necessary
dw 0xAA55 