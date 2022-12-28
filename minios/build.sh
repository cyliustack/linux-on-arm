#!/bin/bash
rm *.o kernel kernel8.img qemu.log
aarch64-linux-gnu-gcc -c boot.s -o boot.o
aarch64-linux-gnu-gcc -std=c99 -ffreestanding -mgeneral-regs-only -c main.c
aarch64-linux-gnu-ld -nostdlib -T link.ids -o kernel boot.o main.o
aarch64-linux-gnu-objcopy -O binary kernel kernel8.img
qemu-system-aarch64 -M raspi3b -serial stdio -kernel kernel8.img -D qemu.log -d in_asm 
