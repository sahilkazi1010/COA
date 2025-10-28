;Non restoring division 
.MODEL SMALL
.STACK 100H
.DATA
DIVIDEND DW 23      ; Dividend
DIVISOR  DW 5       ; Divisor
QUOTIENT DW 0
REMAINDER DW 0

.CODE
MAIN PROC
    MOV AX, @dat
    MOV DS, AX

    ; Load dividend and divisor
    MOV AX, DIVIDEND   ; AX = Dividend
    MOV BX, DIVISOR    ; BX = Divisor
    XOR DX, DX         ; Clear DX (remainder)
    MOV CX, 16         ; Number of bits to process (assuming 16-bit dividend)

DIV_LOOP:
    SHL DX, 1          ; Shift remainder left
    RCL AX, 1          ; Shift dividend left through carry

    SUB DX, BX         ; DX = DX - BX
    JC SKIP_SET_ONE    ; If negative, carry set, skip

    ; If DX >= 0
    ROL CX, 1          ; Shift quotient left (optional, store in CX)
    OR AX, 1           ; Set LSB of AX (quotient bit)
    JMP NEXT_BIT

SKIP_SET_ONE:
    ADD DX, BX         ; Restore remainder if negative

NEXT_BIT:
    LOOP DIV_LOOP

    ; Store results
    MOV QUOTIENT, AX
    MOV REMAINDER, DX

    ; Exit program
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
