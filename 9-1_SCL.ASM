.MODEL SMALL
.DATA
MSG DB "Programming in Assembly Language is Fun!$"

.CODE
MAIN PROC FAR
     MOV AX, @DATA
     MOV DS, AX
     
     MOV CH, 5D
     MOV CL, 20D
     MOV DH, 20D
     MOV DL, 60D
     MOV BH, 70H    
     XOR AL, AL
     MOV AH, 06H
     INT 10H

     XOR BH, BH
     MOV DH, 12
     MOV DL, 30
     MOV AH, 02H
     INT 10H

     LEA DX, MSG
     MOV AH, 09H
     INT 21H

     MOV AH, 4CH
     INT 21H

MAIN ENDP

END MAIN 

