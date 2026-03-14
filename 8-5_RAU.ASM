page 60, 132
TITLE DISPC R/W string using Character Fns
;------------------------------------------------------------
DATASEG SEGMENT PARA 'Data'
MAXC DB 15
ACTC DB ?
MSG DB 17 DUP('$')
DATASEG ENDS
;------------------------------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR
     ASSUME DS:DATASEG, CS:CODESEG
     MOV AX, DATASEG
     MOV DS, AX
     XOR SI, SI

     MOV AH, 0AH
     LEA DX, MAXC
     INT 21H

     MOV DL, 0AH
     MOV AH, 02H
     INT 21H
    
LOOPOUT:
     CMP MSG[SI], 61H
     JB SKIP
     CMP MSG[SI], 7AH
     JBE FIX
SKIP:
     INC SI
     XOR BX, BX
     MOV BL, ACTC
     CMP SI, BX
     JNZ LOOPOUT

     MOV AH, 09H
     LEA DX, MSG
     INT 21H

     MOV AH, 4CH
     INT 21H

FIX:
     SUB MSG[SI], 20H
     JMP SKIP

MAIN ENDP
CODESEG ENDS
;---------------------------------------------------------------
END MAIN

