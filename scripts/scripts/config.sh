#!/bin/bash

## Missing pkgs, Fix Zsh, refresh Hyprland, move Ass’s  ##
echo " Running post-boot configuration..."

# Function to display headers with figlet
display_header() {
    clear
    figlet -f smslant "$1"
}

echo ""
echo "  Setting up Nvim..."
echo ""
# Add this part for nvim configuration
echo "[✔] Begin configuring Nvim"
nohup nvim --headless &>/dev/null &  # Run nvim in the background silently
echo ""

# Refresh dotfiles
# cd ~/.dotfiles && git pull

# Maike Pictures folder for screenshot
# sudo mkdir ~/Pictures

# Post install packages that get missed
if ! command -v figlet &>/dev/null; then
    echo "󰏖 Installing packages ..."
    sudo pacman -Sy --noconfirm figlet aylurs-gtk-shell pacseek waybar waypaper python-pywal16 python-pywalfox
fi

# Update Screenshot folder and Pacman theme
sudo cp ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"

#cd ~/scripts && nohup ./sddm_candy_install.sh && nohup ./after_install_reboot.sh && nohup ./hypr_swap.sh && nohup ./zsh_fix.sh && nohup ./pictures

cd ~/scripts && ./sddm_candy_install.sh && ./zsh_fix.sh  && ./hypr_swap.sh   && mkdir ~/Pictures #nohup ./nohup.sh

# Initialize checklist array
declare -A checklist

# Helper functions to update checklist
mark_completed() {
    checklist["$1"]="[✔]"
}

mark_skipped() {
    checklist["$1"]="[✘]"
}

# SDDM Configuration
display_header "SDDM"
echo ""
read -p "󱥰  Do you want to install Sugar-Candy SDDM theme (y/n)? " configure_sddm
if [[ "$configure_sddm" =~ ^[Yy]$ ]]; then
    if ~/scripts/sddm_candy_install.sh; then
        track_action "SDDM setup"
        mark_completed "SDDM Configuration"
    else
        mark_skipped "SDDM Configuration"
    fi
else
    mark_skipped "SDDM Configuration"
fi

# Monitor Setup
display_header "Monitor  Setup"
echo ""
read -p "󱄄  Do you want to configure monitor setup (y/n)? " configure_monitor
if [[ "$configure_monitor" =~ ^[Yy]$ ]]; then
    if ~/scripts/monitor.sh; then
        track_action "Monitor setup"
        mark_completed "Monitor Setup"
    else
        mark_skipped "Monitor Setup"
    fi
else
    mark_skipped "Monitor Setup"
fi

# Cleanup
display_header "Cleanup"
echo ""
read -p "󰃢  Do you want to perform a system cleanup (y/n)? " perform_cleanup
if [[ "$perform_cleanup" =~ ^[Yy]$ ]]; then
    if ~/scripts/cleanup.sh; then
        track_action "System cleanup"
        mark_completed "Cleanup"
    else
        mark_skipped "Cleanup"
    fi
else
    mark_skipped "Cleanup"
fi

# GRUB Theme and Extra Packages
display_header "GRUB  &  Extra  Packages"
echo ""
read -p "󰕮  Do you want to configure GRUB theme and install extra packages (y/n)? " configure_grub
if [[ "$configure_grub" =~ ^[Yy]$ ]]; then
    if echo "Setting up GRUB theme and installing extra packages..."
    curl -fsSL https://christitus.com/linux | sh; then
        track_action "Grub Install"
        mark_completed "Grub Install"
    else
        mark_skipped "Grub Install"
    fi
else
    mark_skipped "Grub Install"
fi

# Shell Configuration
display_header "Shell  Configuration"
echo ""
read -p "󰳗  Do you want to configure your shell (y/n)? " configure_shell
if [[ "$configure_shell" =~ ^[Yy]$ ]]; then
    if ~/scripts/shell.sh; then
    	track_action "Shell Configuration"
      mark_completed "Shell Configuration"
    else
        mark_skipped "Shell Configuration"
    fi
else
    mark_skipped "Shell Configuration"
fi

# Display Checklist Summary
clear 
echo -e "\nConfiguration Summary:\n"
for section in "${!checklist[@]}"; do
    echo -e "${checklist[$section]} $section"
done
echo ""

echo -e "\nConfiguration Completed Successfully."
echo ""

# Options for reboot, rerun, or exit
echo "Configuration is complete!"
echo ""
echo "Choose an option:"
echo ""
echo "1. 󰑎  Rerun this script"
echo "2. 󰩈  Exit"
echo ""

# Prompt user for input with a 30-second timeout
read -t 60 -p "Enter your choice : " choice
echo ""

# Check the user's input or proceed to the default action
case $choice in
    1)
        echo "Rerunning the script..."
        exec "$0"  # Reruns the current script
        ;;
    2)
        echo "Exiting Configuration."
        echo ""
        echo "To close this terminal use  󰌓  ▏ 󰖳 + Q"
        exit 0
        ;;
    *)
        echo ""
        echo "No input detected. 
        
        To close this terminal and complete installation use  󰌓  ▏ 󰖳 + Q"
        ;;



esac



