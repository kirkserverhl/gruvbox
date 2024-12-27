#!/bin/bash

echo "Running post-boot configuration..."

# Refresh dotfiles
cd ~/.dotfiles && git pull

# Update SDDM and Pacman theme
sudo rm -r -f /usr/lib/sddm/sddm.conf.d || log_error "Failed to remove old sddm config"
sudo cp ~/.dotfiles/assets/sddm.conf.d /usr/lib/sddm/ || log_error "Failed to move sddm.conf.d"
sudo cp ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
sudo cp -r ~/.dotfiles/assets/theme.conf /usr/share/sddm/themes/sugar-candy || log_error "Failed to move theme.conf"
sudo cp ~/.dotfiles/assets/sddm.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds || log_error "Failed to move sddm.jpg"

# Install missing packages
echo "Installing missing packages..."
yay -S --noconfirm aylurs-gtk-shell sddm-sugar-candy-git xdotool figlet
yay -R --noconfirm dolphin

# Fix Zsh
echo "Configuring Zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Update SDDM theme
# sudo cp -r ~/.dotfiles/assets/Sugar-Candy/theme.conf /usr/share/sddm/themes/sugar-candy
# sudo cp ~/.dotfiles/assets/sddm.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds

# Update environment configuration
sudo cp ~/.dotfiles/assets/environment /etc/environment

# Refresh Hyprland configuration
echo "Refreshing Hyprland configuration..."
cd ~/.dotfiles || exit
touch ~/.config/hypr/hyprland.conf > /dev/null 2>&1
rm ~/.config/hypr/hyprland.conf > /dev/null 2>&1
stow hypr --adopt > /dev/null 2>&1
waypaper --random > /dev/null 2>&1
touch ~/.config/hypr/hyprland.conf > /dev/null 2>&1

# Function to display a header with figlet
display_header() {
    clear
    figlet -f smslant "$1"
}

# Function to track performed actions
track_action() {
    checklist+=("$1")
}

# Initialize checklist
checklist=()

# Shell Configuration
display_header "Shell"
read -p "Do you want to configure your shell (y/n)? " configure_shell
if [[ "$configure_shell" =~ ^[Yy]$ ]]; then
    ~/scripts/shell.sh
    track_action "Shell configuration"
fi

# Monitor Setup
display_header "Monitor Setup"
read -p "Do you want to configure monitor setup (y/n)? " configure_monitor
if [[ "$configure_monitor" =~ ^[Yy]$ ]]; then
    ~/scripts/monitor.sh
    track_action "Monitor setup"
fi

# Cleanup
display_header "Cleanup"
read -p "Do you want to perform a system cleanup (y/n)? " perform_cleanup
if [[ "$perform_cleanup" =~ ^[Yy]$ ]]; then
    ~/scripts/cleanup.sh
    track_action "System cleanup"
fi

# GRUB Theme and Extra Packages
display_header "GRUB & Extra Packages"
read -p "Do you want to set up GRUB theme and additional packages (y/n)? " configure_grub
if [[ "$configure_grub" =~ ^[Yy]$ ]]; then
    echo "Setting up GRUB theme and installing extra packages..."
    curl -fsSL https://christitus.com/linux | sh
    track_action "GRUB theme and extra packages setup"
fi

# Display completed actions
display_header "Summary"
echo "The following actions were performed:"
if [ ${#checklist[@]} -eq 0 ]; then
    echo "- No actions performed."
else
    for action in "${checklist[@]}"; do
        echo "- $action"
    done
fi

echo "Post-reboot configuration completed successfully."

# Offer to reboot or quit
read -p "Would you like to reboot your system now (y/n)? " reboot_choice
if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
    sudo reboot
else
    echo "Exiting to terminal."
    exit 0
fi

