    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    COLON
    
    COMMAXT(do_exit)

    SEMI

    LATEST
    FETCH
    DOTWINFO

    LATEST
    FETCH
    DOTLWCLEN
    ONEPLUS
    DOTWCODE

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

