#fix win7 mbr
#look at partitiontable with fdisk -l or blkid and edit /dev/sda

pacman -S syslinux

#if the package got installed use following to write the MBR.
sleep 5
dd if=/usr/lib/syslinux/mbr.bin of=/dev/sda