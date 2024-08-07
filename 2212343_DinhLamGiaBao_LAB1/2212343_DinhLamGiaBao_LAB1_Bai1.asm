.MODEL SMALL
.STACK 100H
.DATA
    CHUOI1   DW  13,10,"Hello, world!$" 
    CHUOI2   DW  13,10,"Hello, solar system!$"
    CHUOI3   DW  13,10,"Hello, universe!$"
.CODE
    MOV AX, @DATA
    MOV DS,AX
    
    MOV DX, OFFSET CHUOI1
    MOV AH,9
    INT 21H  
    
    MOV DX, OFFSET CHUOI2
    MOV AH,9
    INT 21H
    
    MOV DX, OFFSET CHUOI3
    MOV AH,9
    INT 21H
    
    MOV AH,4CH
    INT 21H
END