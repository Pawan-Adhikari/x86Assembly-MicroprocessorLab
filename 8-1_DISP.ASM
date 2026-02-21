        page 60,132
TITLE DISP Display "Programming is Fun!"
;-----------------------------------------
DATASEG SEGMENT PARA 'Data'
MSG DB "Programming is Fun!$"
DATASEG ENDS
;-----------------------------------------
CODESEG SEGMENT PARA 'Code'
MAIN PROC FAR 
     ASSUME DS:DATASEG, CS:CODESEG
     MOV AX, DATASEG
     MOV DS, AX

     MOV DX, OFFSET MSG
     MOV AH, 09h
     INT 21h

     MOV AH, 4CH
     INT 21h
MAIN ENDP
CODESEG ENDS
;-----------------------------------------
     END MAIN