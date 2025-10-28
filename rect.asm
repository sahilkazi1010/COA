.model small
.stack 100h
.data
.code
main proc
    mov ax, 13h         ; Set 320x200 graphics mode
    int 10h

    mov al, 4           ; Red color
    mov bh, 0           ; Page number = 0

; ==== Draw Top Horizontal Line ====
    mov cx, 100         ; Start X
    mov dx, 50          ; Y = 50
top_line:
    mov ah, 0Ch
    int 10h
    inc cx
    cmp cx, 200
    jle top_line

; ==== Draw Right Vertical Line ====
    mov cx, 200         ; X = 200 fixed
    mov dx, 50          ; Start Y
right_line:
    mov ah, 0Ch
    int 10h
    inc dx
    cmp dx, 100
    jle right_line

; ==== Draw Bottom Horizontal Line ====
    mov cx, 200         ; Start from right
    mov dx, 100         ; Y = 100
bottom_line:
    mov ah, 0Ch
    int 10h
    dec cx
    cmp cx, 100
    jge bottom_line

; ==== Draw Left Vertical Line ====
    mov cx, 100         ; X = 100 fixed
    mov dx, 100         ; Start from bottom
left_line:
    mov ah, 0Ch
    int 10h
    dec dx
    cmp dx, 50
    jge left_line

; ==== Wait for key press ====
    mov ah, 0
    int 16h

; ==== Return to text mode ====
    mov ax, 03h
    int 10h

    mov ax, 4C00h
    int 21h
main endp
end main
