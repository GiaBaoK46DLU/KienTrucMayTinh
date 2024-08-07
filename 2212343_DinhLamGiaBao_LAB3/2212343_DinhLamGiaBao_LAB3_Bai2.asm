.MODEL SMALL
.STACK
.DATA   
    NOTE DB 13,'NHAP KY TU $'
    TBKhac DB 13,10, "Ky tu nhap khac chu/so$"
    TBChu DB 13,10, "Ky tu nhap la chu$"
    TBSo DB 13,10, "Ky tu nhap la so$"
.CODE
    MOV AX, @DATA
    MOV DS,AX
    
    MOV DX, OFFSET NOTE 
    MOV AH,9
    INT 21H  
    
REPEAT:   
    MOV AH,1
    INT 21H  
    
    CMP AL, 'a'
    JB  XETCHUHOA
    CMP AL, 'z'
    JA  KHAC
    JMP CHU 
    
    XETCHUHOA:   
    CMP AL, 'A'
    JB  XETSO
    CMP AL, 'Z'
    JA  KHAC
    JMP CHU 
     
    XETSO:
    CMP AL, 0
    CMP AL, 9 
    JA  KHAC
    JMP SO
    
KHAC:
    MOV DX, OFFSET TBKhac
    MOV AH,9
    INT 21H
    JMP ENDCODE 
    
SO:
    MOV DX, OFFSET TBSo
    MOV AH,9
    INT 21H
    JMP ENDCODE 
    
CHU:
    MOV DX, OFFSET TBChu
    MOV AH,9
    INT 21H
    JMP ENDCODE
    
ENDCODE:
    MOV AH,4CH
    INT 21H
END



