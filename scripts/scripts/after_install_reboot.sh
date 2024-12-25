#!/bin/bash

## Missing pkgs, Fix Zsh, refresh hyprland, move Ass’s  ##

yay -S –noconfirm aylurs-gtk-shell dolphin && 

cd ~/scripts && ./zsh_fix.sh && 
cd ~/.dotfiles && pull &&         

sudo cp -r ~/.dotfiles/assets/Sugar-Candy/theme.conf /usr/share/sddm/themes/Sugar-Candy  &&

sudo cp -r ~/.dotfiles/assets/environment /etc/environment &&
sudo cp ~/.dotfiles/assets/sddm.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds 

