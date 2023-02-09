//R0 / R2, il resto sarà in R3 e poi in R0

UDIV R2, R0, R1
MUL R3, R2, R1
SUB R3, R0, R3
MOV R0, R3