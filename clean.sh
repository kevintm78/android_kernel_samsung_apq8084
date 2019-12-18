#!/bin/bash


rm -rf AnyKernel3/dtb
rm -rf AnyKernel3/zImage
rm -rf AnyKernel3/modules/system/lib/modules/*.ko
rm -rf output/
make clean
make mrproper

read -t 10 -p "Clean Ccache, 10sec timeout (y/n)?";
if [ "$REPLY" == "y" ]; then
ccache -c
fi
