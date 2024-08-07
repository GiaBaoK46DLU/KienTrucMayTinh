.MODEL SMALL
.STACK
.DATA
    CHUOI1 DW 13,'Nhap ky tu thu nhat: $'
    CHUOI2 DW 13,10,'Nhap ky tu thu hai: $'
    CHUOI3 DW 13,10,'Ky tu tong: $'
.CODE
    MOV AX, @DATA
    MOV DS,AX
    
    ;XUAT CHUOI 1
    MOV DX, OFFSET CHUOI1
    MOV AH,9
    INT 21H
    
    ;NHAP KI TU
    MOV AH,1
    INT 21H
    MOV CL,AL 
    
    ;XUAT CHUOI 2
    MOV DX, OFFSET CHUOI2
    MOV AH,9
    INT 21H
    
    ;NHAP KI TU
    MOV AH,1
    INT 21H
    MOV CH,AL  
    
    ;XUAT CHUOI 3
    MOV DX, OFFSET CHUOI3
    MOV AH,9
    INT 21H 
    
    ;CONG 2 KI TU
    MOV DL,CH
    ADD dl,cl
    MOV AH,2
    INT 21H       
    
    MOV AH,4CH
    INT 21H
END
    
    