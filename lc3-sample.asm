		.ORIG x3000 
		
LOOP0	GETC			; R0 = Next Bit By user
		
		ADD R5,R5,#1    ; R5 = Character counter
		
		
		ADD R3, R0,#0   ; IF ASCII =/ 10
		ADD R3, R3,#-10 ; Break if ENTER was inputed by the user
		BRz EXIT0
		
		
		STR R0, R4, #0	; R0 --> Store in memory at R4
		
		AND R1, R1,#0	;Clears R1
		ADD R1, R5,#0	;R1 = R5
		
		ADD R1,R1,#-15 	; Break if char count > 15
		BRzp EXIT0	    
						
						
		
		ADD R4, R4, #1	;Increment Loop
		OUT				;Echo user input
		BRnzp LOOP0
		
EXIT0	ADD R0,R0,#0	;Exit loop0


LOOP1 	LDR R1, R4,#0       ;LOADS STRN[x] into R1

		ADD R1,R1,#0	    ;END OF STRING
		BRz EXIT1		    ;Break

		ADD R0, R5,R1	    ;R0 =  OFFSET + CHAR
		STR R0, R4, #0	    ;STORE DECODED CHAR Into STRN[x0]
		ADD R4, R4, #1      ;R4++ 
		ADD R5, R5, #2      ;OFFSET = OFFSET +2
		OUT
		
		BRnzp LOOP1
EXIT1


		
		
	
		
		HALT