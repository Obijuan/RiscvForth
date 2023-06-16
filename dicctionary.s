.global enddict, lastword

#-------------------------
#-- Diccionario
#-------------------------
#-- ESTRUCTURA:
#--
#-- LINK   : 1 celda. Direccion a la siguiente palabra
#--          (la última tiene un valor 0)
#-- INMED  : Es una palabra inmediata (0=normal, 1=inmediata)
#-- NAME   : Campo nombre.Compuesto por:
#--   LEN  : 1 byte. Longitud del nombre de la palabra
#--   Chars: n bytes. Los caracteres del nombre de la palabra
#-- CODE   : Direccion al codigo de esa palabra
#--          En el rars no se puede poner en el segmento de datos
#--          un jal, por eso ponemos solo la direccion
#----------------------------------------------------------

#-- Primera palabra
#-- https://forth-standard.org/standard/core/EXIT
      .word 0 
      .byte 0
link0:          #-- Enlace a esta palabra
      .byte 4   #-- Longitud del nombre
      .ascii "EXIT" #-- Nombre
      .word do_exit 

#-- Palabra 1
    .word link0
    .byte 0
link1:
    .byte 3
    .ascii "lit"
    .word do_lit  #-- Direccion al codigo

#-- Palabra 2
#-- https://forth-standard.org/standard/tools/BYE
    .word link1
    .byte 0
link2:
    .byte 3
    .ascii "BYE"
    .word do_bye

#-- Palabra 3
#-- https://forth-standard.org/standard/core/EXECUTE
    .word link2
    .byte 0
link3:
    .byte 7
    .ascii "EXECUTE"
    .word do_execute




#-- Palabra 4
    .align 2
    .word link3
    .byte 0
link4:
    .byte 1
    .ascii "."
    .word do_dot



#-- Palabra 5
    .align 2
    .word link4
    .byte 0
link5:
    .byte 2
    .ascii ".S"
    .word do_dots


#-- Palabra 6
    .align 2
    .word link5
    .byte 0
link6:
    .byte 3
    .ascii "NOP"
    .word do_null


#-- Palabra 7
    .align 2
    .word link6
    .byte 0
link7:
    .byte 5
    .ascii "WORDS"
    .word do_words


#-- Palabra 8: VARIABLE
    .align 2
    .word link7
    .byte 0
link8:
    .byte 1
    .ascii "A"
    .word do_a
do_a:  
     .word 0xffc40413  #-- addi s0,s0, -4
     .word 0x00142023  #-- sw ra, 0(s0)
     .word 0x004002b7  #-- li t0, 0x00400004
     .word 0x00428293
     .word 0x000280e7  #-- jalr ra,t0,0
     .word 0           #-- PARAMETRO: La variable

#-------------------------------------------
#-- Codigo a ejecutar para leer la variable
#-- almacenada en el campo de parametros
#-- 0xffc40413  #-- addi s0,s0, -4
#-- 0x00142023  #-- sw ra, 0(s0)
#-- 0x004002b7  #-- li t0, 0x00400004
#-- 0x00428293  
#-- 0x000280e7  #-- jalr ra,t0,0

#-- Palabra 9: CONSTANTE
    .align 2
    .word link8
    .byte 0
link9:
    .byte 3
    .ascii "ESC"
    .word do_esc
do_esc:  
    .word 0xffc40413  #--addi s0, s0, -4
    .word 0x00142023  #--sw ra, 0(s0)
    .word 0x004002b7  #--li t0, 0x0040001C
    .word 0x01c28293
    .word 0x000280e7  #--jalr ra,t0,0
    .word 0xCAFE  #-- CONSTANTE

#--------------------------------------------
#-- Codigo a ejecutar para leer la constante
#-- almacenada en el campo de parametros
#--  0xffc40413  #--addi s0, s0, -4
#--  0x00142023  #--sw ra, 0(s0)
#--  0x004002b7  #--li t0, 0x0040001C
#--  0x01c28293
#--  0x000280e7  #--jalr ra,t0,0

#-- Palabra 10
    .align 2
    .word link9
    .byte 0
link10:
    .byte 1
    .ascii ":"
    .word do_colon


#-- Palabra 11
    .align 2
    .word link10
    .byte 1
link11:
    .byte 1
    .ascii ";"
    .word do_semi

#-- Palabra 12
    .align 2
    .word link11
    .byte 0
link12:
    .byte 5
    .ascii "TEST5"
    .word do_test5

#-- Palabra 13
    .align 2
    .word link12
    .byte 0
link13:
    .byte 3
    .ascii "ONE"
    .word do_l1
do_l1:
    .word 0xffc40413  #--addi s0, s0, -4
    .word 0x00142023  #--sw ra, 0(s0)
    .word 0x004002b7  #--li t0, 0x0040001C
    .word 0x01c28293
    .word 0x000280e7  #--jalr ra,t0,0
    .word 1  #-- CONSTANTE

#-- Palabra 14
    .align 2
    .word link13
    .byte 0
link14:
    .byte 7
    .ascii ".LWINFO"
    .word do_dotlwinfo

#-- Palabra 15
    .align 2
    .word link14
    .byte 0
link15:
    .byte 3
    .byte 0x22  #-- Caracter "
    .ascii "HI"
    .word do_quotehi

#-- Palabra 16
    .align 2
    .word link15
    .byte 1  #-- IMMED
link16:
    .byte 2
    .ascii "IF"
    .word do_if

#-- Palabra 17
    .align 2
    .word link16
    .byte 1  #-- IMMED
link17:
    .byte 4
    .ascii "THEN"
    .word do_then

#-- Palabra 18
    .align 2
    .word link17
    .byte 1  #-- IMMED
link18:
    .byte 4
    .ascii "ELSE"
    .word do_else

#-- Palabra 19
    .align 2
    .word link18
    .byte 0
link19:
    .byte 4
    .ascii "EMIT"
    .word do_emit

#-- Palabra 20
    .align 2
    .word link19
    .byte 0
link20:
    .byte 5
    .ascii "SPACE"
    .word do_space

#-- Palabra 21
    .align 2
    .word link20
    .byte 1   #-- IMMED
link21:
    .byte 2
    .ascii "DO"
    .word do_do

#-- Palabra 22
    .align 2
    .word link21
    .byte 1   #-- IMMED
link22:
    .byte 4
    .ascii "LOOP"
    .word do_loop

#-- Palabra 23
    .align 2
    .word link22
    .byte 0
link23:
    .byte 2
    .ascii "CR"
    .word do_cr

#-- Palabra 24
    .align 2
    .word link23
    .byte 0
link24:
    .byte 4
    .ascii "TYPE"
    .word do_type

#-- Palabra 25
    .align 2
    .word link24
    .byte 1
link25:
    .byte 2
    .ascii "S"
    .byte 0x22  #-- "
    .word do_squote

#-- Palabra 26
    .align 2
    .word link25
    .byte 1
link26:
    .byte 2
    .ascii "."  #-- ."
    .byte 0x22 
    .word do_dotquote

#-- Palabra 27
 .align 2
    .word link26
    .byte 0
link27:
    .byte 4
    .ascii "EESC"
    .word do_eesc

#-- Palabra 28
 .align 2
    .word link27
    .byte 0
link28:
    .byte 3
    .ascii "CLS"
    .word do_cls

#-- Palabra 29
 .align 2
    .word link28
    .byte 0
link29:
    .byte 4
    .ascii "HOME"
    .word do_home

#-- Palabra 30
 .align 2
    .word link29
    .byte 1 #-- IMMED
link30:
    .byte 1
    .ascii "("
    .word do_paren

#-- Palabra 31
 .align 2
    .word link30
    .byte 0
link31:
    .byte 3
    .ascii "DUP"
    .word do_dup

#-- Palabra 32
 .align 2
    .word link31
    .byte 0
link32:
    .byte 1
    .ascii ">"
    .word do_greater

#-- Palabra 33
 .align 2
    .word link32
    .byte 0
link33:
    .byte 2
    .ascii "1-"
    .word do_oneminus

#-- Palabra 34
 .align 2
    .word link33
    .byte 1
link34:
    .byte 7
    .ascii "RECURSE"
    .word do_recurse

#-- Palabra 35
 .align 2
    .word link34
    .byte 0
link35:
    .byte 4
    .ascii "QUIT"
    .word do_quit

#-- Palabra 36
 .align 2
    .word link35
    .byte 0
link36:
    .byte 1
    .ascii ","
    .word do_comma

#-- Palabra 37
 .align 2
    .word link36
    .byte 0
link37:
    .byte 1
    .ascii ","
    .word do_comma

#-- Palabra 38
 .align 2
    .word link37
    .byte 1 #-- IMMED
link38:
    .byte 1
    .ascii "["
    .word do_leftbracket

#-- Palabra 39
 .align 2
    .word link38
    .byte 1 #-- IMMED
link39:
    .byte 1
    .ascii "]"
    .word do_rightbracket

#-- Palabra 40
 .align 2
    .word link39
    .byte 0
link40:
    .byte 5
    .ascii "XEMIT"
    .word do_xemit

#-- Palabra 41
 .align 2
    .word link40
    .byte 0
link41:
    .byte 3
    .ascii "ROT"
    .word do_rot

#-- Palabra 42
    .align 2
    .word link41
    .byte 0
lastword:
link42:
    .byte 1
    .ascii "+"
    .word do_plus
    


#-- Fin del diccionario
.align 2
enddict: #-- Aqui comienza el codigo del usuario