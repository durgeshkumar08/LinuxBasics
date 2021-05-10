# this is clone of https://gitlab.com/eflinux/arch-basic/-/tree/master
# modified for nvidia wayland 
# Arch Basic Install Commands-Script

In this repository you will find packages-scripts for the base install of Arch Linux and the Gnome, KDE, Cinnamon and Xfce desktop environments. More to come for Windows Managers soon.
Modify the packages to your liking, make the script executable with chmod +x scriptname and then run with ./scriptname.
A script for the base install on MBR/Legacy will be available soon.
Remember that the first part of the Arch Linux install is manual, that is you will have to partition, format and mount the disk yourself. Install the base packages and make sure to inlcude git so that you can clone the repository in chroot.

A small summary:

1. If needed, load your keymap
* ls /usr/share/kbd/keymaps/**/*.map.gz
* loadkeys de-latin1
* fonts /usr/share/kbd/consolefonts/ to change setfont

* timedatectl set-ntp true
* timedatectl status

2. Prepare the disk
* lsblk
* cfdisk /dev/nvme0n1

* mksf.btrfs -f /dev/nvme0n1p6
* mount /dev/nvme0n1p6 /mnt
* cd /mnt
* btrfs subvolume create @
* btrfs subvolume create @home
* btrfs subvolume create @var
* cd
* umount /mnt
* mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@ /dev/nvme0n1p6 /mnt
* mkdir /mnt{boot,home,var}
* mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@home /dev/nvme0n1p6 /mnt/home
* mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@var /dev/nvme0n1p6 /mnt/var
* mount /dev/nvme0n1p1 /mnt/boot
* lsblk


3. Install the base packages into /mnt 
* pacstrap /mnt base linux linux-firmware git nano intel-ucode btrfs-progs

4. Generate the FSTAB file

* genfstab -U /mnt >> /mnt/etc/fstab

5. Chroot in with 
* arch-chroot /mnt
* cat /etc/fstab

6. Download the git repository with 
* git clone https://github.com/durgeshkumar08/linuxbasics
* install install-uefi.sh

* change root and user password


* exit
* umount -a
* reboot

7. setup zramd

* git clone https://aur.archlinux.org/paru-bin
* cd paru-bin
* makepkg -si
* paru -S zramd
* sudo nano /etc/default/zramd
* max ram to 2048
*  sudo systemctl enable --now zramd.service
* lsblk

8 install gnome
* cp -r /linuxbasics .
* install gnome.
* reboot

9 install timeshift
* paru -S timeshift-bin timeshift-autosnap


