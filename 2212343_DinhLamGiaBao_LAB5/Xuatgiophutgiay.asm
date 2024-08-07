.MODEL SMALL
.STACK 100h
.DATA
    HOUR DB 13,10,'GIO : $'
    MINUTE DB 13,10,'PHUT: $'
    SECOND DB 13,10,'GIAY: $'
.CODE
    INCLUDE 'emu8086.inc'
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 2Ch
    INT 21h
    
    XOR BX, BX
    MOV BL, DH
    PUSH BX
    XOR BX, BX
    MOV BL, CL
    PUSH BX
    XOR BX, BX
    MOV BL, CH
    PUSH BX
    
    ;XUAT GIO
    LEA DX, HOUR
    MOV AH, 9
    INT 21h
    POP AX
    CALL PRINT_NUM
    
    ;XUAT PHUT
    LEA DX, MINUTE
    MOV AH, 9
    INT 21h
    POP AX
    CALL PRINT_NUM
     
    ;XUAT GIAY
    LEA DX, SECOND 
    MOV AH, 9
    INT 21h
    POP AX
    CALL PRINT_NUM
    
    MOV AH, 4Ch
    INT 21h
 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END
