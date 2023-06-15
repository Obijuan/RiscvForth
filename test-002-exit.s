    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- : xx EXIT ;      ( Definir palabra nueva (sin nombre) )
    #-- LATEST @ .WINFO  ( Mostrar cabecera de la nueva palabra )
    #-- LATEST @ .LWCLEN 1+ .WCODE  (Mostrar el codigo de la nueva palabra)

    COLON  #--  :
    
    #-- Añadir llamada a la palabra EXIT
    COMMAXT(do_exit)

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

	#-- Terminar
	BYE

