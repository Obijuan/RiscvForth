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
#-- Palabra 0
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
#-- https://forth-standard.org/standard/core/VARIABLE
    .word link3
    .byte 0
link4:
    .byte 8
    .ascii "VARIABLE"
    .word do_variable

#-- Palabra 5
#-- https://forth-standard.org/standard/core/CONSTANT
    .word link4
    .byte 0
link5:
    .byte 8
    .ascii "CONSTANT"
    .word do_constant

#-- Palabra 6
    .word link5
    .byte 0
link6:
    .byte 4
    .ascii "USER"
    .word do_user

#-- Palabra 7
#-- https://forth-standard.org/standard/core/EMIT
    .align 2
    .word link6
    .byte 0
link7:
    .byte 4
    .ascii "EMIT"
    .word do_emit






#-- Palabra 8: VARIABLE de prueba, creada directamente en el diccionario
    .align 2
    .word link7
    .byte 0
link8:
    .byte 1
    .ascii "A"
    .word do_a





#-- Palabra 9: CONSTANTE
    .align 2
    .word link8
    .byte 0
link9:
    .byte 3
    .ascii "ESC"
    .word do_esc


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
link42:
    .byte 1
    .ascii "+"
    .word do_plus

#-- Palabra 43
    .align 2
    .word link42
    .byte 0
link43:
    .byte 1
    .ascii "@"
    .word do_fetch

#-- Palabra 44
    .align 2
    .word link43
    .byte 0
link44:
    .byte 1
    .ascii "!"
    .word do_store

#-- Palabra 45
    .align 2
    .word link44
    .byte 0
link45:
    .byte 1
    .ascii "."
    .word do_dot
    
#-- Palabra 46
    .align 2
    .word link45
    .byte 0
link46:
    .byte 2
    .ascii ".S"
    .word do_dots

#-- Palabra 47
    .align 2
    .word link46
    .byte 0
link47:
    .byte 2
    .ascii "U0"
    .word do_u0

#-- Palabra 48
    .align 2
    .word link47
    .byte 0
link48:
    .byte 3
    .ascii "NOP"
    .word do_null

#-- Palabra 49
    .align 2
    .word link48
    .byte 0
link49:
    .byte 5
    .ascii "WORDS"
    .word do_words

#-- Palabra 50
    .align 2
    .word link49
    .byte 0
link50:
    .byte 4
    .ascii "BASE"
    .word do_base

#-- Palabra 51
    .align 2
    .word link50
    .byte 0
link51:
    .byte 1
    .ascii "I"
    .word do_ii

#-- Palabra 52
    .align 2
    .word link51
    .byte 0
link52:
    .byte 7
    .ascii "DECIMAL"
    .word do_decimal

#-- Palabra 53
    .align 2
    .word link52
    .byte 0
link53:
    .byte 5
    .ascii "DEPTH"
    .word do_depth

#-- Palabra 54
    .align 2
    .word link53
    .byte 0
link54:
    .byte 1
    .byte 92   #-- \
    .word do_comment

#-- Palabra 55
    .align 2
    .word link54
    .byte 0
link55:
    .byte 5
    .ascii "CELLS"
    .word do_cells

#-- Palabra 56
    .align 2
    .word link55
    .byte 0
link56:
    .byte 5
    .ascii "ALLOT"
    .word do_allot

#-- Palabra 57
    .align 2
    .word link56
    .byte 0
link57:
    .byte 14
    .ascii "ACTUAL-RESULTS"
    .word do_actual_results

#-- Palabra 58
    .align 2
    .word link57
    .byte 0
link58:
    .byte 4
    .ascii ".HEX"
    .word do_dothex

#-- Palabra 59
    .align 2
    .word link58
    .byte 0
link59:
    .byte 4
    .ascii "DUMP"
    .word do_dump

#-- Palabra 60
    .align 2
    .word link59
    .byte 0
link60:
    .byte 4
    .ascii "SWAP"
    .word do_swop

#-- Palabra 61
    .align 2
    .word link60
    .byte 0
link61:
    .byte 2
    .ascii "T{"
    .word do_tlbrac

#-- Palabra 62
    .align 2
    .word link61
    .byte 0
link62:
    .byte 2
    .ascii "->"
    .word do_arrow

#-- Palabra 63
    .align 2
    .word link62
    .byte 0
link63:
    .byte 2
    .ascii "}T"
    .word do_rbracT

#-- Palabra 64
    .align 2
    .word link63
    .byte 0
link64:
    .byte 3
    .ascii "AND"
    .word do_and

#-- Palabra 65
    .align 2
    .word link64
    .byte 0
link65:
    .byte 6
    .ascii "INVERT"
    .word do_invert

#-- Palabra 66
    .align 2
    .word link65
    .byte 0
link66:
    .byte 2
    .ascii "OR"
    .word do_or

#-- Palabra 67
    .align 2
    .word link66
    .byte 0
link67:
    .byte 3
    .ascii "XOR"
    .word do_xor

#-- Palabra 68
    .align 2
    .word link67
    .byte 0
link68:
    .byte 6
    .ascii "RSHIFT"
    .word do_rshift

#-- Palabra 69
    .align 2
    .word link68
    .byte 0
link69:
    .byte 3
    .ascii "HEX"
    .word do_hex

#-- Palabra 70
    .align 2
    .word link69
    .byte 0
link70:
    .byte 2
    .ascii "2*"
    .word do_twostar

#-- Palabra 71
    .align 2
    .word link70
    .byte 0
link71:
    .byte 2
    .ascii "2/"
    .word do_twoslash

#-- Palabra 72
    .align 2
    .word link71
    .byte 0
link72:
    .byte 6
    .ascii "LSHIFT"
    .word do_lshift

#-- Palabra 73
    .align 2
    .word link72
    .byte 0
link73:
    .byte 2
    .ascii "0="
    .word do_zeroequal

#-- Palabra 74
    .align 2
    .word link73
    .byte 0
link74:
    .byte 1
    .ascii "="
    .word do_equal

#-- Palabra 75
    .align 2
    .word link74
    .byte 0
link75:
    .byte 2
    .ascii "0<"
    .word do_zeroless

#-- Palabra 76
    .align 2
    .word link75
    .byte 0
link76:
    .byte 1
    .ascii "<"
    .word do_less

#-- Palabra 77
    .align 2
    .word link76
    .byte 0
link77:
    .byte 2
    .ascii "U<"
    .word do_uless

#-- Palabra 78
    .align 2
    .word link77
    .byte 0
link78:
    .byte 3
    .ascii "MIN"
    .word do_min

#-- Palabra 79
    .align 2
    .word link78
    .byte 0
link79:
    .byte 3
    .ascii "MAX"
    .word do_max

#-- Palabra 80
    .align 2
    .word link79
    .byte 0
link80:
    .byte 4
    .ascii "DROP"
    .word do_drop

#-- Palabra 81
    .align 2
    .word link80
    .byte 0
link81:
    .byte 4
    .ascii "OVER"
    .word do_over

#-- Palabra 82
    .align 2
    .word link81
    .byte 0
link82:
    .byte 5
    .ascii "2DROP"
    .word do_twodrop

#-- Palabra 83
    .align 2
    .word link82
    .byte 0
link83:
    .byte 4
    .ascii "2DUP"
    .word do_twodup

#-- Palabra 84
    .align 2
    .word link83
    .byte 0
link84:
    .byte 5
    .ascii "2OVER"
    .word do_twoover

#-- Palabra 85
    .align 2
    .word link84
    .byte 0
link85:
    .byte 5
    .ascii "2SWAP"
    .word do_twoswap

#-- Palabra 86
    .align 2
    .word link85
    .byte 0
link86:
    .byte 4
    .ascii "?DUP"
    .word do_qdup

#-- Palabra 87
    .align 2
    .word link86
    .byte 0
link87:
    .byte 2
    .ascii ">R"
    .word do_tor

#-- Palabra 88
    .align 2
    .word link87
    .byte 0
link88:
    .byte 2
    .ascii "R>"
    .word do_rfrom

#-- Palabra 89
    .align 2
    .word link88
    .byte 0
lastword:
link89:
    .byte 2
    .ascii "R@"
    .word do_rfetch



#-- Fin del diccionario
.align 2
enddict: #-- Aqui comienza el codigo del usuario