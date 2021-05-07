org 100h

section .text

        XOR BX, BX
        XOR DI, DI 
        XOR AX, AX
        MOV word CX, 8d
        JMP iterar

; Suma de los dígitos
iterar:
        MOV word BX, [carnet+DI]
        ADD AX, BX
        INC DI
        LOOP iterar
promedio:
        ; Promedio 
        MOV BX, 8d
        DIV BX
        ; Guardando el resultado en el registro 20Ah
        MOV [20Ah], AL         
exit:
        int 20h

section .data

carnet DB 00041517