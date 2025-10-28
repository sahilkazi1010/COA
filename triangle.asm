;Code to draw triangle 
.model small
.stack 100h
.code
main:
    ; set graphics mode 320x200 (mode 13h)
    mov ah, 0
    mov al, 13h
    int 10h

    ; ------------------------
    ; Base line (straight horizontal)
    ; ------------------------
    mov cx, 50      ; x
    mov dx, 150     ; y
base_line:
    mov ah, 0Ch
    mov al, 4       ; red color
    int 10h
    inc cx
    cmp cx, 250
    jbe base_line

    ; ------------------------
    ; Left side (simple slope)
    ; ------------------------
    mov cx, 50
    mov dx, 150
left_side:
    mov ah, 0Ch
    mov al, 4
    int 10h
    inc cx
    dec dx
    cmp cx, 150
    jbe left_side

    ; ------------------------
    ; Right side (simple slope)
    ; ------------------------
    mov cx, 250
    mov dx, 150
right_side:
    mov ah, 0Ch
    mov al, 4
    int 10h
    dec cx
    dec dx
    cmp cx, 150
    jae right_side

    ; wait for key
    mov ah, 0
    int 16h

    ; back to text mode
    mov ah, 0
    mov al, 3
    int 10h

    mov ah, 4Ch
    int 21h
end main
