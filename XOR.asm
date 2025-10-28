.model small
.stack 100h
.data
c dw ?
.code
main:
mov ax,@data
mov ds,ax
mov ax,11001b
mov bx,00110b
xor ax,bx
mov ah,0h
int 3
mov c,ax
mov ah,09h
int 21h
end main
