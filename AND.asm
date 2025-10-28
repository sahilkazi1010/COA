.model small
.stack 100h
.data
c dw ?          ; result will be stored here

.code
main:
    mov ax, @data
    mov ds, ax

    mov ax, 11001b     ; load binary value 11001b = 19 decimal
    mov bx, 00110b     ; load binary value 00110b = 6 decimal
    and ax, bx         ; perform bitwise AND → result in AX
    ;mov ah,0h
    ;int 3
    mov c, ax          ; store result in variable 'c'

    ; --- end the program ---
    mov ah, 4Ch
    int 21h
end main
