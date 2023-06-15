    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Interprete
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    #-- (COLD)
    #-- COLD llama a quit, pero de momento lo hacemos manualmente
    COLD

    #-- Arrancar el modo interactivo (intérprete)
    #QUIT  #-- Nunca retorna de aquí

    #-- Modo ejecución directa (No interactivo)
    #-- Programa Forth: QUIT

    #-- Fin ejecución direct
    XSQUOTE(4," ok\n")
    TYPE

    QUIT

	#-- Terminar
	BYE

