.model small
.stack 100h
.data
c dw ?
.code
main:
mov ax,@data
mov ds,ax
mov ax,11000b
not ax
mov ah,0h
int 3
mov c,ax
mov ah,09h
int 21h
end main
