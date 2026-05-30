# Moto G 2026 Root Guide

Here are the steps I took to root my moto g 2026. I'm sharing this so that anyone who wants to, can root their motog. Government mass surveillance is intrusive and oppressive. The data gathered is stored indefinitely and used against you. Used to take money out your pocket and even to decidee if you get to live or die. For real.

For the init_boot_patched.img to work exactly like mine, your device and security update must match exactly. If your doesn't match, you have to get the firmware yourself. First unlock the bootloader and download your exact firmware through Motorolla's website. 

The vbmeta_disabled.img was made by:
	avbtool make_vbmeta_image \
		--flags 2 \
		--output vbmeta_disabled.img

Once you have patched init_boot.img and disabled AVB (by flashing vbmeta and vbmeta_system with the disable flags), you're free to flash init_boot. Verification will fail if the new image's size youre writing doesnt exactly match init_boot.img that was already there. The next set of commands padds the image to byte match it. It will suceede to flash and you will boot into root. 

device name: moto g - 2026; 128GB
RAM 4GB+4GB(Boost)
Android 16
Network lock; unlocked
build: W1WN36.18-114
host machine: arch linux amd64

  SW Version: nevada_g_sys-user 16 W1WN36.18-114 
  MBM Version: MBM-3.1-nevada_g_vext-e781a-W1WN36.18-114-d2725
  Modem Version: MT6835N_NR17.RC.MP.V18.6.6.P133.02.337R
  SW Display Build ID: W1WN36.18-114

Unlocking the bootloader and rooting your device may:

- Void your warranty
- Factory reset your device
- Cause boot loops if done incorrectly
- Disable some security features

Proceed at your own risk.

## Device Information

Model: Moto G 2026
Firmware: [exact build number]
Android Version: [version]

## Files Included

- init_boot_patched.img
- vbmeta_disabled.img
- Magisk-v30.7.apk
- patch_init_boot.sh

## Requirements

- Unlocked bootloader
- ADB and Fastboot installed
- USB cable
- Linux or Windows PC

## Root Steps

1. Enable OEM Unlocking.
2. Unlock bootloader.
3. Reboot to bootloader.
4. Run commands
