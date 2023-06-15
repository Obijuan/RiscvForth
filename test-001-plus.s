    #------------------------------------------------------------------------
    #-- RiscvForth
    #-- Programa de prueba
    #------------------------------------------------------------------------
    .include "init.s"

    .text

    #-- Inicializacion del sistema
    COLD

    #-- Programa Forth a probar
    #-- 1 1 + .

    #-- Se compila directamente al ensamblar
    LIT(1)  # 1    ( Insertar 1 en la pila )
    LIT(1)  # 1    ( Insertar 1 en la pila )
    PLUS    # +    ( Sumar numeros de la pila )
    DOT     # .    ( Sacar resultado e imprimirlo en la consola )

    #-- Fin ejecución directa
    XSQUOTE(4," ok\n")
    TYPE

	#-- Terminar
	BYE

