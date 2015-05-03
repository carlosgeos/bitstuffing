CPU 386

GLOBAL bitstuffing

SECTION .data

          ; variables du programme


SECTION .text


bitstuffing:

	PUSH EBP
	MOV EBP, ESP
	MOV EAX, [EBP+8]	; place le message (parametre) dans le registre EAX


	; votre code ici






end:	; a la fin, votre résultat doit se trouver dans EAX

	LEAVE
	RET
