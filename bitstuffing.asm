CPU 386
extern afficherRegistres
extern afficherFlags


GLOBAL bitstuffing

SECTION .data

n:	DD 0			;loop counter, to check we end up with 32 bits, and the remaining LSB are lost
limit:	DD 0b11111


SECTION .text


bitstuffing:

	PUSH EBP		;save base pointer
	MOV EBP, ESP		;set new base pointer with stack pointer
	MOV EAX, [EBP+8]	;parameter can be found in EBP + 8!

loop:
	shl eax, 1		;shift EAX MSB into the carry flag
	rcl esi, 1		;insert the carry flag into ESI LSB
	inc DWORD [n]		;increment counter to signal that we have one more bit
	call show_registers_flags
	call check_if_finished


	;; utlizar AND normal, no soy capaz de poner un scalar value.
	mov byte edi, esi & limit
	compare and
	decide one path (Make sure it only goes one way!!)

	call check and		;calling check at the end of the loop after treatment is done

stuff0:
	clc
	rcl esi, 1
	inc DWORD [n]
	ret

stuff1:
	stc
	rcl esi, 1
	inc DWORD [n]
	ret



check_if_finished:
	cmp DWORD [n], 32
	jne loop
	je end
	ret

show_registers_flags:
	pusha
	call	afficherRegistres
	popa

	pusha
	pushf
	call	afficherFlags
	popf
	popa

	ret

end:	; a la fin, votre résultat doit se trouver dans EAX

	LEAVE
	RET
