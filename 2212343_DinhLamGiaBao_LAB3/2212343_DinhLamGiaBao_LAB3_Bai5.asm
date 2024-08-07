.MODEL SMALL
.STACK 100H
.DATA
   NHAP DW 13,'Nhap mot ki tu: $'
   XUAT DW 13,10'Ki tu da nhap: $'
   NAMKITU DW 13,10,'Nam ki tu ke tiep: $'
.CODE
   MOV AX, @DATA
   MOV DS, AX
   
   ;NHAP
   MOV DX, OFFSET NHAP
   MOV AH, 9
   INT 21H
   
   MOV AH, 1
   INT 21H
   MOV CL, AL
   
   ;XUAT
   MOV DX, OFFSET XUAT
   MOV AH, 9
   INT 21H
   
   MOV DL, CL
   MOV CX, 5
   
   KEYLOOP:
   DEC DL
   DEC CX
   MOV AH, 2
   INT 21H
   
   JNZ KEYLOOP
END