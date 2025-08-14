.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'CX is Greater than 5$'
    MSG2 DB 'CX is Less than or Equal to 5$'
    MSG3 DB 'CX is Still Greater!$'
    A EQU 65
    B EQU 98
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
 
    MOV CX, 7      
 
START:
    CMP CX, 5      
    JG PRINT_GREATER  
    JLE PRINT_LESS_EQUAL
 
PRINT_GREATER:
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
 
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
 
    DEC CX          
    CMP CX, 5
    JNLE PRINT_AGAIN   
    JMP PRINT_LESS_EQUAL
 
PRINT_AGAIN:
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
 
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
 
    DEC CX
    JMP START
 
PRINT_LESS_EQUAL:
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
 
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H  
    
    MOV AH, 2
    MOV DL,A
    INT 21H
    MOV DL,B
    INT 21H
 
    MOV AH, 4CH
    INT 21H
 
MAIN ENDP
END MAIN