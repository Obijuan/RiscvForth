#!/bin/sh
#-- Assemble and run riscvForth interpreter

#----- Parameters:
#-- nc : No copyright (no message printed)
#-- mc CompactTextAtZero  : Compact memory map (not the standar)
#-- smc: Self Modifying 
#-- dump --> Volcar el segmento de codigo al fichero binario firmware.bin
java -jar rars1_6.jar nc smc dump .text Binary firmware.bin  \
          rvforth.s primitives.s dependencies.s high.s test.s 
