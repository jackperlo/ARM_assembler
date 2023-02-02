int stat_satisfaction(unsigned int s, unsigned int n, unsigned int i, char *ps, char *pn, char *pi) ;funzione per calcolo percentuali ps, pn, pi rispetto a (s+n+i)
stat_satisfaction		PROC
				EXPORT stat_satisfaction
				
				;salvo tutti i registri che utilizzerò nel mio codice: NB r0, r1, r2, r3 -> sono i 4 parametri utilizzabili come input
				MOV r12, SP  ;abilitarlo per ottenere i parametri contenuti sullo stack
				
				PUSH {r4-r12,lr}
				
				;ottengo il valore di un parametro(r3) passato per indirizzo in memoria
				;LDR r3, [r3] 
				
				;ottengo 5°/6° parametro(r4, r5) dallo stack
				LDR r4, [r12]  
				LDR r5, [r12, #4]
				
				;CODICE				
				;salvo ps da r0->r6
				ADD r6, r0, #0
				MOV r7, #100
				;ottengo il totale r0=ps+pn+pi
				ADD r0, r0, r1
				ADD r0, r0, r2
				;ottengo la percentuale relativa a ps
				MUL r8, r6, r7
				SDIV r8, r8, r0
				STRB r8, [r3]
				;ottengo la percentuale relativa a pn
				MUL r8, r1, r7
				SDIV r8, r8, r0 
				STRB r8, [r4]
				;ottengo la percentuale relativa a pi
				MUL r8, r2, r7
				SDIV r8, r8, r0 
				STRB r8, [r5]
			
				;END CODICE

				POP {r4-r12,pc} ;restore di tutti i registri utilizzati nel mio codice
				ENDP	
				
================================================================================================================================================================================================================

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