				LDR R0, =DATA_IN
				LDR R2, =BEST_3
				MOV R3, R1
				MOV R5, #0
				
				MOV R9, #2
				MOV R10, #-100
				
init			STRB R10, [R2, R9]
				SUBS R9, R9, #1
				BPL init
				

loop			LDRSB R4, [R0, R5]
				ADD R5, R5, #1
				MOV R6, #0
				MOV R8, #3

internal		LDRSB R7, [R2, R6]
				
				CMP R4, R7
				BGT maggiore
				BLT minore
	
minore			CMP R6, #0
				BEQ fine
			
				CMP R6, #1
				LDRBEQ R8, [R2, #1]
				STRBEQ R8, [R2, #0]
				
insert          SUB R6, R6, #1
				STRB R4, [R2, R6]
				B fine

maggiore 		ADD R6, R6, #1
				
				SUBS R8, R8, #1
				BNE internal
				
				CMP R4, R7
				LDRBGT R8, [R2, #1]
				STRBGT R8, [R2, #0]
				LDRBGT R8, [R2, #2]
				STRBGT R8, [R2, #1]
				STRBGT R4, [R2, #2]
				
				
fine			SUBS R3, R3, #1
				BNE loop