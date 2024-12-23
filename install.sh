#!/bin/bash

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
print_checklist() {
	echo -e "\nInstallation Summary:\n"
	for section in "${!checklist[@]}"; do
    	if [ "${checklist[$section]}" = true ]; then
        	echo "✔ $section"
    	else
        	echo "✘ $section"
    	fi
	done
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
    yay -S powerpill stow --noconfirm 
    cd .dotfiles && stow scripts && cd ~/scripts && ./assets.sh && cd..
    yay -Syyu --noconfirm || log_error "Failed to update package database"

	PACKAGES=(
    	openssh alacritty aylurs-gtk-shell amd-ucode base base-devel blueprint-compiler bluez bpytop brightnessctl btrfs-progs cliphist cmake cmatrix cbonsai-git
    	duf dunst efibootmgr eza fastfetch figlet firefox fortune-mod fortune-mod-hackers fortune-mod-archlinux fzf git inotify-tools
    	gnome-text-editor go grim gruvbox-material-gtk-theme-git gruvbox-plus-icon-theme-git grub grub-customizer grub-theme-vimix
    	gst-plugin-pipewire gum htop hyprcursor hyprpaper hypridle hyprgraphics hyprland hyprlang hyprutils hyprwayland-scanner
    	imagemagick intel-media-driver iwd kcalc kitty libpulse libva-intel-driver linux linux-firmware lsd lsd-print-git lua
    	meson nano nemo nemo-emblems nemo-preview nemo-terminal neovim neovim-lspconfig network-manager-applet networkmanager
    	noto-fonts noto-fonts-emoji nwg-look otf-fira-sans otf-font-awesome pacseek pacman-mirrorlist pipewire pipewire-alsa
    	pipewire-jack pipewire-pulse polkit-kde-agent python-pywal16 python-pywalfox python-pillow python-vlc qt5-base
    	qt5-graphicaleffects qt5-wayland qt6-wayland qt6ct-kde ranger ranger_devicons-git rofi-wayland sddm sddm-theme-sugar-candy-git
    	slurp smartmontools sof-firmware starship stow timeshift timeshift-autosnap tmux ttf-sharetech-mono-nerd unzip vala vim
    	vlc vlc-materia-skin-git vulkan-intel vulkan-radeon waybar waypaper wl-clipboard wl-clipboard-history-git wget wireless_tools
    	wireplumber wofi xclip xdg-desktop-portal-hyprland xdg-utils xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vmware
    	xorg-xhost xorg-server xorg-xinit xorg-wayland xcursor-simp1e-gruvbox-light yazi zoxide zram-generator zsh-autosuggestions-git
    	wlogout zsh
	)

	yay -S --noconfirm "${PACKAGES[@]}" || log_error "Failed to install packages"
	checklist[install_packages]=true
} || checklist[install_packages]=false



# Section 3: Configuration
{
	log_status "Applying configurations..."
	cd ~/scripts || log_error "Failed to enter scripts directory"
        ./assets.sh
	cd ~/.dotfiles || log_error "Failed to enter .dotfiles directory"

	STOW_DIRS=("ags" "alacritty" "bat" "bpytop" "byobu" "dunst" "fastfetch" "fontconfig" "fzf" "gtk-3.0" "gtk-4.0" "home"
    	"htop" "hypr" "kitty" "nemo" "nvim" "nwg-look" "pacseek" "qt6ct" "ranger" "rofi" "scripts" "sddm" "settings" "vlc"
    	"wal" "waybar" "waypaper" "wlogout" "xsettingsd" "yazi" "znt" ".config" "oh-my-zsh")
  sudo rm ~/.config/hypr/hyrland.conf && stow hypr --adopt

	for dir in "${STOW_DIRS[@]}"; do
    	stow "$dir" || log_error "Failed to stow $dir"
	done

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

source ~/.zshrc
	checklist[configuration]=true
} || checklist[configuration]=false

# Section 4: Starting Cron Job
{
	log_status "Setting up cron job..."
	setup_cron_job
} || checklist[cron_job]=false


# Section 5: Post-Configuration
{
	log_status "Running post-configuration scripts..."

	cd ~/scripts || log_error "Failed to enter scripts directory"

	./shell.sh || log_error "Failed to run shell.sh"
	./cleanup.sh || log_error "Failed to run cleanup.sh"
	./zsh_fix.sh || log_error "failed to run zsh_fix.sh"
  # ./wallpaper-restore.sh || log_error "Failed to run wallpaper-restore.sh"
  ./hypr_swap.sh || log_error "Failed to run hypr_swap.sh"
  ./monitor.sh || log_error "Failed to run monitor.sh"
  ./linux_util.sh || log_error "Failed to run linux_util.sh"


	checklist[post_configuration]=true
} || checklist[post_configuration]=false

# Print checklist and options
print_checklist

log_status "What would you like to do next?"
echo "1) Rerun the script"
echo "2) Reboot the system"
echo "3) Exit"
read -rp "Enter your choice (default: reboot in 20 seconds): " choice

case $choice in
	1)
    	exec "$0"
    	;;
	2)
    	log_status "Rebooting..."
    	sudo reboot
    	;;
	3)
    	log_status "Exiting..."
    	exit 0
    	;;
	*)
    	log_status "Rebooting in 20 seconds..."
    	sleep 20
    	sudo reboot
    	;;
esac


   
   -----------------------------------
# END OF install.sh
# ---------------------------------
# ---------------------------------
####  Main Partition 256gb = 262144 128gb = 131072 #### 
####  Swap partition 64gb = 65536 #### 
####  Add cache from firefox to ram
####  About:config
####  Accept risk
####  Browser.cache.disk.enable >  change value to false
####  Browser.cache.memory.enable > true
####  aBrowser.cache.memory.capacity > change to 1 gb
####  Run git_config.sh 






