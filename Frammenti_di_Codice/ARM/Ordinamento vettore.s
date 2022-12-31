				; R0 Numero di elementi nel vettore
				; R1 Vettore da ordinare
				
			
				; ALGORITMO 
				MOV R5, R0
				MOV	R11, #1
				
				SUBS R0, R0, #1
				BEQ exit
					
while			CMP		R11, #1
				BNE		exit
				
				MOV 	R5, R0
				MOV 	R6, #0
				MOV		R7, #1
				MOV		R11, #0

for				LDRB	R4, [R1, R6] 
				;LDR	R4, [R1, R6, LSL#2] ;se il vettore è in word
				LDRB	R8, [R1, R7]
				;LDR	R8, [R1, R7, LSL#2] ;se il vettore è in word
				CMP		R8, R4
				;CMP	R4, R8 ;ordine Cresente
				MOVGT	R11, #1
				STRBGT	R8, [R1, R6]
				;STRGT	R8, [R1, R6, LSL#2]
				STRBGT	R4, [R1, R7]
				;STRGT	R4, [R1, R7, LSL#2]
				
				ADD 	R6, R6, #1
				ADD		R7, R7, #1
				
				SUBS 	R5, R5, #1
				BNE 	for
				BEQ		while

exit