.MODEL SMALL
.STACK 100H
.DATA
    S   DB  "Hello!$"   ;KHAI BAO XAU KI TU CAN IN
.CODE
    MOV AX, @DATA       ;LAY DIA CHI DATA SEGMENT GHI VAO DS
    MOV DS,AX           ;VI MODEL SMALL, DAY CUNG LA DIA CHI SEGMENT CUA XAU
                        ;SEGMENT CUA XAU S
;XUAT CHUOI
    MOV DX, OFFSET S    ;LAY DIA CHI OFFSET GHI VAO DX
    MOV AH,9
    INT 21H             ;GOI HAM 9, NGAT 21 DE IN
    
    MOV AH,4CH          ;THOAT KHOI CHUONG TRINH
    INT 21H
END
    ;CHAR CH                    == CH DB ?
    ;CHAR CH = 'A'              == CH DB 'A'
    ;CHAR CJ = 5                == CH DB 5
    ;CHAR S[] 'HELLO WORLD!"    == S DB 10,13,"HELLO WORLD!$"
    ;INT I = 100                == I DW 100
    ;LONG L;                    == L DD ?
    ;CHAR A[] = <1,2,3>         == A DB 1,2,3
    ;CHAR A[100]                == A DB 100 DUP<?>
    ;CHAR A[100][50]            == A DB 100 DUP<50 DUP<?>>
    
    ;MOT SO LENH CO BAN
    ;MOV DES,SRC : CHEP DU LIEU TU SRC SANG DES
    ;INC DES     : TANG DES MOT DON VI
    ;DEC DES     : GIAM DES MOT DON VI
    ;ADD DES,SRC : DES += SRC
    ;SUB DES,SRC : DES -= SRC   
    ;INT NUM     : GOI NGAT                     