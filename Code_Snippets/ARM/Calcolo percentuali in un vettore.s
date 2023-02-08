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