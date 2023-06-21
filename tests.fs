\-- Es necesario pasar los test en base hexadecimal
HEX

\ ==========  F.3.1 Basic Assumptions
T{ -> }T        ( Start with a clean slate )

( Test if any bits are set; Answer in base 1 )
T{ : BITSSET? IF 0 0 ELSE 0 THEN ; -> }T  

T{  0 BITSSET? -> 0 }T  ( Zero is all bits clear )

T{  1 BITSSET? -> 0 0 }T	 ( Other numbers have at least one bit )
T{ -1 BITSSET? -> 0 0 }T

\ ========== F.3.2 Booleans

\ ====== F.6.1.0720 AND
T{ 0 0 AND -> 0 }T
T{ 0 1 AND -> 0 }T
T{ 1 0 AND -> 0 }T
T{ 1 1 AND -> 1 }T

\ ===== F.6.1.0950 CONSTANT
T{ 123 CONSTANT X123 -> }T
T{ X123 -> 123 }T
T{ : EQU CONSTANT ; -> }T
T{ X123 EQU Y123 -> }T
T{ Y123 -> 123 }T

0  CONSTANT 0S  ( Numero binario con todo ceros )
-1 CONSTANT 1S  ( Numero binario con todo unos )

\ ===== F.6.1.1720 INVERT
T{ 0S INVERT -> 1S }T
T{ 1S INVERT -> 0S }T

\ ====== F.6.1.0720 AND
T{ 0 INVERT 1 AND -> 1 }T
T{ 1 INVERT 1 AND -> 0 }T

T{ 0S 0S AND -> 0S }T
T{ 0S 1S AND -> 0S }T
T{ 1S 0S AND -> 0S }T
T{ 1S 1S AND -> 1S }T

\ ======== F.6.1.1980 OR
T{ 0S 0S OR -> 0S }T
T{ 0S 1S OR -> 1S }T
T{ 1S 0S OR -> 1S }T
T{ 1S 1S OR -> 1S }T

\ ======== F.6.1.2490 XOR
T{ 0S 0S XOR -> 0S }T
T{ 0S 1S XOR -> 1S }T
T{ 1S 0S XOR -> 1S }T
T{ 1S 1S XOR -> 0S }T

\ ===================== F.3.3 Shifts =======================
1S 1 RSHIFT INVERT CONSTANT MSB  ( Definir constante MSB: 0x80000000 )
T{ MSB BITSSET? -> 0 0 }T

\ ========= F.6.1.0320 2*
T{   0S 2*       ->   0S }T
T{    1 2*       ->    2 }T
T{ 4000 2*       -> 8000 }T
T{   1S 2* 1 XOR ->   1S }T
T{  MSB 2*       ->   0S }T






( ********************* TODO ************************** )

\ ========== F.6.1.0330 2/
T{          0S 2/ ->   0S }T
T{           1 2/ ->    0 }T
T{        4000 2/ -> 2000 }T
T{          1S 2/ ->   1S }T \ MSB PROPOGATED
T{    1S 1 XOR 2/ ->   1S }T
T{ MSB 2/ MSB AND ->  MSB }T


\ ========== F.6.1.0330 2/
T{          0S 2/ ->   0S }T
T{           1 2/ ->    0 }T
T{        4000 2/ -> 2000 }T
T{          1S 2/ ->   1S }T \ MSB PROPOGATED
T{    1S 1 XOR 2/ ->   1S }T
T{ MSB 2/ MSB AND ->  MSB }T


\ ========== F.6.1.1805 LSHIFT
T{   1 0 LSHIFT ->    1 }T
T{   1 1 LSHIFT ->    2 }T
T{   1 2 LSHIFT ->    4 }T
T{   1 F LSHIFT -> 8000 }T      \ BIGGEST GUARANTEED SHIFT
T{  1S 1 LSHIFT 1 XOR -> 1S }T
T{ MSB 1 LSHIFT ->    0 }T


\ ========== F.6.1.2162 RSHIFT
T{    1 0 RSHIFT -> 1 }T
T{    1 1 RSHIFT -> 0 }T
T{    2 1 RSHIFT -> 1 }T
T{    4 2 RSHIFT -> 1 }T
T{ 8000 F RSHIFT -> 1 }T	               \ Biggest
T{  MSB 1 RSHIFT MSB AND ->   0 }T    \ RSHIFT zero fills MSBs
T{  MSB 1 RSHIFT     2*  -> MSB }T

\ ====================== F.3.4 Numeric notation