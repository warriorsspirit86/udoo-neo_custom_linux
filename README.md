# UDOO Neo
    
This repo is latest custom linux bootup in udoo neo.
    
## Development setup    
    
```
sudo apt-get update
sudo apt-get install gawk wget git diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat libsdl1.2-dev xterm picocom ncurses-dev lzop \
     gcc-arm-linux-gnueabihf
```

## Partition MMC
    
```
Device         Boot Start      End  Sectors  Size Id Type
/dev/mmcblk0p1       2048    67583    65536   32M  e W95 FAT16 (LBA)
/dev/mmcblk0p2      67584 15359999 15292416  7.3G 83 Linux
```
    
Command to start partitioning:
```
sudo fdisk /dev/mmcblk0
```
    
## Bootloader : u-boot
    
Latest u-boot bootloader u-boot-2020-07 is cross compiled and ported in the device.
    
```
$ export ARCH=arm 
$ export CROSS_COMPILE=arm-linux-gnueabihf-
$ make udoo_neo_defconfig
$ make -j8
```

## Kernel : linux-5.7.7
    
Configure kernel for udoo:
```
ARCH=arm make udoo_neo_defconfig
```
For any kernel configuration needed:
```
ARCH=arm make menuconfig
```
Build kernel and create zImage, compile dtbs and modules:        
```
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make zImage -j8
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make dtbs -j8
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make modules -j8
```

### flashing bootloader
    
Unmount all the partition from of the mmc card
```
$ lsblk
$ sudo dd if=SPL of=/dev/mmcblk0 bs=1K seek=1
$ sudo dd if=u-boot.img of=/dev/mmcblk0 bs=1K seek=69
```
    
### flashing kernel
```
BOOT_PARTITION=/path/to/boot-partition
ROOT_PARTITION=/path/to/root-partition

cp arch/arm/boot/zImage $BOOT_PARTITION
cp arch/arm/boot/dts/*.dtb $BOOT_PARTITION/dts
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make firmware_install modules_install INSTALL_MOD_PATH=$ROOT_PARTITION
```

## Logs ref

### printenv
    
```
baudrate=115200
boot_fdt=try
bootargs=console=ttymxc0,115200 root=/dev/nfs ip=dhcp nfsroot=:,v3,tcp
bootcmd=mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; fi; udooinit; if run loadimage; then run mmcboot; else runi
bootdelay=1
bootscript=echo Running bootscript from mmc ...; env import -t ${loadaddr} ${filesize};
console=ttymxc0
ethprime=FEC0
fdt_addr=0x83000000
fdt_file=/boot/dts/imx6sx-udoo-neo-extended-hdmi-m4.dtb
fdt_high=0xffffffff
fileaddr=82000000
filesize=a3
get_cmd=dhcp
image=/boot/zImage
initrd_high=0xffffffff
ip_dyn=yes
loadaddr=0x82000000
loadbootscript=fatload mmc ${mmcdev}:1 ${loadaddr} ${script};
loadfdt=ext2load mmc ${mmcdev}:${mmcpart} ${fdt_addr} ${fdt_file}
loadimage=ext2load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image}
m4_enabled=true
m4mmcargs=uart_from_osc clk_ignore_unused cpuidle.off=1
mmcargs=setenv bootargs console=${console},${baudrate} root=${mmcroot} rootfstype=${mmcrootfstype} ${m4mmcargs} loglevel=1 consoleblank=0
mmcautodetect=no
mmcboot=echo Booting from mmc ...; run mmcargs; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if run loadfdt; then bootz ${loadaddr} - ${;
mmcdev=0
mmcpart=2
mmcroot=/dev/mmcblk0p2 rootwait rw
mmcrootfstype=ext4
netargs=setenv bootargs console=${console},${baudrate} root=/dev/nfs ip=dhcp nfsroot=${serverip}:${nfsroot},v3,tcp
netboot=echo Booting from net ...; run netargs; if test ${ip_dyn} = yes; then setenv get_cmd dhcp; else setenv get_cmd tftp; fi; ${get_cmd} ${image};;
script=uEnv.txt
stderr=serial
stdin=serial
stdout=serial
video_output=hdmi

Environment size: 2037/8188 bytes
```
    
## Prebuilt image
    
* https://www.udoo.org/downloads/
