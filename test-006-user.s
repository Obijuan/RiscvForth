    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- 4 USER T      ( Crear variable de usuario de nombre T)
    #-- .LWINFO       ( Mostrar info de T)
    #-- LATEST @ NFATOCFA @ CR EXECUTE  (Ejecutar la variable T)
    #-- DUP .HEX CR          ( Mostrar direccion de la variable)
    #-- DUP @ .HEX CR        ( Mostrar contenido de la variable)
    #-- DUP 0xBACA SWAP !    (Almacenar un valor nuevo)
    #-- DUP @ .HEX CR        ( Mostrar nuevo valor de la variable)

    #-- Resultado:
    #-- RiscvForth v0.1  15 Jun 2023
    #-- 
    #-- 0x1001034c  Link: 0x10010345 
    #-- 0x10010350  Inmd: 0 
    #-- 0x10010351  NLen: 01
    #-- 0x10010352  Name: T
    #-- 0x10010354  CFA:  0x10010358 
    #-- 0x10010358 : 0xffc40413 
    #-- 0x1001035c : 0x00142023 
    #-- 0x10010360 : 0x00400337 
    #-- 0x10010364 : 0x002a02b7 
    #-- 0x10010368 : 0x00c2d293 
    #-- 0x1001036c : 0x005362b3 
    #-- 0x10010370 : 0x000280e7 
    #-- 0x10010374 : 0x00000004 
    #-- 0x10010378 : 0x00000000 
    #-- 
    #-- 0x10011388 
    #-- 0x00000002 
    #-- 0x0000baca 
    #--  ok

    #-- Valor del offset
    LIT(4)
    USER

    #-- Mostrar info de T
    DOTLWINFO
    

    #-- Obtener la direccion del código de la palabra T (la ultima creada)
    LATEST
    FETCH
    NFATOCFA
    FETCH
    CR

    #-- Ejecutar la variable: Su dirección se deposita en la pila
    EXECUTE

    #-- Imprimir direccion variable
    DUP
    DOTHEX
    CR

    #-- Leer variable 
    DUP
    FETCH
    DOTHEX
    CR

    #-- Escribir un valor
    DUP  
    LIT(0xBACA)  #-- Meter valor
    SWOP
    STORE

    #-- Leer variable
    DUP
    FETCH
    DOTHEX
    CR

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

