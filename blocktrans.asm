.model small
.stack 100h
.data
source db 10,20,30,40,50
dest db 5 dup(?)
.code
main:
mov ax,@data
mov ds,ax
mov es,ax
lea si,source
lea di,dest
mov cx,5
cld
rep movsb
mov ah,4ch
int 21h
end main
