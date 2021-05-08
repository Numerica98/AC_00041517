org 100h

section .text

        XOR BX, BX
        XOR DI, DI 
        XOR AX, AX
        MOV word CX, 8d
        JMP iterar

; Suma de los dígitos
iterar:
        MOV byte BL, [carnet+DI]
        ADD AL, BL
        INC DI
        LOOP iterar
promedio:
        ; Promedio 
        MOV BX, 8d
        DIV BX
        ; Guardando el resultado en el registro 20Ah
        MOV byte [20Ah], AL         
exit:
        int 20h

section .data

carnet DB 0,0,0,4,1,5,1,7