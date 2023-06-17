    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar:
    #-- : T lit [ 170 , ]  ;     ( Definir palabra nueva T)
    #-- .LWINFO                  ( (Mostrar informacion de la nueva palabra))

    COLON  #--  :
    
    #-- Añadir llamada a la palabra lit
    COMMAXT(do_lit2)

    #-- Añadir el literal
    LIT(170)   #-- Lo metemos en la pila
    COMMA      #-- Lo añadimos

    #-- No añadir instrucciones de ret. El literal es el ultimo elemento
    SEMI2 #-- ;

    #-- Mostrar informacion de la palabra (Cabecera y código)
    DOTLWINFO

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

    QUIT

	#-- Terminar
	BYE

