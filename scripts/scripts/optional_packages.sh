#!/bin/bash

# Function to keep sudo active
keep_sudo_alive() {
    while true; do
        sudo -v
        sleep 50
    done
}

# Start sudo in the background
if ! sudo -v; then
    echo "Sudo credentials required to continue."
    exit 1
fi

keep_sudo_alive &
sudo_pid=$!

# Function to clean up the background sudo process
cleanup_sudo() {
    kill "$sudo_pid"
}
trap cleanup_sudo EXIT

# Function to display a header with figlet
display_header() {
    clear
    figlet -f smslant "$1"
}

# Initialize checklist
checklist=()

# Function to install Ghossty Terminal
display_header "Ghossty Terminal"
read -p " Do you want to install Ghossty Terminal (y/n)? " install_ghossty
if [[ "$install_ghossty" =~ ^[Yy]$ ]]; then
    echo "Installing Ghossty Terminal packages..."
    yay -S --noconfirm ghostty ghostty-shell-integration ghostty-terminfo
    checklist+=("Ghossty Terminal")
    echo "Ghossty Terminal installation completed."
fi

# Function to install Surfshark VPN
display_header "Surfshark VPN"
read -p "󱙳 Do you want to install Surfshark VPN (y/n)? " install_surfshark
if [[ "$install_surfshark" =~ ^[Yy]$ ]]; then
    echo "Installing Surfshark VPN..."
    yay -S --noconfirm surfshark-client
    checklist+=("Surfshark VPN")
    echo "Surfshark VPN installation completed."
fi

# Function to install qBittorrent Enhanced
display_header "qBittorrent"
read -p "󰰽 Do you want to install qBittorrent (y/n)? " install_qbittorent
if [[ "$install_qbittorent" =~ ^[Yy]$ ]]; then
    echo "Installing qBittorrent Enhanced..."
    yay -S --noconfirm qbittorrent-enhanced
    checklist+=("qBittorrent Enhanced")
    echo "qBittorrent Enhanced installation completed."
fi

# Function to install Disk Utility
display_header "Disk Utility"
read -p "󱛟 Do you want to install Disk Utility (y/n)? " install_disk
if [[ "$install_disk" =~ ^[Yy]$ ]]; then
    echo "Installing Disk Utility..."
    yay -S --noconfirm gnome-disk-utility
    checklist+=("Disk Utility")
    echo "Disk Utility installation completed."
fi

# Function to install Game Package
display_header "Game Package"
read -p " Do you want to install Game Package (y/n)? " install_game
if [[ "$install_game" =~ ^[Yy]$ ]]; then
    echo "Installing Game Package..."
    yay -S --noconfirm wolfenstein3d
    checklist+=("Game Package")
    echo "Game Package installation completed."
fi

# Display checklist summary with tte beams
print_checklist_tte() {
    checklist_file="/tmp/package_checklist.txt"
    echo -e "\\nConfiguration Summary:\\n" > "$checklist_file"

    if [[ ${#checklist[@]} -eq 0 ]]; then
        echo " No Packages Installed" >> "$checklist_file"
    else
        # Add each installed section with its respective icon
        for section in "${checklist[@]}"; do
            case $section in
                "Ghossty Terminal") echo " Ghossty Terminal" >> "$checklist_file" ;;
                "Surfshark VPN") echo "󱙳 Surfshark VPN" >> "$checklist_file" ;;
                "qBittorrent Enhanced") echo "󰰽 qBittorrent" >> "$checklist_file" ;;
                "Disk Utility") echo "󱛟 Disk Utility" >> "$checklist_file" ;;
                "Game Package") echo " Game Package" >> "$checklist_file" ;;
            esac
        done
    fi

    if command -v tte &>/dev/null; then
        cat "$checklist_file" | tte beams
    else
        cat "$checklist_file"
    fi
    rm "$checklist_file"
}

print_checklist_tte

# Options for reboot, rerun, or exit
echo ""
echo "Installation is complete. Choose an option:"
echo "1. Rerun this script"
echo "2. Exit"
echo ""

# Prompt user for input with a 30-second timeout
read -t 60 -p "Enter your choice (default is exit): " choice

# Check the user's input or proceed to the default action
case $choice in
    1)
        echo "Rerunning the script..."
        exec "$0"  # Reruns the current script
        ;;
    2)
        echo "Exiting. System will not reboot."
        exit 0
        ;;
    *)
        echo "No input detected. Exiting in 60 seconds..."
        sudo exit
        ;;
esac

