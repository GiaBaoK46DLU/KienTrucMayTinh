.MODEL SMALL
.STACK
.DATA
    chuoi1 DW   13,'Hay nhap mot ki tu: $'
    chuoi2 DW   13,10,'Ki tu da nhap: $'
.CODE
    MOV AX, @DATA
    MOV DS,AX
    
    ;XUAT CHUOI 1
    MOV DX, OFFSET CHUOI1
    MOV AH,9
    INT 21H 
            
    ;NHAP MOT KI TU       
    MOV AH,1
    INT 21H  
    MOV CL,AL
     
    ;XUAT CHUOI 2
    MOV DX, OFFSET CHUOI2
    MOV AH,9
    INT 21H  
    MOV DL,CL
    
    ;XUAT KI TU VUA NHAP
    MOV AH,2
    INT 21H
END