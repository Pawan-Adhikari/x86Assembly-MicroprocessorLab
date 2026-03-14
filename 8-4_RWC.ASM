page 60, 132
TITLE DISPC R/W string using Character Fns
;------------------------------------------------------------
DATASEG SEGMENT PARA 'Data'
MSG DB 10 DUP('$')
LEN DW 0
DATASEG ENDS
;------------------------------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR
     ASSUME DS:DATASEG, CS:CODESEG
     MOV AX, DATASEG
     MOV DS, AX

     XOR BX, BX

LOOPIN:  
     MOV AH, 01H
     INT 21H
     CMP AL, 0DH
     JZ EXIT_LOOP

     MOV MSG[BX], AL   
     INC BX
     INC LEN 
     
     CMP BX, 9
     JL LOOPIN
     
EXIT_LOOP:

     XOR BX, BX

LOOPOUT:
     MOV DL, MSG[BX]
     MOV AH, 02H
     INT 21H
     INC BX
     CMP BX, LEN
     JNZ LOOPOUT

     MOV AH, 4CH
     INT 21H
MAIN ENDP
CODESEG ENDS
;---------------------------------------------------------------
END MAIN

