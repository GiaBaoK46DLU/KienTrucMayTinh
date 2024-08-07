.MODEL STACK
.STACK 100H
.DATA      
   TB DB 13,'Nhap ky thuong: $ '
   TBSAI DB 13,10,'Nhap sai thoat ra nhap lai $ '
   TBKQUA DB 13,10,'Ket qua: $ '
.CODE
   MOV AX, @DATA
   MOV DS, AX
   
   MOV DX, OFFSET TB
   MOV AH, 9
   INT 21H
   
   MOV AH, 1
   INT 21H
   MOV CL, AL
   
   CMP CL, 'a'
   JB XETCHUHOA
   CMP CL, 'z'
   JA PR1
   JMP PR3
   
   XETCHUHOA:
   CMP CL, 'A'
   JB XETKTKHAC
   CMP CL, 'Z'
   JA PR1
   JMP PR3
   
   XETKTKHAC:
   JMP PR1
   
   PR1:
   MOV DX, OFFSET TBSAI
   MOV AH, 9
   INT 21H
   JMP GREETING
   PR2:
   MOV DX, OFFSET TBKQUA
   MOV AH, 9
   INT 21H
   MOV DL, CL
   JMP GREETING
   PR3:
   MOV DX, OFFSET TBKQUA 
   MOV AH, 9
   INT 21H
   SUB CL, 32
   MOV DL, CL
   
   GREETING:
   MOV AH, 2
   INT 21H
   
END