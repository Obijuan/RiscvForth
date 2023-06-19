    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- 

    #-- Resultado:

    NINIT
    DOT
    CR


    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

