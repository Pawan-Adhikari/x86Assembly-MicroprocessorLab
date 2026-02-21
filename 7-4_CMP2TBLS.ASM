PAGE 60, 132
TITLE CMP2TBLS Compare 2 tables, if first is smaller, put 1fff else put 0000 in third
;--------------------------------------
DATASEG SEGMENT PARA 'Data'
TBL1 DW 10 DUP(1000)
TBL2 DW 10 DUP(2000)
TBL3 DW 10 DUP(0)
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
    CMP CX, TBL2[BX]
    JNC SKIP
    MOV TBL3[BX], 1FFFh
    
    SKIP:
    ADD BX, 2
    CMP BX, 20
    JNZ ADDLOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP
CODESEG ENDS
;--------------------------------------
END MAIN