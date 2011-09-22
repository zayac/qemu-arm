#!/bin/sh

arm-none-eabi-as -o add.o add.s
arm-none-eabi-ld -Ttext=0x0 -o add.elf add.o
arm-none-eabi-objcopy -O binary add.elf add.bin
dd if=/dev/zero of=flash.bin bs=4096 count=4096
dd if=add.bin of=flash.bin bs=4096 conv=notrunc
