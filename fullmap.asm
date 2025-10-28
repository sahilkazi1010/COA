; Fully Associative Cache Simulation
; Memory blocks: 5, 15, 25, 35, 45, 55
; Cache size: 4
.model small
.stack 100h
.data
memory db 5,15,25,35,45,55
cache db 4 dup (0FFh)
msg1 db 'Memory block ',0
msg2 db ' stored in cache line ',0
newline db 13,10,'$'

.code
main:
    mov ax,@data
    mov ds,ax

    mov cx,6
    xor si,si
    xor di,di ; next free cache index

next_block:
    mov al, memory[si]
    cmp di,4
    jb store_block

    ; if cache full, replace first line (FIFO)
    mov al, memory[si]
    mov cache[0], al
    mov di,1
    jmp display

store_block:
    mov cache[di], al
    inc di

display:
    ; Print memory block (simplified)
    inc si
    loop next_block

    mov ah,4Ch
    int 21h
end main

