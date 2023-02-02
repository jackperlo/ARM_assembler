				; in R0 dovrà esserci il numero in cui bisogna contare gli 1
				
				MOV R1, #32  ; numero di cifre del numero (BINARIO)
				MOV R2, #0   ; variabile che conterra il numero di 1
				
loop			LSLS R0, R0, #1   
				ADDCS R2, R2, #1
				
				SUBS R1, R1, #1
				BNE loop
				
				MOV R0, R2