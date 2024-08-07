.MODEL SMALL                                         ;KIEU CHUONG TRINH
.STACK                                               ;KHAI BAO NGAN XEP
.DATA                                                ;PHAN DU LIEU
    n       DB          10                           ;DB     KIEU BYTE
    mang    DB          0,1,2   
    chuoi1  DW          'ABC','$'
    chuoi2  DW          13,10 'HELLO!'  , 10 ,'$'    ;13 la ki tu dau dong ;10 la ki tu xuong dong ; '$' la ket thuc chuoi (Mac dinh da co)
.CODE                                                ;PHAN LENH
    MOV AH, 9                                        ;DUA GIA TRI 0 VAO THANH GHI <AH>
    MOV BX, SEG chuoi2                               ;COPY DOAN<SEGMENTS> VAO THANH GHI BX
    MOV DS, BX
    MOV DX, OFFSET chuoi1                            ;OFFSET<BUDAP>
    INT 21H                                          ;LENH CUOI CUNG
END