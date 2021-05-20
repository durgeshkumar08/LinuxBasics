#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_UK.UTF-8" >> /etc/locale.conf
echo "KEYMAP=uk" >> /etc/vconsole.conf
echo "durgesh-pc" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 durgesh-pc.localdomain durgesh-pc" >> /etc/hosts
echo root:password | chpasswd
read -p "local set"

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub grub-btrfs efibootmgr os-prober networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi 
read -p "set 1 install"
pacman -S xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack 
read -p "set 2 install"
pacman -S bash-completion openssh rsync reflector acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font
read -p "set 3 install"
# pacman -S --noconfirm xf86-video-amdgpu
pacman -S nvidia nvidia-utils nvidia-settings xdg-desktop-portal-impl
read -p "nvidia install"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
read -p "grub config"

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid
read -p "enable service"
useradd -m durgesh
echo durgesh:password | chpasswd
usermod -aG wheel,libvirt durgesh

echo "durgesh ALL=(ALL) ALL" >> /etc/sudoers.d/durgesh


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




