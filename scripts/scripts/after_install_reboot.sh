#!/bin/bash

## Missing pkgs, Fix Zsh, refresh Hyprland, move Ass’s  ##
echo "Running post-reboot configuration..."

# Install missing packages
yay -S --noconfirm aylurs-gtk-shell sddm-theme-sugar-candy-git

# Fix Zsh
cd ~/scripts && ./zsh_fix.sh

# Refresh dotfiles
cd ~/.dotfiles && git pull

# Update SDDM theme
sudo cp -r ~/.dotfiles/assets/Sugar-Candy/theme.conf /usr/share/sddm/themes/Sugar-Candy
sudo cp ~/.dotfiles/assets/sddm.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds

# Update environment configuration
sudo cp ~/.dotfiles/assets/environment /etc/environment

echo "Post-reboot configuration completed successfully."

# Disable the service after completion
systemctl --user disable after-install-reboot.service

