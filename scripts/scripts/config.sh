#!/bin/bash
clear

# Gruvbox colors
RESET="\e[0m"                 # Reset all attributes
GREEN="\e[38;2;142;192;124m"  # #8ec07c
CYAN="\e[38;2;69;133;136m"    # #458588:q
YELLOW="\e[38;2;215;153;33m"  # #d79921
RED="\e[38;2;204;36;29m"      # #cc241d
GRAY="\e[38;2;60;56;54m"      # #3c3836"
BOLD="\e[1m"                  # Bold text


clear

# Missing pkgs, Fix Zsh, refresh Hyprland, move Ass’s  ##
echo "     Running post-boot configuration..." | lsd-print

# Function to display headers with figlet
display_header() {
    clear
    figlet -f smslant "$1"
}

# Initialize checklist array
declare -A checklist

# Helper functions to update checklist
mark_completed() {
    checklist["$1"]="[✔️]"
}

mark_skipped() {
    checklist["$1"]="[✖️ ]"
}

# SDDM Configuration
display_header "SDDM"
echo ""
read -p "  🍬    Would you like to install Sugar-Candy SDDM theme  (y/n)  ? " configure_sddm
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
read -p "  🖥️    Would you like to configure monitor setup  (y/n)  ? " configure_monitor
echo ""
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

# GRUB Theme and Extra Packages
display_header "GRUB  &  Extra  Packages"
echo ""
read -p "  🪱    Would you like to configure GRUB theme  & extra packages  (y/n) ? " configure_grub
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

# Editors Choice Packages
display_header "Editors Choice Packages"
echo ""
read -p "  🫠    Would you like to install Editors Choice packages  (y/n) ? " editors_choice
echo ""
if [[ "$editors_choice" =~ ^[Yy]$ ]]; then
    if  ~/scripts/editors_choice.sh; then
        track_action "Editors Choice Packages"
        mark_completed "Editors Choice Packages"
    else
        mark_skipped "Editors Choice Packages"
    fi
else
    mark_skipped "Editors Choice Packages"
fi

# Shell Configuration
display_header "Shell  Configuration"
echo ""
read -p "Would you like to configure your shell  (y/n) ? " configure_shell
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

# Cleanup
display_header "Cleanup"
echo ""
read -p "  🧹    Would you like to perform a system cleanup  (y/n) ? " perform_cleanup
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

# Display Checklist Summary
clear 
echo -e "\n Configuration Summary:\n"
for section in "${!checklist[@]}"; do
    echo -e "${checklist[$section]} $section"
done

echo -e "\n Configuration Completed Successfully." | lsd-print

# Options for reboot, rerun, or exit
echo " ✔️   Installation is complete." | lsd-print 
echo " Choose an option:" | lsd-print
echo " 1.  󰑎   Rerun this script"
echo " 2.  󰩈   Exit"

# Prompt user for input with a 30-second timeout
read -t 60 -p " Enter your choice (default is exit): " choice
echo ""

# Check the user's input or proceed to the default action
case $choice in
    1)
        echo "  󰑎  Rerunning the script..." | lsd-print
        exec "$0"  # Reruns the current script
        ;;
    2)
        echo "  🚀    Exiting Configuration." | lsd-print
        echo " To close this terminal use:  󰌓  ▏ 󰖳 + Q" | lsd-print
        exit 0
        ;;
    *)
        echo ""
        echo "  ⛔️   No input detected." | lsd-print
        echo " To close this terminal and complete installation use:  󰌓  ▏ 󰖳 + Q" | lsd-print
        ;;


esac





