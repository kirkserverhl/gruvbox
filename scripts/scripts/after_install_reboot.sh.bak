#!/bin/bash

## Missing pkgs, Fix Zsh, refresh Hyprland, move Ass’s  ##
echo "Running post-reboot configuration..."

# Install missing packages
yay -S --noconfirm aylurs-gtk-shell sddm-sugar-candy-git xdotool
yay -R --noconfirm dolphin

# Fix Zsh
cd ~/scripts && ./zsh_fix.sh

# Update SDDM theme
sudo cp -r ~/.dotfiles/assets/Sugar-Candy/theme.conf /usr/share/sddm/themes/sugar-candy
sudo cp ~/.dotfiles/assets/sddm.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds

# Update environment configuration
sudo cp ~/.dotfiles/assets/environment /etc/environment

echo "Post-reboot configuration completed successfully."
