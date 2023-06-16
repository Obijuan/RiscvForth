    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- 0 0xb1 0xc3 XEMIT ( imprimir una ñ)
    #-- 0 0x80 0x94 0xe2 XEMIT ( Imprimir linea horizontal)
    #-- CR

    #-- Resultado:
    #-- RiscvForth v0.1  15 Jun 2023
    #-- ñ─
    #--  ok

    #-- Imprimir una ñ
    LIT(0)
    LIT(0xb1)
    LIT(0xc3)
    XEMIT

    #-- Imprimir ─
    LIT(0)
    LIT(0x80)
    LIT(0x94)
    LIT(0xe2)
    XEMIT
    CR
    

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

