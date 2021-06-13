        org 100h

section .text
        ; Limpiando registros
        XOR AX, AX
        XOR SI, SI
        XOR BX, BX
        XOR DX, DX

        ; Asignando valores iniciales
        MOV SI, 5
        MOV [200h], SI

        ; Ejecucion de funciones del programa
        CALL modotexto          ; Modo texto
        CALL movercursor        ; Posicion del cursor
        CALL escribirnombre1    ; Primer nombre
        CALL aumentarfila       ; Aumentando el numero de fila
        CALL movercursor        ; Moviendo la posicion del cursor
        CALL escribirnombre2    ; Segundo nombre
        CALL aumentarfila
        CALL movercursor
        CALL escribirapellido1  ; Primer apellido
        CALL aumentarfila
        CALL movercursor
        CALL escribirapellido2  ; Segundo apellido
        CALL exit               ; Fin del programa

modotexto:
        MOV AH, 0h      ; Activando modo texto
        MOV AL, 03h     ; Seleccionando modo gráfico deseado
        INT 10h
        RET 
aumentarfila:
        INC SI          ; Incrementando el numero de fila
        INC SI
        MOV [200h], SI  ; Copiando el numero de fila a 200h
        RET
movercursor:
        MOV AH, 02h     ; Posicionando el cursor en pantalla.
        MOV DH, [200h]  ; Fila donde se mostrará el cursor
        MOV DL, 15      ; Columna donde se mostrará el cursor
        MOV BH, 0h      ; Colocando número de página
        INT 10h
        RET
escribirnombre1:
        MOV AH, 09h             ; Escribiendo cadena en pantalla según posición del cursor
        MOV DX, nombre1         ; Imprimiendo primer nombre
        INT 21h
        RET
escribirnombre2:
        MOV AH, 09h
        MOV DX, nombre2         ; Imprimiendo segundo nombre
        INT 21h
        RET
escribirapellido1:
        MOV AH, 09h
        MOV DX, apellido1       ; Imprimiendo primer apellido
        INT 21h
        RET
escribirapellido2:
        MOV AH, 09h
        MOV DX, apellido2       ; Imprimiendo segundo apellido
        INT 21h
        RET
exit:
        INT 20h

section .data

nombre1 DB "Nuria$"
nombre2 DB "Melissa$"
apellido1 DB "Rivas$"
apellido2 DB "Canjura$"  