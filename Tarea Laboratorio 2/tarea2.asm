        org 100h

        section .text

        ; Iniciales nombre completo empezando en la dirección de memoria 200h
        mov     byte [200h], "N"
        mov     byte [201h], "M"
        mov     byte [202h], "R"
        mov     byte [203h], "C"

        ; Copiando en registros los códigos ASCII de los caracteres guardados en 200h

        ; Valor de 200h a AX usando direccionamiento directo
        mov     AL, [200h]

        ; Valor de 201h a CX usando direccionamiento indirecto por registro
        mov     BX, 201h
        mov     CL, [BX]

        ; Valor de 202h a DX usando direccionamiento indirecto base más índice
        mov     SI, 1h
        mov     DL, [BX+SI]

        ; Valor de 203h a DI usando direccionamiento relativo por registro
        mov     DI, [SI+202h]

        int     20h