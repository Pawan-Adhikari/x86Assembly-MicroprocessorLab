PAGE 60, 132
TITLE ADD2TBLS Add 2 tables of 10 16-bit numbers from memory and store the result in next table
;--------------------------------------
DATASEG SEGMENT PARA 'Data'
TBL1 DW 10 DUP(2000)
TBL2 DW 10 DUP(1000)
SUM DW 10 DUP(0)
DATASEG ENDS
;--------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR 
    ASSUME DS:DATASEG, CS:CODESEG
    MOV AX, DATASEG
    MOV DS, AX

    XOR BX, BX
    ADDLOOP:
    MOV CX, TBL1[BX]
    ADD CX, TBL2[BX]
    MOV SUM[BX], CX
    ADD BX, 2
    CMP BX, 20
    JNZ ADDLOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP
CODESEG ENDS
;--------------------------------------
END MAIN