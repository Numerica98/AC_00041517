        org     100h

section .text

        MOV     BP, arrNum
        MOV     BX, 300h        ; direccion para guardar numeros pares
        call    Pares           ; subrutina para almacenar numeros pares 
        MOV     BX, 320h        ; direccion para guardar numeros impares
        call    Impares         ; subrutina para almacenar numeros impares
        
        int 20h

section .data

arrNum DB 20,21,22,23,24,25,26,27,28,29,0xA ; Arreglo de 10 numeros

; Funcion para obtener numeros impares
Impares:
        XOR     CX, CX
        XOR     DX, DX
        XOR     SI, SI
        XOR     DI, DI
        MOV     DX, 2d
while_impar:
        XOR     AX, AX
        MOV     AL, [BP+SI]     ; almacena el numero actual para su posterior division
        CMP     AL, 0xA         ; compara si se ha llegado al final del arreglo
        JE      fin_impar            
        MOV     CL, [BP+SI]
        DIV     DL
        CMP     AH, 0d          ; comparando si el residuo es igual a cero
        JNE     llenar_impar    ; si el residuo es diferente de cero hace el proceso
        INC     SI              ; pasando a siguiente posicion en el arreglo
        JMP     while_impar
llenar_impar:
        MOV     [BX+DI], CL     ; llena el espacio correspondiente con el numero impar
        INC     SI              ; pasando a siguiente posicion en el arreglo
        INC     DI              ; pasando a la siguiente posisicion de guardado
        JMP     while_impar
fin_impar:
        ret

; Funcion para obtener numeros pares
Pares:
        XOR     CX, CX
        XOR     DX, DX
        XOR     SI, SI
        XOR     DI, DI
        MOV     DX, 2d
while_par:
        XOR     AX, AX
        MOV     AL, [BP+SI]     ; almacena el numero actual para su posterior division
        CMP     AL, 0xA         ; compara si se ha llegado al final del arreglo
        JE      fin_par
        MOV     CL, [BP+SI]
        DIV     DL
        CMP     AH, 0d          ; comparando si el residuo es igual a cero
        JE      llenar_par      ; si el residuo es igual a cero hace el proceso
        INC     SI              ; pasando a siguiente posicion en el arreglo
        JMP     while_par
llenar_par:
        MOV     [BX+DI], CL     ; llena el espacio correspondiente con el numero par
        INC     SI              ; pasando a siguiente posicion en el arreglo
        INC     DI              ; pasando a la siguiente posisicion de guardado
        JMP     while_par
fin_par:
        ret