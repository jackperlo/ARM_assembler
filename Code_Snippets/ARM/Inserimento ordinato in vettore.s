				CMP R2, #0
				STRBEQ R1, [R0, #0]
				BEQ fine
				
				MOV R4, #0
				MOV R5, R2
				
loop			LDRB R3, [R0, R4]
				CMP R1, R3
				BLS skip
				
				SUB R5, R5, #1
				MOV R6, R5
				
internal		CMP R6, R4

				STRBLT R1, [R0, R4]
				BLT fine
				
				LDRB R7, [R0, R6]
				ADD R8, R6, #1
				STRB R7, [R0, R8]
				SUB R6, R6, #1
				B internal
				
				
skip			ADD R4, R4, #1
				SUBS R2, R2, #1
				BNE loop
				
				STRB R1, [R0, R5]