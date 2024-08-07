INCLUDE 'emu8086.inc'
.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB 13,10,'NHAP DO DAI CUA CHIEU DAI(ENTER DE TIEP TUC): $'
    TB2 DB 13,10,'NHAP DO DAI CUA CHIEU RONG (ENTER DE TIEP TUC): $'
    TB3 DB 13,10,'CHU VI CUA HINH CHU NHAT: $'
    TB4 DB 13,10,'DIEN TICH CUA HINH CHU NHAT: $'
     
.CODE 
    MOV AX, @DATA
    MOV DS, AX
    
    XOR BX, BX
    XOR CX, CX
    
    ;NHAP CHIEU RONG
    LEA DX, TB2
    MOV AH, 9
    INT 21h
    CALL NHAP
    MOV CX, BX
    PUSH BX
    PUSH CX
    
    ;NHAP CHIEU DAI
    LEA DX, TB1
    MOV AH, 9
    INT 21h
    CALL NHAP
    POP CX
    MOV DX, BX
    PUSH DX
    
    ;TINH CHU VI
    LEA DX, TB3
    MOV AH, 9
    INT 21h
    
    MOV AH, 0
    MOV AX, CX
    ADD AX, BX
    MOV CX, 2
    AND CX, 0Fh
    MUL CX
    CALL PRINT_NUM
    
    ;TINH DIEN TICH
    LEA DX, TB4
    MOV AH, 9
    INT 21h
    
    POP AX
    POP BX
    MUL BX
    CALL PRINT_NUM 
    
    MOV AH, 4Ch
    INT 21h
    
;-------------------
;NHAP
;-------------------
NHAP PROC
   
    @BEGIN:
        MOV AH, 1
        INT 21h
        XOR BX, BX
        XOR CX, CX
        CMP AL, '-'
        JE @MINUS
        CMP AL, '+'
        JE @PLUS
        JMP @REPEAT2  
    @MINUS:
        MOV CX, 1
    @PLUS:
        INT 21h
    @REPEAT2:
        CMP AL, '0'
        JNGE @NOTDIGIT
        CMP AL, '9'
        JNLE @NOTDIGIT
        
        AND AL, 0Fh
        MOV SI, AX
        
        MOV AX, 10
        MUL BX
        MOV BX, SI
        XOR BH, BH
        ADD BX, AX
        
        MOV AH, 1
        INT 21h
        CMP AL, 13
        JNE @REPEAT2
        
        MOV AX, BX
        OR CX, CX
        JZ @EXIT
        NEG AX
    @EXIT:
        RET
    @NOTDIGIT:
        MOV AH, 2
        MOV DL, 10
        INT 21h
        MOV DL, 13
        INT 21h
        JMP @BEGIN
        
NHAP ENDP
;-----------------------------


DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END    