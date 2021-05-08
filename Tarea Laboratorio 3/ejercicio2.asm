org 100h

section .text
        XOR AX, AX
        MOV AX, 1d
        MOV word CX, 5d
        CMP CX, 0d
        JE guardar
        JMP factorial

; Obtencion del factorial
factorial:
        MUL CX
        LOOP factorial
guardar:
        ; Guardando el resultado en el registro 20Bh
        MOV word [20Bh], AX         
exit:
        int 20h