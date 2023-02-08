CMP				R4, #1					  ; in R4 deve essere contenuto il bit del primo numero
				BEQ 	ultimoBit1
				
ultimoBit0		LSRS   	R5, R5, #1        ; in R5 deve essere contenuto il bit del secondo numero 
				BCS		salta             ; sono diversi
				BCC     bitUguali         ; sono uguali
				
ultimoBit1		LSRS   	R5, R5, #1        ; in R5 deve essere contenuto il bit del secondo numero 
				BCS		bitUguali         ; sono uguali
				BCC     salta             ; sono diversi
				
bitUguali
				
salta			