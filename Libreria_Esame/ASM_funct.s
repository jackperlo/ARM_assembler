				AREA asm_functions, CODE, READONLY	
	
;definizione di costanti e register renaming
;MY_CONST EQU 36
;my_register RN 0
	
my_function		PROC
				EXPORT my_function
				
				;salvo tutti i registri che utilizzerò nel mio codice: NB r0, r1, r2, r3 -> sono i 4 parametri utilizzabili come input
				
				;MOV r12, SP  ;abilitarlo per ottenere i parametri contenuti sullo stack
				
				PUSH {r4-r12,lr}
				
				;ottengo il valore di un parametro(r0) passato per indirizzo in memoria
				;LDR r0, [r0]
				
				;ottengo 5°/6° parametro(r4, r5) dallo stack
				
				;LDR r4, [r12]   ; abilitare riga 11 !!!!!!!
				;LDR r5, [r12, #4]
				
				; oppure
				;LDR r4, [SP, #40]
				;LDR r5, [SP, #44]
				
				;CODICE
			
					;salvo in R0 il valore di ritorno
					;MOV r0, #1
			
				;END CODICE
				
				;per leggere byte LDRB R5, [R0, R1]
				;per leggere word LDR R5, [R0, R1, LSL#2]
				
				;suppongo in R3, la N del ciclo
;loop			
				;SUBS R3, R3, #1
				;BNE loop

				POP {r4-r12,pc} ;restore di tutti i registri utilizzati nel mio codice
				ENDP				
					
				LTORG	
					
				;definizione area dati readONLY
				AREA _data, DATA, READONLY, align=3
					EXPORT my_vector [DATA]
					EXPORT my_variable
my_vector			DCD -5, 0xFFFFFF01
my_variable			DCB 'A'

				;definizione area dati readWRITE
				AREA _data2, DATA, READWRITE, align=3
					EXPORT my_space_4_vector
my_space_4_vector	SPACE    11*22 ;length(11)*n_byte(22)
					
				END