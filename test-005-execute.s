    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- : T 65 EMIT ;  ( Definir la palabra T que imprime una A)
    #-- LATEST @ .WINFO CR   ( Mostrar la cabecera de la palabra (debug) )
    #-- LATEST @ NFATOCFA @  ( Obtener la direccion del codigo maquina de T)
    #-- EXECUTE CR           ( Ejecutar la palabra)

    #-- Resultado:
    #-- RiscvForth v0.1  15 Jun 2023
    #-- 
    #-- 0x10010328  Link: 0x1001031d 
    #-- 0x1001032c  Inmd: 0 
    #-- 0x1001032d  NLen: 01
    #-- 0x1001032e  Name: T
    #-- 0x10010330  CFA:  0x10010334 
    #-- 
    #-- A
    #--  ok

    #-- Esta prueba también se puede realizar interactivamente
    #-- 1.- Crear la palabra de test T    : T 65 EMIT ;
    #-- 2.- Obtener su direccion viendo .LWINFO
    #-- 3.- Meter en la pila la direccion (de momento en decimal)
    #-- 4.- Llamar a EXECUTE:
    #--
    #-- RiscvForth v0.1  15 Jun 2023
    #--  ok
    #-- : T 65 EMIT ;
    #--   ok
    #-- T
    #--  A ok
    #-- .LWINFO
    #-- 
    #-- 0x1001033c  Link: 0x10010335 
    #-- 0x10010340  Inmd: 0 
    #-- 0x10010341  NLen: 01
    #-- 0x10010342  Name: T
    #-- 0x10010344  CFA:  0x10010348 
    #-- 0x10010348 : 0xffc40413 
    #-- 0x1001034c : 0x00142023 
    #-- 0x10010350 : 0x00400337 
    #-- 0x10010354 : 0x001882b7 
    #-- 0x10010358 : 0x00c2d293 
    #-- 0x1001035c : 0x005362b3 
    #-- 0x10010360 : 0x000280e7 
    #-- 0x10010364 : 0x00000041 
    #-- 0x10010368 : 0x00400337 
    #-- 0x1001036c : 0x0067c2b7 
    #-- 0x10010370 : 0x00c2d293 
    #-- 0x10010374 : 0x005362b3 
    #-- 0x10010378 : 0x000280e7 
    #-- 0x1001037c : 0x00042083 
    #-- 0x10010380 : 0x00440413 
    #-- 0x10010384 : 0x00008067 
    #--  ok
    #-- 268501832
    #--   ok
    #-- EXECUTE
    #--  A ok

    #-- Definimos una palabra de prueba T, que imprime la 'A'
    COLON

    COMMALIT('A')
    COMMAXT(do_emit)

    SEMI

    #-- Mostrar informacion de la cabeza de la palabra
    #-- .WINFO -->  Print word info
    LATEST
    FETCH
    DOTWINFO
    CR

    #-- Obtener la direccion del código de la palabra T (la ultima creada)
    LATEST
    FETCH
    NFATOCFA
    FETCH

    #-- Ejecutar!!
    EXECUTE
    CR

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

