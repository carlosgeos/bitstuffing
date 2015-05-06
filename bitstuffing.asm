CPU 386
extern afficherRegistres
extern afficherFlags


GLOBAL bitstuffing

SECTION .data

          ; variables du programme


SECTION .text


bitstuffing:

	PUSH EBP		;save base pointer
	MOV EBP, ESP		;set new base pointer with stack pointer
	MOV EAX, [EBP+8]	;parameter can be found in EBP + 8!




show_registers_flags:
	pusha
	call	afficherRegistres
	popa

	pusha
	pushf
	call	afficherFlags
	popf
	popa

end:	; a la fin, votre résultat doit se trouver dans EAX

	LEAVE
	RET
