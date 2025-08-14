.MODEL SMALL
.STACK 100H
.DATA  

    MSG1 DB 'ENTER A NUMBER: $'
    MSG2 DB 'ENTER ANOTHER NUMBER: $'
    MSG3 DB 10,13,'BIGGER NUMBER IS: $'
    NUM1 DB ?
    NUM2 DB ?
    BIGGER DB ?  
    
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL 
    
    MOV AH,2     
    MOV DL,10
    INT 21H 
    
    MOV DL,13
    INT 21H  
    LEA DX,MSG2 
    MOV AH,9
    INT 21H  
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL   
    MOV AL,NUM1
    MOV BL,NUM2 
    
    CMP AL,BL
    JAE NM1    
    MOV AL,NUM2 ;NUM2  
    JMP DISPLAY     
    
    NM1:    ;IF NUM1 BIG
       MOV AL,NUM1 ; NUM1
       
    DISPLAY:
        MOV BIGGER,AL 
        LEA DX,MSG3
        MOV AH,9
        INT 21H 
        
        MOV DL,BIGGER
        ADD DL,30H
        MOV AH,2
        INT 21H 
        
    EXIT:
        MOV AH,4CH
        INT 21H
    MAIN ENDP
    END MAIN