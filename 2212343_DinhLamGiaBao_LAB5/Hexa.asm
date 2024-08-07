.MODEL SMALL
.DATA
    NHAP DB 13, 'Nhap so Hexa(toi da 4 ki so): $'
    TB DB 13,10, 'So Hexa vua nhap: $' 
.STACK 100h
.CODE
    MOV AX, @DATA
    MOV DS, AX
    LEA DX, NHAP
    MOV AH, 9
    INT 21h
    XOR BX, BX
    MOV CL, 4
    MOV AH, 1
N2: 
    INT 21h
    CMP AL, 13
    JE  N8
    CMP AL, 39h
    JG  Letter
    AND AL, 0Fh
    JMP Shift
Letter:
    SUB AL, 37h
Shift:
    SHL BX, CL
    OR  BL, AL
    JMP N2     
N8:
    LEA DX, TB
    MOV AH, 9
    INT 21h
    MOV CX, 4
PrintHex:
    MOV DL, BH
    SHR DL, 4
    CMP DL, 9
    JG  PrintLetter
    OR  DL, 30h
    MOV AH, 2
    INT 21h
    JMP Exit
PrintLetter:
    ADD DL, 37h
    MOV AH, 2
    INT 21h
Exit:
    SHL BX, 4
    LOOP PrintHex
    
    MOV AH, 4Ch
    INT 21h
END
    