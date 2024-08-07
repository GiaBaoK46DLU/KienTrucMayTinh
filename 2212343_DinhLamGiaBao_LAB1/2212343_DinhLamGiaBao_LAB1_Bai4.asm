.MODEL SMALL
.STACK
.DATA
    CHUOI1 DW 13,'Hay nhap mot ky tu: $'
    CHUOI2 DW 10,13,'Ky tu dung truoc: $' 
    CHUOI3 DW ', da nhap: $'
    CHUOI4 DW ', dung sau: $'
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
    MOV CL,AL   ;LUU TAM VAO THANH GHI C
    
    ;XUAT CHUOI 2
    MOV DX, OFFSET CHUOI2
    MOV AH,9
    INT 21H 
    
    ;XUAT KI TU 
    MOV DL,CL  ;TRUYEN KI TU TU C VAO D
    DEC DL     ;GIAM 1 DON VI
    MOV AH,2
    INT 21H
    
    ;XUAT CHUOI 3
    MOV DX, OFFSET CHUOI3
    MOV AH,9
    INT 21H  
    MOV DL,CL   
    
    ;XUAT KI TU VUA NHAP
    MOV AH,2
    INT 21H
    
    ;XUAT CHUOI 4
    MOV DX, OFFSET CHUOI4
    MOV AH,9
    INT 21H
    
    ;XUAT KI TU
    MOV DL,CL   ;TRUYEN KI TU TU C VAO D
    INC DL      ;TANG 1 DON VI
    MOV AH,2
    INT 21H
END
