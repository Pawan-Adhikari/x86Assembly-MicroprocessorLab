PAGE 60, 132
TITLE ADD10WORDS Add 10 16-bit numbers from memory and store the result
;--------------------------------------
DATASEG SEGMENT PARA 'Data'
NUMS DW 10 DUP(65535)
SUMH DW 0
SUML DW 0
DATASEG ENDS
;--------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR 
    ASSUME DS:DATASEG, CS:CODESEG
    MOV AX, DATASEG
    MOV DS, AX

    XOR BX, BX
    ADDLOOP:
    MOV CX, NUMS[BX]
    ADD SUML, CX
    JNC SKIP
    INC SUMH
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