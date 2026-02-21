PAGE 60, 132
TITLE ADD255 Add numbers from 0 to 255
;--------------------------------------
DATASEG SEGMENT PARA 'Data'
NUM DB 255
SUM DW 0000h
DATASEG ENDS
;--------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR 
    ASSUME DS:DATASEG, CS:CODESEG
    MOV AX, DATASEG
    MOV DS, AX

    ADDLOOP:
    MOV AL, NUM
    XOR AH, AH
    ADD SUM, AX
    DEC NUM
    JNZ ADDLOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP
CODESEG ENDS
;--------------------------------------
END MAIN