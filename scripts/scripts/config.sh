#!/bin/bash

# Ensure figlet is installed
if ! command -v figlet &>/dev/null; then
    echo "Installing figlet..."
    sudo pacman -Sy --noconfirm figlet
fi

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
display_header "SDDM & Pacman"
read -p "Do you want to configure SDDM and Pacman (y/n)? " configure_sddm_pacman
if [[ "$configure_sddm_pacman" =~ ^[Yy]$ ]]; then
    ~/scripts/assets.sh
    track_action "SDDM and Pacman configuration"
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

# Offer to reboot or quit
echo
read -p "Would you like to reboot your system now (y/n)? " reboot_choice
if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
    sudo reboot
else
    echo "Exiting to terminal."
    exit 0
fi

