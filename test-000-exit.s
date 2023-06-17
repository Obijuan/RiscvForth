    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- : T EXIT ;      ( Definir palabra nueva )
    #-- .LWWINFO        (Mostrar informacion de la nueva palabra)

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
    #-- 0x10010368 : 0x001982b7 
    #-- 0x1001036c : 0x00c2d293 
    #-- 0x10010370 : 0x005362b3 
    #-- 0x10010374 : 0x000280e7 
    #-- 0x10010378 : 0x00042083 
    #-- 0x1001037c : 0x00440413 
    #-- 0x10010380 : 0x00008067 
    #-- 0x10010384 : 0x00000000 
    #--  ok

    COLON  #--  :
    
    #-- Compilar EXIT
    COMMAXT(do_exit)

    SEMI #-- ;

    #-- Mostrar informacion de la palabra (Cabecera y código)
    DOTLWINFO

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

