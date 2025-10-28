.model small
.stack 100h
.data
a dw 25h
b dw 16h
c dw ?
.code
main:
mov ax,@data
mov ds,ax
mov ax,a
mov bx,b
add ax,bx
mov c,ax
mov ah,09h
int 21
end main
