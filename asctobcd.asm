.model small
.stack 100h
.data
ascii db '5'
bcd db ?
.code
main:
mov ax,@data
mov ds,ax
mov al,ascii
sub al,30h
mov bcd,al
mov ah,4CH
int 21h
end main
