.ORIG x3000
	GETC			; character for bit 0
	ADD R1, R0, #0		
	GETC	
	ADD R2, R0, #0
	GETC
	ADD R0, R0, R0
	ADD R0, R0, R0
	ADD R0, R0, R0
	ADD R0, R0, R0

	LD R3, FIRST		; load x4000 to R3
	ADD R3, R3, R0		; load start address to R3

	LDR R4, R3, #0		; load mem value of R3 to R4
	AND R5, R5, #0
	ADD R5, R5, #15
	ADD R5, R5, #2

OUTLOOP
	AND R6, R6, #0
	ADD R6, R6, #8
	ADD R5, R5, #-1
	BRz NEXT
NLOOP
	ADD R4, R4, #0
	BRn NEGATIVE
	ADD R0, R1, #0
	OUT
	ADD R4, R4, R4
	ADD R6, R6, #-1
	BRp NLOOP
	BRnzp NEWLN
NEGATIVE
	ADD R0, R2, #0		
	OUT
	ADD R4, R4, R4
	ADD R6, R6, #-1
	BRp NLOOP
	BRnzp NEWLN
NEWLN
	AND R0, R0, #0
	ADD R0, R0, #10
	OUT
	ADD R3, R3, #1
	LDR R4, R3, #0
	BRnzp OUTLOOP
	
NEXT	HALT

FIRST	.FILL x4000

	.END
