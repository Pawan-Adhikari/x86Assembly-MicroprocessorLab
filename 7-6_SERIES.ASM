PAGE 60, 132
TITLE SERIES Sum of series 2x3 + 4x5 + ... upto 20 terms
;--------------------------------------
DATASEG SEGMENT PARA 'Data'
NUM DB 40
SUM DW 00
DATASEG ENDS
;--------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR 
    ASSUME DS:DATASEG, CS:CODESEG
    MOV AX, DATASEG
    MOV DS, AX

    MLOOP:
    MOV AL, NUM
    INC AL
    MUL NUM
    ADD SUM, AX
    SUB NUM, 02
    JNZ MLOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP
CODESEG ENDS
;--------------------------------------
END MAIN

