#!/bin/bash

mkdir ~/Pictures
cd ~/.dotfiles
stow .config .local ags bat bpytop byobu dunst fastfetch fontconfig fzf ghostty gtk-2.0 gtk-3.0 gtk-4.0 home htop hypr kate kitty kvantum nwg-dock-hyprland nwg-drawer nwg-look oh-my-zsh pacseek pomodorolm qt5ct qt6ct ranger rofi scripts sddm settings SpaceVim tmux vim vlc wal waybar waypaper wlogout xdg-desktop-portal xsettingsd yazi zed znt--adopt
sudo cp ~/.dotfiles/home/hyprland.conf ~/.config/hypr
./stow.sh
cd ~/scripts
./zsh_fix.sh
nohup waypaper --random &>/dev/null &
touch ~/.conf/hypr/hyprland.conf
clear
