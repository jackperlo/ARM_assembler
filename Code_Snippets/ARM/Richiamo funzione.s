						PUSH	{R0, R1, ...} 	; Parametri da passare alla funzione
						BL		function
						POP		{R10}			; Quando la funzione non ritorna nulla, nel caso ritornasse qualcosa il valore sarebbe in R10
						POP		{R10}			; Quando la funzione non ritorna nulla, nel caso ritornasse qualcosa il valore sarebbe in R10

					
						PROC
function				PUSH  	{R0-R11, LR}
						LDR  	R0, [SP, #52]  	; Per leggere i valori passati; Il primo parametro è in questa posizione, gli altri sono a +4 
						
						
						LDR		R8, [SP, #]     ; Per restituire un valore al chiamante. Inserire come valore la posizione dello stack del registro su cui si vuole caricare
						POP		{R0-R11, PC}

