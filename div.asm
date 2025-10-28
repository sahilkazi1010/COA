.model small
.stack 100h
.data
a dw 10h
b dw 02h
c dw ?
.code
main:
mov ax,@data
mov ds,ax
mov ax,a
mov bx,b
div bx
mov ah,0h
int 3
mov ah,09h
int 21h
end main
