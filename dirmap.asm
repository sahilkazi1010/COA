; Direct Mapping Cache Simulation
; Memory blocks: 10,20,30,40,50,60,70,80
; Cache size: 4

.model small
.stack 100h
.data
memory db 10,20,30,40,50,60,70,80
cache  db 4 dup (0FFh)     ; initialize as empty (-1)
msg1   db 'Memory block ',0
msg2   db ' stored in cache line ',0
newline db 13,10,'$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 8           ; number of memory blocks
    xor si, si          ; memory index (0–7)

next_block:
    mov al, memory[si]  ; get memory block value

    mov bx, si          ; copy block number
    and bx, 3           ; cache line = block_number mod 4
    mov cache[bx], al   ; store block in that cache line

    ;---------------------------------
    ; Display "Memory block X"
    ;---------------------------------
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov al, memory[si]
    add al, 30h         ; convert to ASCII
    mov dl, al
    mov ah, 02h
    int 21h

    ;---------------------------------
    ; Display " stored in cache line "
    ;---------------------------------
    mov ah, 09h
    lea dx, msg2
    int 21h

    mov al, bl          ; lower 8 bits of BX = cache line
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ;---------------------------------
    ; Newline
    ;---------------------------------
    mov ah, 09h
    lea dx, newline
    int 21h

    inc si
    loop next_block

    mov ah, 4Ch
    int 21h
end main

