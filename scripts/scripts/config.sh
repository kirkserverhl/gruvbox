./#!/bin/bash
##  |__| ____   _______/  |______  |  | |  |        _____|  |__
##  |  |/    \ /  ___/\   __\__  \ |  | |  |       /  ___/  |  \
##  |  |   |  \\___ \  |  |  / __ \|  |_|  |__     \___ \|   Y  \
##  |__|___|  /____  > |__| (____  /____/____/ /\ /____  >___|  /
##          \/     \/            \/            \/      \/     \/
#################################################################
RESET="\e[0m"                	# Reset  ##  Notes:
GREEN="\e[38;2;142;192;124m" 	# 8ec07c ##
CYAN="\e[38;2;69;133;136m"   	# 458588 ##
YELLOW="\e[38;2;215;153;33m" 	# d79921 ##
RED="\e[38;2;204;36;29m"     	# cc241d ##
GRAY="\e[38;2;60;56;54m"     	# 3c3836 ##
BOLD="\e[1m"                 	# Bold   ##
###########################################
## clear #####################################



display_header() {
    # clear
    figlet -f ~/.local/share/fonts/Graffiti.flf "$1"
}

####  Initialize checklist array  ##########
declare -A checklist
mark_completed() {
    checklist["$1"]="[✔️]"
}
mark_skipped() {
    checklist["$1"]="[✖️ ]"
}

### Move Assets #############################

echo -e "\n     Running Post Install Configuration..." | lsd-print
{
    # sudo cp ~/.dotfiles/assets/pacman.conf /etc/
    mkdir ~/Pictures
    cd ~/scripts
    ./sddm_theme.sh
    cd ~/.dotfiles
    ## rm -r -f ~/.config/hypr/hyprland.conf && stow hypr --adopt && cp -f ~/.config/hypr/conf/hypr_stable.conf ~/.config/hypr/hyprland.conf
    nohup waypaper --random &>/dev/null &
    touch ~/.conf/hypr/hyprland.conf
    echo -e "\n     Loading Nvim Plugins ... \n"
    echo -e " ✔️    Nvim Configured \n" | lsd-print
    nohup nvim --headless &>/dev/null &
    clear
}

### Shell Configuration ###

display_header "Shell  Setup" | lsd-print
echo ""
read -p "  🐢   Would you like to configure your shell  (y/n) ? " configure_shell
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
clear

## SDDM Configuration  #######################

display_header "SDDM" | lsd-print
read -p "   🍬     Would you like to install Sugar-Candy SDDM theme  (y/n)  ? " configure_sddm
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
clear

### Monitor Setup #####

display_header "Monitors" | lsd-print
echo ""
read -p "   🖥️    Would you like to configure monitor setup  (y/n)  ? " configure_monitor
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
clear

##### GRUB Theme and Extra Packages #######
display_header "GRUB" | lsd-print
echo ""
read -p "  🪱    Would you like to configure GRUB theme & extra packages (y/n)? " configure_grub
echo ""

if [[ "$configure_grub" =~ ^[Yy]$ ]]; then
    if sudo -v; then  # Checks if the user has sudo privileges
        sudo ~/scripts/sddm_theme.sh  # Run the script with sudo
        track_action "Grub Theme"
        mark_completed "Grub Theme"
    else
        echo "You need sudo privileges to configure the GRUB theme."
        mark_skipped "Grub Theme"
    fi
else
    mark_skipped "Grub Theme"
fi
clear


### Editors Choice ####
display_header "Editors Choice" | lsd-print
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
clear

### Cleanup  ###

display_header "Cleanup" | lsd-print
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
clear

## Display Checklist Summary  #####
echo -e "\n  📜    Configuration Summary:"   | lsd-print
for section in "${!checklist[@]}"; do
    echo -e "${checklist[$section]} $section"
done

echo -e "\n Configuration Completed Successfully." | lsd-print

## Options for reboot, rerun, or ###

echo -e "  ✔️   Installation is complete.\n"
echo -e " Choose an option:"                | lsd-print
echo -e " 1.  🔙  Rerun this script \n"
echo -e " 2.  🚀   Exit \n"

read -p "Enter your choice: " choice
echo -e ""
# Check the user's input or proceed to the default action
case $choice in
    1)
        echo -e"  🔙  Rerunning the script..." | lsd-print
        exec "$0"  # Reruns the current script
        ;;

    2)
        echo -e "  🚀   Exiting..." | lsd-print
        # Ensure ~/config_check.sh exists and set its value to "off"
        echo "off" > ~/config_check.sh
        exit 0
        ;;
    *)
        echo -e "❌ Invalid choice. Exiting by default." | lsd-print
        echo "off" > ~/config_check.sh  # Ensure the file is set to "off" on invalid input as well
        exit 1
        ;;
esac

