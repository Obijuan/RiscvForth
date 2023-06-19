    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Definir una variable local (no se mete en diccionario)
    #-- Programa Forth a probar:
    #-- VAR DUP .HEX CR  ( Definir variable y mostrar su direccion)
    #-- DUP @ .HEX CR    ( Mostrar valor de la variable)
    #-- DUP 0xAA SWAP !  ( Almacenar valor 0xAA)
    #-- DUP @ .HEX CR    ( Mostrar valor de la variable)


    #-- Resultado:
    #-- RiscvForth v0.1  15 Jun 2023
    #-- 0x00400168   ( Direccion de la variable)
    #-- 0x00000037   ( Valor inicial)
    #-- 0x000000aa   ( Nuevo valor, previamente guardado)
    #--  ok
    
    #-- Definir una constante
    #-- No se crea diccionario
    CON(0xBB)

    #-- Imprimir valor de la constante
    DUP
    DOTHEX
    CR

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

