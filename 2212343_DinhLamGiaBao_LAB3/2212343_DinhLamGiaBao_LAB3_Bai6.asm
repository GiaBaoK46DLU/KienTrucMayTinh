.MODEL SMALL
.STACK 100H
.DATA
   NHAP DW 13,'Nhap mot ki tu: $'
   XUATTRUOC DW 13,10'Nam ki tu dung truoc: $'
   XUATSAU DW 13,10,'Nam ki tu dung sau: $'
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
   MOV DX, OFFSET XUATTRUOC
   MOV AH, 9
   INT 21H
   
   MOV DL, CL
   MOV BX, 5
   
   KEYLOOP:
   INC DL
   DEC BX
   MOV AH, 2
   INT 21H
   
   JNZ KEYLOOP 
   
   ;XUAT
   MOV DX, OFFSET XUATSAU
   MOV AH, 9
   INT 21H     
   
   MOV DL, CL
   MOV BX, 5
   
   PRINTLOOP:
   DEC DL
   DEC BX
   MOV AH, 2
   INT 21H
   JNZ PRINTLOOP
   
END