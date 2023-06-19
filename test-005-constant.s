    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- 170 CONSTANT .LWINFO    ( Definir la constante T)
    #-- LATEST @ NFATOCFA @ CR  ( Mostrar informacion de T)
    #-- EXECUTE .HEX CR         ( Ejecutar T y mostrar su valor)

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
    #-- 0x10010378 : 0x000000aa 
    #-- 0x1001037c : 0x00000000 
    #-- 
    #-- 0x000000aa 
    #--  ok


    #-- Crear la constante 
    LIT(170)
    CONSTANT

    #-- Mostrar informacion de la constante    
    DOTLWINFO

    #-- Obtener la direccion del código de la palabra T (la ultima creada)
    LATEST
    FETCH
    NFATOCFA
    FETCH
    CR

    #-- Ejecutar la constante: Su valor se deposita en la pila
    EXECUTE
    DOTHEX
    CR

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

