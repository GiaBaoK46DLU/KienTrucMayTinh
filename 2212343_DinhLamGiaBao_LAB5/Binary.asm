.MODEL SMALL
.STACK
.DATA
 CR EQU 13
 LF EQU 10
 MSG1 DB 'Nhap so nhi phan: $'
 MSG2 DB CR,LF,'So nhi phan vua nhap: $'
.CODE
   MOV AX, @DATA
   MOV DS, AX
   XOR BX, BX
   MOV AH, 9
   LEA DX, MSG1
   INT 21h
   MOV AH, 1
 N2:
   INT 21h
   CMP AL, CR
   JE N8
   AND AL, 0Fh
   SHL BX, 1
   OR BL, AL
   JMP N2
 N8:
   MOV CX, 16
   MOV AH, 9
   LEA DX, MSG2
   INT 21h
   PrintLoop:
       ROL BX, 1
       JC Print1
       MOV DL, '0'
       MOV AH, 2
       INT 21h
       JMP Exit1
   Print1:
       MOV DL, '1'
       MOV AH, 2
       INT 21h
   Exit1:
       DEC CX
       CMP CX, 0
       JNE PrintLoop
       
   MOV AH, 4Ch
   INT 21h
END