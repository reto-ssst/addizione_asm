
#include <avr/io.h>

; dichiarazione della funzone main
.global main

.org 0x00
	rjmp	main	; dopo il reset salta a main

.org 0x100
main:
	ldi	r16,0xff	; carica 0xff nel registro r16
	sts	DDRK,r16	; definisce PK come ouput
	sts	DDRF,r16	; definisce PF come output
	sts	PORTA,r16	; attiva i pull-up su PA
	sts	PORTC,r16	; attiva i pull-up su PC

loop:
	lds	r18,PINA	; carica in r18 il valore letto su PA
	lds	r19,PINC	; carica in r19 il valore letto su PC
	add	r18,r19		; somma r18 e r19, risultato in r18
	lds	r20,SREG	; carica in r20 valore del registro di stato
	sts	PORTF,r20	; scrive su PF il valore del registro r20 (SREG)
	sts	PORTK,r18	; scrive su PK il valore del registro r18 (risultato)
	nop
	rjmp loop		; ripete il ciclo