sudo dd if=u-boot-2020.07/SPL of=/dev/mmcblk0 bs=1K seek=1
sudo dd if=u-boot-2020.07/u-boot.img of=/dev/mmcblk0 bs=1K seek=6
