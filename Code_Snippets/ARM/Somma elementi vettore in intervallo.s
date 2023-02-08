unsigned int totale_pressioni_con_filtro(unsigned char VETT[], unsigned int numero_misure, unsigned char max, unsigned char min) ;funzione che somma elementi di un vettore >MIN && <MAX
elem RN 4
somma RN 5
n RN 1
max RN 2
min RN 3
i RN 6
aus RN 7
totale_pressioni_con_filtro		PROC
				EXPORT totale_pressioni_con_filtro
								
				;R0->ind di VETT
				;R1->numero elementi in VETT
				;R2->MAX
				;R3->MIN
				
				PUSH {r4-r12,lr}			
				
				;CODICE
				MOV i, #0
				MOV somma, #0
loop			LDRB elem, [r0, i]
				SUBS aus, elem, min
				BLT skip
				SUBS aus, elem, max
				ADDLE somma, somma, elem
skip			ADD i, i, #1
				SUBS R1, R1, #1
				BNE loop
				;salvo in R0 il valore di ritorno
				ADD r0, somma, #0 
			
				;END CODICE
				
				POP {r4-r12,pc} ;restore di tutti i registri utilizzati nel mio codice
				ENDP