    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- 65 EMIT

    #-- Resultado:
    #-- RiscvForth v0.1  15 Jun 2023
    #-- A
    #--  ok

    #-- Imprimir la letra 'A'
    LIT(65)
    EMIT
    CR

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

