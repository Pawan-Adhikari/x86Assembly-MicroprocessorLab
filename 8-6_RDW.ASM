page 60, 132
TITLE RDW READ A STRING AND DISPLAY EACH WORD IN SEPARATE LINES
;------------------------------------------------------------
DATASEG SEGMENT PARA 'Data'
MAXC DB 20
ACTC DB ?
MSG DB 21 DUP('$')
MSG1 DB 30 DUP('$')
DATASEG ENDS
;------------------------------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR
     ASSUME DS:DATASEG, CS:CODESEG
     MOV AX, DATASEG
     MOV DS, AX
     
     MOV AH, 0AH
     LEA DX, MAXC
     INT 21H

     MOV DL, 0AH
     MOV AH, 02H
     INT 21H
    
     XOR SI, SI
     XOR BX, BX
LOOPOUT:
     MOV DL, MSG[SI]
     MOV MSG1[BX], DL
     CMP MSG[SI], ' '
     JNZ SKIP
     INC BX
     MOV MSG1[BX], 0DH
     INC BX
     MOV MSG1[BX], 0AH
SKIP:
     INC SI
     INC BX

     XOR CX, CX
     MOV CL, ACTC
     CMP SI, CX
     JNZ LOOPOUT

     MOV AH, 09H
     LEA DX, MSG1
     INT 21H

     MOV AH, 4CH
     INT 21H

MAIN ENDP
CODESEG ENDS
;---------------------------------------------------------------
END MAIN

