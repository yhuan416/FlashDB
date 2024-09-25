#!/bin/sh

make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabihf- KERNEL=/home/yhuan/workspace/stm32mp13/linux/linux-5.15.24 clean
make V=1 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabihf- KERNEL=/home/yhuan/workspace/stm32mp13/linux/linux-5.15.24
