.model small
.stack 100h
.data
bcd db 09h
ascii db ?
.code
main:
mov ax,@data
mov ds,ax
mov al,bcd
add al,30h
mov ascii,al
mov ah,4ch
int 21h
end main
