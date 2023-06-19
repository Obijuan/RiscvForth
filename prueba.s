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

    TLBRAC #--   T{

    LIT(1) 

    ARROW  #--   -> 

    LIT(1)

    RBRACT  #-- }T

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

    QUIT

	#-- Terminar
	BYE

