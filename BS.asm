.MODEL SMALL
.DATA 
ARR DW 0000H,1111H,2222H,3333H,4444H,5555H,6666H,7777H,8888H,9999H
LEN DW ($-ARR)/2
KEY EQU 1111H
MSG1 DB "KEY IS FOUND AT "
RES DB "  POSITION",13,10," $"
MSG2 DB 'KEY NOT FOUND!!!.$'

.CODE 
.STARTUP
    
      MOV BX,00
      MOV DX,LEN
      MOV CX,KEY
AGAIN: CMP BX,DX
       JA FAIL
       MOV AX,BX
       ADD AX,DX
       SHR AX,1
       MOV SI,AX
       ADD SI,SI
       CMP CX,ARR[SI]
       JAE BIG
       DEC AX
       MOV DX,AX
       JMP AGAIN
BIG:   JE SUCCESS
       INC AX
       MOV BX,AX
       JMP AGAIN
SUCCESS: ADD AL,01
         ADD AL,'0'
         MOV RES,AL
         LEA DX,MSG1
         JMP DISP
FAIL: LEA DX,MSG2
DISP: MOV AH,09H
      INT 21H
     
      MOV AH,4CH
      INT 21H     

END 