.MODEL SMALL

.STACK 100H 

.DATA   

 A DB "Hello WORLD$"
 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9       ;STRING OUTPUT
    LEA DX,A
    INT 21H 
         
    MOV AH,2       ;FOR PRINT ENDL 5 LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV AH,1        ;INPUT ON SINGLE CHAR
    INT 21H
    MOV BH,AL       ;STORE BH 
    
    MOV AH,2       ;FOR PRINT ENDL 5 LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    MOV AH,1        ;INPUT
    INT 21H
    MOV CH,AL       ; STORE CH 
    
    MOV AH,2       ;FOR PRINT ENDL 5 LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H   
    
    MOV AH,2
    MOV DL,BH    ; SIDE BY SIDE PRINT BH,CH
    INT 21H
    MOV DL,CH
    INT 21H 
    
    MOV AH,2       ;FOR PRINT ENDL 5 LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    ADD BH,CH    ; BH = BH+ CH
    INT 21H
    SUB BH,30H
    
    MOV AH,2       ;FOR PRINT ENDL 5 LINE
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H

    MAIN ENDP
END MAIN