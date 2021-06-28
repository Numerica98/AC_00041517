	org 	100h

section	.text

	; Mensaje inicial en pantalla
	MOV 	DX, textoInicial
	CALL  	EscribirCadena
	
        ; Ingreso de clave
	MOV 	BP, claveIngresada
	CALL  	LeerCadena

        CALL    ValidarCadena ; Valida la cadena ingresada

	CALL 	EscribirCadena ; Muestra el mensaje resultante por ingresar cadena

	CALL	EsperarTecla

	INT 	20h

section	.data

textoInicial	DB	"Ingrese la clave de 5 caracteres: ", "$"
clave           DB      "abcde"
largoClave      equ     $-clave
mensjCorrecto 	DB 	"BIENVENIDO ", "$"
mensjError 	DB 	"INCORRECTO ", "$"
claveIngresada 	times 	10  	db	" " 	

; Lectura de caracter 
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

; Lectura de la cadena de texto
LeerCadena:
        xor     SI, SI
while:  
        call    EsperarTecla    
        cmp     AL, 0x0D        
        je      exit            
        mov     [BP+SI], AL   	
        inc     SI              
        jmp     while           
exit:
	mov 	byte [BP+SI], "$"
        ret

; Validando la cadena ingresada
ValidarCadena:
        XOR     DI, DI
        XOR     BX, BX
        XOR     SI, SI                  ; Para determinar si la clave es correcta
        MOV     CX, largoClave          ; Asignando el valor de la longitud de la cadena ingresada
recorrer:       
        CMP     DI, largoClave          ; Comparando el indice DI con la longitud de la cadena
        je      exitValidar             ; Si ambos valores son iguales sale de la validacion
        MOV     DL, [BP+DI]             ; Copiando uno de los caracteres de la cadena
        cmp     DL, [clave+DI]          ; Comparando el caracter de la clave con el ingresado
        je      correcto                ; Si ambos son iguales realiza el incremento de los indices
        INC     DI                      ; Incrementando indice para recorrer las cadenas
        JMP     recorrer                ; Vuelve a recorrer
correcto:
        INC SI                          ; Incrementa el indice para indicar que el caracter es correcto
        INC DI                          ; Incrementa el indice para recorrer las cadenas
        JMP recorrer                    ; Regresa a recorrer las cadenas
exitValidar:    
        CMP     SI, largoClave          ; Comparando si SI con la longitud de la cadena
        JE      cadenaCorrecta          ; Si ambas son iguales significa que todos los caracteres son correctos
        MOV     DX, mensjError          ; Asigna el mensaje a mostrar si la cadena ingresada fue incorrecta
        RET

cadenaCorrecta:
        MOV     DX, mensjCorrecto       ; Asigna el mensaje a mostrar si la cadena ingresada fue correcta
        RET

; Salida estandar de una cadena
EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret