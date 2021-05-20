#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

#sudo reflector -c Germany -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy
read -p "pacman sync"
sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

read -p "firewall"

#git clone https://aur.archlinux.org/paru-bin
# cd pikaur/
# makepkg -si --noconfirm

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm gnome-shell-extension-system76-power-git
#pikaur -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq

# gnome extra  - not included games
sudo pacman -S lightdm gdm gnome sysprof swell-foop polari hitori gnome-usage gnome-tweaks gnome-todo gnome-sudoku gnome-sound-recorder gnome-robots gnome-nettool gnome-multi-writer gnome-games gnome-devel-docs gnome-connections gnome-code-assistance gnome-chess gnome-builder glade ghex geary dconf-editor gnome-software-packagekit-plugin
read -p "gnome install"

sudo pacman -S  firefox archlinux-appstream-data  simplescreenrecorder arc-gtk-theme arc-icon-theme obs-studio vlc


#sudo flatpak install -y spotify
#sudo flatpak install -y kdenlive

sudo systemctl enable lightdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
#sleep 5
#sudo reboot
