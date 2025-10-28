; File Operation Program
.model small
.stack 100h

.data
filename db "file.txt",0
msg db "Hello! My name is Sahil$"

.code
main:
    mov ax, @data
    mov ds, ax

    ; --- Create a file ---
    mov ah, 3Ch          ; Function: Create file
    mov cx, 0            ; File attribute (normal)
    mov dx, offset filename
    int 21h              ; DOS interrupt
    jc exit              ; If error, jump to exit
    mov bx, ax           ; File handle in BX

    ; --- Write to file ---
    mov ah, 40h          ; Function: Write to file
    mov cx, 21           ; Number of bytes to write
    mov dx, offset msg   ; Message address
    int 21h

    ; --- Close file ---
    mov ah, 3Eh          ; Function: Close file
    int 21h

exit:
    mov ah, 4Ch          ; Exit program
    int 21h
end main
