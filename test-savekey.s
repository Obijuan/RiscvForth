    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- SAVEKEY .HEX CR    ( Imprimir direccion de la variable)
    #-- SAVEKEY @ .HEX CR  ( Imprimir su valor)
    #-- 0xAA SAVEKEY !     ( Almacenar 0xAA )
    #-- SAVEKEY @ .HEX CR  ( Mostrar nuevo valor)

    #-- Resultado:
    #-- RiscvForth v0.1  15 Jun 2023
    #-- 0x004009e0 
    #-- 0x00000037 
    #-- 0x000000aa 
    #--  ok

    #-- Imprimir direccion variable SAVEKEY
    SAVEKEY
    DOTHEX
    CR

    #-- Mostrar valor de la variable SAVEKEY
    SAVEKEY
    FETCH
    DOTHEX
    CR

    #-- Almacenar el valor 0xAA en SAVEKEY
    LIT(0xAA)
    SAVEKEY
    STORE

    #-- Mostrar el nuevo valor
    SAVEKEY
    FETCH
    DOTHEX
    CR

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

