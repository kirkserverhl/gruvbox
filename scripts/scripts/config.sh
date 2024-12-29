#!/bin/bash

## Missing pkgs, Fix Zsh, refresh Hyprland, move Ass’s  ##
echo "Running post-boot configuration..."

# Refresh dotfiles
cd ~/.dotfiles && git pull


# Post install packages that get missed
if ! command -v figlet &>/dev/null; then
    echo "Installing packages ..."
    sudo pacman -Sy --noconfirm figlet aylurs-gtk-shell pacseek waybar waypaper python-pywal16 python-pywalfox
fi

# Update Screenshot folder and Pacman theme
sudo cp ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
sudo mkdir ~/Pictures

cd ~/scripts && ./after_install_reboot.sh && ./hypr_swap.sh && ./zsh_fix.sh && ./sddm_candy_install.sh

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

# Display checklist summary with tte beams
print_checklist_tte() {
    checklist_file="/tmp/config_checklist.txt"
    echo -e "\\nConfiguration Summary:\\n" > "$checklist_file"
    echo "✔ Configuration Completed Successfully" >> "$checklist_file"
    if command -v tte &>/dev/null; then
        cat "$checklist_file" | tte beams
    else
        cat "$checklist_file"
    fi
    rm "$checklist_file"
}

print_checklist_tte

# Ask the user to reboot or close the terminal
echo -e "\\nConfiguration complete. Would you like to reboot now? [y/N]"
read -r reboot_choice
if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
    sudo reboot
else
    echo -e "\\nYou can close this terminal by pressing Win + Q."
fi

