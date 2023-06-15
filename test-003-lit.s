    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- : xx lit [ 170 , ]  ;       ( Definir palabra nueva (sin nombre) )

    COLON  #--  :
    
    #-- Añadir llamada a la palabra lit
    COMMAXT(do_lit)

    #-- Añadir el literal
    LIT(170)   #-- Lo metemos en la pila
    COMMA      #-- Lo añadimos

    SEMI #-- ;

    #-- Mostrar informacion de la cabeza de la palabra
    #-- .WINFO -->  Print word info
    LATEST
    FETCH
    DOTWINFO

    #-- Mostrar el codigo maquina de la palabra
    #-- .LWCLEN --> Print Latest Word Code Len
    #-- .WCODE --> Print Word Code
    LATEST
    FETCH
    DOTLWCLEN
    ONEPLUS     #-- Imprimimos una celda de más (que debe ser 0)
    DOTWCODE

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

    QUIT

	#-- Terminar
	BYE

