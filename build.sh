export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

## uboot
cd u-boot-2020.07
make udoo_neo_defconfig
make clean
make -j8
cd ..

