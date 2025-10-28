.model small
stack 100h
.data
a dw 25 h
b dw 20 h
c dw ?
.code
main:
movv ax,@data
mov ds,ax
mov ax,a
mov bx,b
sub ax,bx
mov ah,0
int 3
mov c,ax
mov ah,09h
int 21
end main
