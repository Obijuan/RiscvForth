    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- VARIABLE .LWINFO        ( Crear variable T, y mostrar su informacion)
    #-- LATEST @ NFATOCFA @ CR  ( Obtener la direccion del codigo de T)
    #-- EXECUTE                 ( Acceder a la variable)
    #-- DUP .HEX CR             ( Ver direccion de la variable)
    #-- DUP @ .HEX CR           ( Imprimir valor de la variable)
    #-- DUP 0xBACA SWAP !       ( Escribir un valor en la variable)
    #-- DUP @ .HEX CR           ( Imprimir valor de la variable)
    #-- .LWINFO                 ( Mostrar otra vez info de T )

    #-- Resultado:
    #-- RiscvForth v0.1  15 Jun 2023
    #-- 
    #-- 0x10010350  Link: 0x10010349 
    #-- 0x10010354  Inmd: 0 
    #-- 0x10010355  NLen: 01
    #-- 0x10010356  Name: T
    #-- 0x10010358  CFA:  0x1001035c 
    #-- 0x1001035c : 0xffc40413 
    #-- 0x10010360 : 0x00142023 
    #-- 0x10010364 : 0x00400337 
    #-- 0x10010368 : 0x002542b7 
    #-- 0x1001036c : 0x00c2d293 
    #-- 0x10010370 : 0x005362b3 
    #-- 0x10010374 : 0x000280e7 
    #-- 0x10010378 : 0x00000000 
    #-- 0x1001037c : 0x00000000 
    #-- 
    #-- 0x10010378 
    #-- 0x00000000 
    #-- 0x0000baca 
    #-- 
    #-- 0x10010350  Link: 0x10010349 
    #-- 0x10010354  Inmd: 0 
    #-- 0x10010355  NLen: 01
    #-- 0x10010356  Name: T
    #-- 0x10010358  CFA:  0x1001035c 
    #-- 0x1001035c : 0xffc40413 
    #-- 0x10010360 : 0x00142023 
    #-- 0x10010364 : 0x00400337 
    #-- 0x10010368 : 0x002542b7 
    #-- 0x1001036c : 0x00c2d293 
    #-- 0x10010370 : 0x005362b3 
    #-- 0x10010374 : 0x000280e7 
    #-- 0x10010378 : 0x0000baca 
    #-- 0x1001037c : 0x00000000 
    #--  ok


    #-- Crear la variable T
    VARIABLE

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

    #-- Leer variable (inicialmente debe estar a 0)
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
    
    
    #-- Mostrar otra vez info de T
    DOTLWINFO


    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

