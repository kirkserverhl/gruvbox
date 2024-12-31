#!/bin/bash
clear
# Checklist to track completed sections
declare -A checklist
checklist=(
	[git_and_yay]=false
	[install_packages]=false
	[configuration]=false
	[cron_job]=false
	[post_configuration]=false
)

# Function to print status messages
log_status() {
	echo "[INFO] $1"
}

# Function to print error messages
log_error() {
	echo "[ERROR] $1"
}

# Function to print the checklist
print_checklist_tte() {
    checklist_file="/tmp/checklist.txt"
    echo -e "\\nInstallation Summary:\\n" > "$checklist_file"
    for section in "${!checklist[@]}"; do
        if [ "${checklist[$section]}" = true ]; then
            echo "✔ $section" >> "$checklist_file"
        else
            echo "✘ $section" >> "$checklist_file"
        fi
    done

    # Display the checklist using tte beams
    if command -v tte &>/dev/null; then
        cat "$checklist_file" | tte beams
    else
        cat "$checklist_file"
    fi

    # Clean up temporary file
    rm "$checklist_file"
}


# Function to add a cron job
setup_cron_job() {
	(crontab -l 2>/dev/null; echo "0 */12 * * * ~/scripts/cleanup.sh") | crontab -
	if [ $? -eq 0 ]; then
    	checklist[cron_job]=true
	else
    	checklist[cron_job]=false
	fi
}

# Section 1: Git and Yay Setup
{
	log_status "Installing Git and Yay..."
	sudo pacman -S --noconfirm git || log_error "Failed to install git"
	git clone https://aur.archlinux.org/yay.git || log_error "Failed to clone yay"
	cd yay
	makepkg -si --noconfirm || log_error "Failed to build and install yay"
	cd ..
	checklist[git_and_yay]=true
} || checklist[git_and_yay]=false

# Section 2: Install Packages
{
	log_status "Installing packages..."
	yay -Syyu --noconfirm || log_error "Failed to update package database"

	PACKAGES=(
    	alacritty  amd-ucode base base-devel blueprint-compiler bluez bpytop brightnessctl btrfs-progs cliphist cmake cmatrix cbonsai-git
    	duf dunst efibootmgr eza fastfetch figlet firefox fortune-mod fortune-mod-hackers fortune-mod-archlinux fzf git
    	gnome-text-editor go grim grimblast-git
    	gst-plugin-pipewire gum htop hyprpolkitagent hyprpicker hyprshade hyprcursor hyprpaper hypridle hyprgraphics  hyprlang hyprutils hyprwayland-scanner
    	imagemagick intel-media-driver iwd kcalc kitty libpulse libva-intel-driver linux linux-firmware lsd lsd-print-git lua
    	meson nemo nemo-emblems nemo-preview nemo-terminal neovim neovim-lspconfig neovim-web-devicons-git network-manager-applet networkmanager
    	noto-fonts noto-fonts-emoji nwg-look otf-fira-sans otf-font-awesome pacseek pacman-mirrorlist pinta pipewire pipewire-alsa
    	pipewire-jack pipewire-pulse pomodorolm prettier python-pywal16 python-pywalfox python-pillow python-hyprpy python-vlc qt5-base
    	qt5-graphicaleffects qt5-wayland qt6-wayland qt6ct-kde rofi-wayland sdm-sugar-candy-git
    	slurp smartmontools sof-firmware starship stow timeshift timeshift-autosnap tmux ttf-sharetech-mono-nerd unzip vala vim
    	vlc vlc-materia-skin-git vulkan-intel vulkan-radeon wl-clipboard wl-clipboard-history-git wget wireless_tools
    	wireplumber wofi xclip xdg-desktop-portal-hyprland xdg-utils xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vmware
    	xorg-xhost xorg-server xorg-xinit xorg-wayland  waypaper waybar yazi zig zoxide zram-generator zsh-autosuggestions-git
    	zsh wlogout python-terminaltexteffects
	)

	yay -S --noconfirm "${PACKAGES[@]}" || log_error "Failed to install packages"
	checklist[install_packages]=true
} || checklist[install_packages]=false
clear
# Section 3: Configuration
{
	log_status "Applying configurations..."
	sudo cp ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
	
	cd ~/.dotfiles || log_error "Failed to enter .dotfiles directory"

	STOW_DIRS=("ags" "alacritty" "bat" "bpytop" "byobu" "dunst" "fastfetch" "fontconfig" "fzf" "gtk-3.0" "gtk-4.0" "home"
    	"htop" "hypr" "kitty" "nemo" "nvim" "nwg-look" "pacseek" "pomodorolm" "qt6ct" "rofi" "scripts" "sddm" "settings" "systemd" "vlc"
    	"wal" "waybar" "waypaper" "wlogout" "xsettingsd" "yazi" "znt" ".config" "oh-my-zsh")

	for dir in "${STOW_DIRS[@]}"; do
    	stow "$dir" || log_error "Failed to stow $dir"
	done

	checklist[configuration]=true
} || checklist[configuration]=false
clear
# Section 4: Starting Cron Job
{
	log_status "Setting up cron job..."
	setup_cron_job
} || checklist[cron_job]=false

clear
# Print checklist and before post configuration
clear
print_checklist_tte
echo ""

# Section 5: Post-Configuration
{
	log_status "Running post-configuration scripts..." 
	echo ""
	echo "DO NOT CLOSE THIS TERMINAL!!"

	# Run post-configuration scripts in a new Alacritty terminal
	alacritty --hold -e bash -c "
		cd ~/scripts || exit 1;
		./config.sh || exit 1;
		./hypr_swap.sh > /dev/null 2>&1 & disown;  # Run hypr_swap.sh in the background
		
	" || log_error "Failed to run post-configuration scripts"

	checklist[post_configuration]=true
} || checklist[post_configuration]=false

clear
echo ""
echo " Hyprland Gruvbox Installation is Complete!!"
print_checklist_tte
echo ""
echo "A list of common helpful keybinds is below:  

󰌓  ▏ 󰖳 + ENTER              󰄛  Kitty Terminal
󰌓  ▏ 󰖳 + B                    Firefox
󰌓  ▏ 󰖳 + N                    Nemo File Browser
󰌓  ▏ 󰖳 + CTRL + Y           󰇥  Yazi File Browser
󰌓  ▏ 󰖳 + CTRL + N             NeoVim
󰌓  ▏ 󰖳 + CTRL + ENTER       󰀻  Rofi App Launcher
󰌓  ▏ 󰖳 + CTRL + T             Open Htop
󰌓  ▏ 󰖳 + CTRL + T             Open Bpytop
󰌓  ▏ 󰖳 + CTRL + C           󰃬  K-Calc
󰌓  ▏ 󰖳 + CTRL + V             VLC Player
󰌓  ▏ 󰖳 + CTRL + M           󰲝  Network Manager
󰌓  ▏ 󰖳 + CTRL + Q           󰗽  Logout

󰌓  ▏ 󰖳 + Mouse Left         Move Window

To display a full list of keybinds use... 
or left-click the gear icon   in the Waybar"
echo ""

# Options for reboot, rerun, or exit
echo "Restart is required to complete setup."
echo "Choose an option:"
echo ""
echo "1. Reboot now"
echo "2. Rerun the installation script"
echo "3. Exit"
echo ""

# Prompt user for input with a 30-second timeout
read -t 60 -p "Enter your choice (default is reboot): " choice
echo ""

# Check the user's input or proceed to the default action
case $choice in
    1)
        echo "Rebooting now..."
        sudo reboot
        ;;
    2)
        echo "Rerunning the script..."
        exec "$0"  # Reruns the current script
        ;;
    3)
        echo "Exiting. System will not reboot."
        echo ""
        echo "To close this terminal use 󰌓  ▏ 󰖳 + Q"
        exit 0
        ;;
    *)
        echo "No input detected. Rebooting in 60 seconds..."
        sudo reboot
        ;;



esac

