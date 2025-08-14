.model small
.stack 100h
.data 

    msg1 db "Enter char: $"
    msg2 db 10,13,"Changed to upper: $"
    msg3 db 10,13,"Not Letter$ "
    num db ? 
    
.code 
    main proc
        mov ax, @data
        mov ds, ax;
        
        mov ah,9
        lea dx,msg1
        int 21h 
        
        mov ah,1
        int 21h
        mov num,al
        
        mov ah,9
        lea dx,msg2
        int 21h 
        
        cmp num,'A'
        JL not_letter   
        cmp num, 'Z'
        JLE upper 
        
       upper:
        mov bl,num
        or bl,20h
        jmp conv
        
       conv:
        mov ah,2
        mov dl,bl
        int 21h
        jmp exit
        
       not_letter:
        mov ah,9
        lea dx,msg3
        int 21h 
        
        exit:
        mov ah,4ch
        int 21h
    main endp
 end main