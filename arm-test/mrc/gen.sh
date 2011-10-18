#!/bin/sh

as -o test.o test.s
ld -Ttext=0x0 -o test.elf test.o
objcopy -O binary test.elf test.bin
dd if=/dev/zero of=flash.bin bs=4096 count=4096
dd if=test.bin of=flash.bin bs=4096 conv=notrunc

#arm-none-eabi-as -o test.o test.s
#arm-none-eabi-ld -Ttext=0x0 -o test.elf test.o
#arm-none-eabi-objcopy -O binary test.elf test.bin
#dd if=/dev/zero of=flash.bin bs=4096 count=4096
#dd if=test.bin of=flash.bin bs=4096 conv=notrunc
