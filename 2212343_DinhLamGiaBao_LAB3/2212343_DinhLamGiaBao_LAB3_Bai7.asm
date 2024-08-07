.MODEL STACK
.STACK 100H
.DATA      
   TB DW 13,'Nhap ky tu/so: $ '
   TBKHAC DW 13,10,'Ky tu nay khong phai chu/so$ '
   TBCHU DW 13,10,'Ky tu nay la chu$ '
   TBSO DW 13,10,'Ky tu nay la so$ '
   TBTHOAT DW 13,10,'Thoat khoi chuong trinh$ '
.CODE
   MOV AX, @DATA
   MOV DS, AX
   
   MOV DX, OFFSET TB
   MOV AH, 9
   INT 21H
   
   KEYLOOP:
   MOV AH, 1
   INT 21H
   MOV CL, AL
   
   CMP CL, 'F'
   JE KEYLOOP
   CMP CL, 'f'
   JE KEYLOOP
   
   CMP CL, 'a'
   JB XETCHUHOA
   CMP CL, 'z'
   JA PR1
   JMP PR3
   
   XETCHUHOA:
   CMP CL, 'A'
   JB XETSO
   CMP CL, 'Z'
   JA PR1
   JMP PR3
   
   XETSO:
   CMP CL, 0
   CMP CL, 9
   JA PR1
   JMP PR2
   
   LOOPNE KEYLOOP
   
   PR1:
   MOV DX, OFFSET TBKHAC
   JMP GREETING
   PR2:
   MOV DX, OFFSET TBSO
   JMP GREETING
   PR3:
   MOV DX, OFFSET TBCHU
   
   GREETING:
   MOV AH, 9
   INT 21H
   
END