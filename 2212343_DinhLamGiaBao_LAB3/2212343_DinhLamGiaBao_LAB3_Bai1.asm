.MODEL SMALL
.STACK
.DATA   
    NOTE DB 13,'NHAP KY TU S(s),C(c) HOAC T(t) $'
    MORNING DB 13,10,'CHAO BUOI SANG $'
    AFTERNOON DB 13,10,'CHAO BUOI CHIEU $'
    EVENING DB 13,10,'CHAO BUOI TOI $'
.CODE
    MOV AX, @DATA
    MOV DS,AX
    
    MOV DX, OFFSET NOTE 
    MOV AH,9
    INT 21H  
    
REPEAT:   
    MOV AH,1
    INT 21H  
    MOV CL, AL
    CMP CL, 'S'
    JE  IFMORNING
    CMP CL, 's'
    JE  IFMORNING    
    CMP CL, 'C'
    JE  IFAFTERNOON
    CMP CL, 'c'
    JE  IFAFTERNOON
    CMP CL, 'T'
    JE  IFEVENING
    CMP CL, 't'
    JE  IFEVENING
    JMP REPEAT
    
IFMORNING:
    MOV DX, OFFSET MORNING
    MOV AH,9
    INT 21H
    JMP ENDCODE 
    
IFAFTERNOON:
    MOV DX, OFFSET AFTERNOON
    MOV AH,9
    INT 21H
    JMP ENDCODE 
    
IFEVENING:
    MOV DX, OFFSET EVENING
    MOV AH,9
    INT 21H
    JMP ENDCODE
    
ENDCODE:
    MOV AH,4CH
    INT 21H
END



