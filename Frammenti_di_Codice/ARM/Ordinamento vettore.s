				; R0 Numero di elementi nel vettore
				; R1 Vettore da ordinare
				
				PUSH    {R0, R3}
				BL 		ordina
				POP		{R10}
				POP		{R10}					; Non serve alcun valore di ritorno
				
				

ordina			PROC
	
				PUSH 	{R0-R1, R4-R8, R11, LR}
				LDR		R0, [sp, #36]  			
				LDR 	R1, [sp, #40]		
				MOV 	R5, R0
				MOV		R11, #1
					
while			CMP		R11, #1
				BNE		exit
				
				MOV 	R5, R0
				MOV 	R6, #0
				MOV		R7, #1
				MOV		R11, #0

for				LDR		R4, [R1, R6, LSL#2] 
				LDR		R8, [R1, R7, LSL#2]
				CMP		R8, R4
				MOVGT	R11, #1
				STRGT	R8, [R1, R6, LSL#2]
				STRGT	R4, [R1, R7, LSL#2]
				
				ADD 	R6, R6, #1
				ADD		R7, R7, #1
				
				SUBS 	R5, R5, #1
				BNE 	for
				BEQ		while

exit			POP 	{R0-R1, R4-R8, R11, PC}
				
				ENDP