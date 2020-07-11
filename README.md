# UDOO Neo
    
This repo is latest custom linux bootup in udoo neo.
    
## Development setup    
    
```
sudo apt-get update
sudo apt-get install gawk wget git diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat libsdl1.2-dev xterm picocom ncurses-dev lzop \
     gcc-arm-linux-gnueabihf
```
    
## Bootloader : u-boot
    
Latest u-boot bootloader u-boot-2020-07 is cross compiled and ported in the device.
    
```
$ export ARCH=arm 
$ export CROSS_COMPILE=arm-linux-gnueabihf-
$ make udoo_neo_defconfig
$ make -j8
```

### flashing bootloader
    
Unmount all the partition from of the mmc card
```
$ lsblk
$ sudo dd if=SPL of=/dev/mmcblk0 bs=1K seek=1
$ sudo dd if=u-boot.img of=/dev/mmcblk0 bs=1K seek=69
```

