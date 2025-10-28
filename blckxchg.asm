.model small
.stack 100h
.data
source db 10,20,30,40,50
dest db 1,2,3,4,5
temp db ?
.code
main:
mov ax,@data
mov ds,ax
lea si,source
lea di,dest
mov cx,5
swap_loop:
    mov al,[si]
    mov bl,[di]
    xchg al,bl
    mov [si],al
    mov [di],al
    inc si
    inc di
    loop swap_loop
    mov ah,4ch
    int 21h
end main
