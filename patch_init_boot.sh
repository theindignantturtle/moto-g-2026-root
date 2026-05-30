#!/bin/sh
##this is meant to be a guide. not a runnable script. byte matches a magisk patched init_boot.img to match the original
##this allows writing patched init_boot through a secure bootloader

avbtool make_vbmeta_image \
    --flags 2 \
    --output vbmeta_disabled.img

1) disable vbmeta --
	a) create blank vbmeta and flash it
		-fastboot flash --disable-verity --disable-verification vbmeta vbmeta_disabled.img
		-fastboot flash --disable-verity --disable-verification vbmeta_system vbmeta_disabled.img
2) unpack init_boot.img and magisk_patched-30700_zzo8x.img
	a) fastboot will not flash images if their size doesnt match. so byte match the images.


mkdir patch2; cd patch2
unpack_bootimg --boot_img ../init_boot.img
unpack_bootimg --boot_img ../magisk_patched-30700_zzo8x.img
cd out
mkdir ramdisk2; cd ramdisk2
cpio -iv < ../ramdisk
lz4 -d ../ramdisk ramdisk.cpio
mkdir ramdisk.cpio_files; cd mkdir ramdisk.cpio_files
find ../ | cpio -o -H newc | lz4 -l - ramdisk_new.lz4
PAD=$((3284363 - $(stat -c%s ramdisk_new.lz4)))
dd if=/dev/zero bs=1 count=$PAD >> ramdisk_new.lz4
mkbootimg \
  --header_version 4 \
  --ramdisk ramdisk_new.lz4 \
  --output init_boot_patched_fixed.img

adb reboot bootloader
fastboot flash init_boot_patched_fixed.img


## --output init_boot_patched_fixed.img IS THE NEW FLASHABLE, PATCHED, INIT_BOOT
