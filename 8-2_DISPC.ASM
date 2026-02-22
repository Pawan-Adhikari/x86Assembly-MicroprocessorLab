page 60, 132
TITLE DISPC Display a string using character function
;------------------------------------------------------------
DATASEG SEGMENT PARA 'Data'
MSG DB "Programming is Fun!"
LEN DB $-MSG
DATASEG ENDS
;------------------------------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR 
     ASSUME DS:DATASEG, CS:CODESEG
     MOV AX, DATASEG
     MOV DS, AX

     XOR BX, BX
     MOV AH, 02h
STRING:
     MOV DL, MSG[BX]
     INT 21h
     INC BX
     CMP BL, LEN 
     JNZ STRING

     MOV AH, 4Ch
     INT 21h
MAIN ENDP
CODESEG ENDS
;------------------------------------------------------------
END MAIN
