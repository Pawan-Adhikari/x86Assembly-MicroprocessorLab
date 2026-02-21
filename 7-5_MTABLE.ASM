PAGE 60, 132
TITLE MTABLE Multiplication table of num at num1
;--------------------------------------
DATASEG SEGMENT PARA 'Data'
NUM1 DB 10
TBL DB 10 DUP(?)
DATASEG ENDS
;--------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR 
    ASSUME DS:DATASEG, CS:CODESEG
    MOV AX, DATASEG
    MOV DS, AX

    XOR BX, BX
    MLOOP:
    MOV AX, NUM1
    MUL BL
    MOV TBL[BX], AL
    INC BX
    CMP BX, 10
    JNZ MLOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP
CODESEG ENDS
;--------------------------------------
END MAIN