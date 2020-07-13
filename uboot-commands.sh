```
# The most important command is 
help
# This can also be used to see more information on a specific command
help i2c

# This is a command added to U-Boot by TS to read the baseboard ID on our 
# System on Module devices
bbdetect
echo ${baseboard} ${baseboardid} 
# The echo will return something similar to:
# TS-8390 2

# Boots into the binary at $loadaddr.  The loaded file needs to have
# the U-Boot header from mkimage.  A uImage already contains this.
bootm
# Boots into the binary at $loadaddr, skips the initrd, specifies
# the FDT addrress so Linux knows where to find the device tree
bootm ${loadaddr} - ${fdtaddr}

# Boot a Linux zImage loaded at $loadaddr
bootz
# Boot in to a Linux zImage at $loadaddr, skip initrd, specifies
# the FDT address to Linux knows where to find the device tree
bootz ${loadaddr} - ${fdtaddr}

# Get a DHCP address
dhcp
# This sets ${ipaddr}, ${dnsip}, ${gatewayip}, ${netmask}
# and ${ip_dyn} which can be used to check if the dhcp was successful

# These commands are used for scripting:
false # do nothing, unsuccessfully
true # do nothing, successfully

# This command can set fuses in the processor
# Setting fuses can brick the unit, will void the warranty,
# and should not be done in most cases
fuse

# GPIO can be manipulated from U-Boot.  Keep in mind that the IOMUX 
# in U-Boot is only setup enough to boot the device, so not all pins will
# be set to GPIO mode out of the box.  Boot to the full operating system
# for more GPIO support.
# GPIO are specified in bank and IO in this manual.  U-Boot uses a flat numberspace,
# so for bank 2 DIO 25, this would be number (32*2)+25=89
# Note that on some products, bank 1 is the first bank
# Set 2_25 low
gpio clear 83
# Set 2_25 high
gpio set 83
# Read 2_25
gpio input 83

# Control LEDs
led red on
led green on
led all off
led red toggle

# This command is used to copy a file from most devices
# Load kernel from SD
load mmc 0:1 ${loadaddr} /boot/uImage
# Load Kernel from eMMC
load mmc 1:1 ${loadaddr} /boot/uImage
# Load kernel from USB
usb start
load usb 0:1 ${loadaddr} /boot/uImage
# Load kernel from SATA
sata init
load sata 0:1 ${loadaddr} /boot/uImage

# View the FDT from U-Boot
load mmc 0:1 ${fdtaddr} /boot/imx6q-ts4900.dtb
fdt addr ${fdtaddr}
fdt print

# It is possible to blindly jump to any memory location
# This is similar to bootm, but it does not require
# the use of the U-Boot header
load mmc 0:1 ${loadaddr} /boot/custombinary
go ${loadaddr}

# Browse fat, ext2, ext3, or ext4 filesystems:
ls mmc 0:1 /

# Access memory like devmem in Linux, read/write arbitrary memory
# using mw and md
# write
mw 0x10000000 0xc0ffee00 1
# read
md 0x10000000 1

# Test memory.
mtest

# Check for new SD card
mmc rescan
# Read SD card size
mmc dev 0
mmcinfo
# Read eMMC Size
mmc dev 1
mmcinfo

# The NFS command is like 'load', but used over the network
dhcp
env set serverip 192.168.0.11
nfs ${loadaddr} 192.168.0.11:/path/to/somefile

# Test ICMP
dhcp
ping 192.168.0.11

# Reboot
reset

# SPI access is through the SF command
# Be careful with sf commands since
# this is where U-Boot and the FPGA bitstream exist
# Improper use can render the board unbootable
sf probe

# Delay in seconds
sleep 10

# Load HUSH scripts that have been created with mkimage
load mmc 0:1 ${loadaddr} /boot/ubootscript
source ${loadaddr}

# Most commands have return values that can be used to test
# success, and HUSH scripting supports comparisons like
# test in Bash, but much more minimal
if load mmc 1:1 ${fdtaddr} /boot/uImage;
	then echo Loaded Kernel
else
	echo Could not find kernel
fi

# Commands can be timed with "time"
time sf probe

# Print U-Boot version/build information
version
```
