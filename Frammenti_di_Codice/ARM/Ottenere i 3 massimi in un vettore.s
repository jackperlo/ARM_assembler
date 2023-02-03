find_best_3(DATA_IN, N, BEST_3) ;trova i tre valori massimi in 'DATA_IN' (con valori[-100,+100]) e li posiziona in 'BEST_3'
				AREA asm_functions, CODE, READONLY	
	
;definizione di costanti e register renaming
data_in RN 0
N_elem RN 1
best_3 RN 2
data_elem RN 3 
best_3_index RN 4
data_in_index RN 5
local_max RN 6
ex_max RN 7
find_best_3		PROC
				EXPORT find_best_3
				
				;salvo tutti i registri che utilizzerò nel mio codice: NB r0, r1, r2, r3 -> sono i 4 parametri utilizzabili come input
				
				PUSH {r4-r12,lr}
				;R0->*data_in
				;R1->N
				;R2->*best_3
				
				;ex_max=100;
				;for(int i=0; i<best_3.length: i++){
				;	local_max=-100;
				;	for(int j=0; j<data_in.length; j++){
				;		if(data_in[j] > local_max && data_in[j] < ex_max)
				;			local_max = data_in[j];
				;	}
				;	best_3[i] = local_max;
				;	ex_max = local_max;
				;}
				
				;CODICE
				MOV best_3_index, #0
				MOV ex_max, #100
			
loop_best_3		MOV data_in_index, #0
				ADD local_max, #-100
				
loop_data_in	LDRSB data_elem, [data_in, data_in_index]
				CMP data_elem, local_max
				BLE no_max
				CMP data_elem, ex_max
				ADDLT local_max, data_elem, #0
				
no_max			ADD data_in_index, data_in_index, #1
				CMP data_in_index, #5
				BLT	loop_data_in
				
				STRB local_max, [best_3, best_3_index]
				ADD ex_max, local_max, #0
				
				ADD best_3_index, #1
				CMP best_3_index, #3
				BLT loop_best_3
			
				MOV r0, N_elem
			
				;END CODICE
			
				POP {r4-r12,pc} ;restore di tutti i registri utilizzati nel mio codice
				ENDP				
				
				LTORG
					
				;definizione area dati readONLY
				AREA _data, DATA, READONLY, align=3
					EXPORT DATA_IN [DATA]
					EXPORT N
						
DATA_IN				DCB 3, 2, 0, -10, 1
N					DCB 3

				;definizione area dati readWRITE
				AREA _data2, DATA, READWRITE, align=3
					EXPORT BEST_3
BEST_3				SPACE    3 ;3 BYTE, uno per ciascun char in best_3
					
				END