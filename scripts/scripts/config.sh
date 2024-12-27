#!/bin/bash

## Missing pkgs, Fix Zsh, refresh Hyprland, move Ass’s  ##
echo "Running post-boot configuration..."

# Refresh dotfiles
cd ~/.dotfiles && git pull


# Post install packages that get missed
if ! command -v figlet &>/dev/null; then
    echo "Installing packages ..."
    sudo pacman -Sy --noconfirm figlet aylurs-gtk-shell sddm-theme-sugar-candy-git pacseek waybar python-pywal16 python-pywalfox
fi

# Update SDDM and Pacman theme
sudo rm -r -f /usr/lib/sddm/sddm.conf.d || log_error "Failed to remove old sddm config"
sudo cp ~/.dotfiles/assets/sddm.conf.d /usr/lib/sddm/ || log_error "Failed to move sddm.conf.d"
sudo cp ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
sudo cp -r ~/.dotfiles/assets/theme.conf /usr/share/sddm/themes/sugar-candy || log_error "Failed to move theme.conf"
sudo cp ~/.dotfiles/assets/sddm.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds  || log_error "Failed to move sddm.jpg"

cd ~/scripts && ./after_install_reboot.sh && ./hypr_swap.sh && ./zsh_fix.sh

# Function to display a header with figlet
display_header() {
    clear
    figlet -f smslant "$1"
}

# Function to check if an action was performed
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

# SDDM and Pacman Configuration
# display_header "SDDM & Pacman"
# read -p "Do you want to configure SDDM and Pacman (y/n)? " configure_sddm_pacman
# if [[ "$configure_sddm_pacman" =~ ^[Yy]$ ]]; then
#     ~/scripts/assets.sh
#     track_action "SDDM and Pacman configuration"
# fi

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
echo
read -p "Would you like to reboot your system now (y/n)? " reboot_choice
if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
    sudo reboot
else
    echo "Exiting to terminal."
    exit 0
fi

