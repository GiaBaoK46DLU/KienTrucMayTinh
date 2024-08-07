.MODEL SMALL
.STACK 100h
.DATA
    DAY DB 13,10,'NGAY : $'
    MONTH DB 13,10,'THANG: $'
    YEAR DB 13,10,'NAM: $'
.CODE
    INCLUDE 'emu8086.inc'
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 2Ah
    INT 21h
    
    PUSH CX
    XOR BX, BX
    MOV BL, DH
    PUSH BX
    XOR BX, BX
    MOV BL, DL
    PUSH BX
    
    ;XUAT NGAY
    LEA DX, DAY
    MOV AH, 9
    INT 21h
    POP AX
    CALL PRINT_NUM
    
    ;XUAT THANG
    LEA DX, MONTH
    MOV AH, 9
    INT 21h
    POP AX
    CALL PRINT_NUM
     
    ;XUAT NAM
    LEA DX, YEAR 
    MOV AH, 9
    INT 21h
    POP AX
    CALL PRINT_NUM
    
    MOV AH, 4Ch
    INT 21h
 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END
