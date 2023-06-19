    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- CELL .HEX CR

    #-- Resultado:
    #-- RiscvForth v0.1  15 Jun 2023
    #-- 0x00000004 
    #--  ok
    CELL
    DOTHEX
    CR


    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

