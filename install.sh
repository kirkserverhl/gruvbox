#!/bin/bash

# Gruvbox colors
RESET="\e[0m"                 ``# Reset all attributes
GREEN="\e[38;2;142;192;124m"  # #8ec07c
CYAN="\e[38;2;69;133;136m"    # #458588
YELLOW="\e[38;2;215;153;33m"  # #d79921
RED="\e[38;2;204;36;29m"      # #cc241d
GRAY="\e[38;2;60;56;54m"      # #3c3836"
BOLD="\e[1m"                  # Bold text


clear
echo ""
echo -e "${GREEN}${BOLD} 🫠  Welcome to Hyprland Gruvbox Installation !!"
echo ""
echo -e "        Sit back and enjoy the ride !!   🚀 ${RESET}"
echo ""
echo ""

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
    echo -e "${CYAN}[INFO]${RESET} $1"
}

# Function to print success messages
log_success() {
    echo -e "${GREEN}[SUCCESS]${RESET} $1"
}

# Function to print warning messages
log_warning() {
    echo -e "${YELLOW}[WARNING]${RESET} $1"
}

# Function to print error messages
log_error() {
    echo -e "${RED}[ERROR]${RESET} $1"
}

# Function to print the checklist
print_checklist_tte() {
    checklist_file="/tmp/checklist.txt"
    echo -e "\\nInstallation Summary:\\n" > "$checklist_file"
    for section in "${!checklist[@]}"; do
        if [ "${checklist[$section]}" = true ]; then
            echo "✔️ $section" >> "$checklist_file"
        else
            echo "✖️ $section" >> "$checklist_file"
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
    echo ""
    log_status " ⚙️  Installing Git and Yay..."
    echo "     " && sudo pacman -S --noconfirm git || log_error "Failed to install git"
    git clone https://aur.archlinux.org/yay.git || log_error "Failed to clone yay"
    cd yay
    makepkg -si --noconfirm || log_error "Failed to build and install yay"
    cd .. 
    echo ""
    log_success "Git and Yay installed successfully."
    checklist[git_and_yay]=true
} || checklist[git_and_yay]=false

# Section 2: Install Packages
{
  echo ""
  log_status "📦️  Installing packages..."
  echo ""
  if yay -S --noconfirm "${PACKAGES[@]}"; then
      log_success "All packages installed successfully."
      echo ""
      checklist[install_packages]=true
  else
      echo ""
      log_error "Failed to install some packages."
      echo ""
      checklist[install_packages]=false
  fi

	PACKAGES=(
    	amd-ucode aylurs-gtk-shell base base-devel blueprint-compiler bluez bluez-utils blueberry bpytop brightnessctl btrfs-progs cliphist cmake cmatrix cbonsai-git
    	duf dunst efibootmgr eza fastfetch figlet firefox fortune-mod fortune-mod-archlinux fzf git ghostty
    	gnome-text-editor go grim grimblast-git
    	gst-plugin-pipewire gum htop hyprpolkitagent hyprpicker hyprshade hyprcursor hyprpaper hypridle hyprgraphics  hyprlang hyprutils hyprwayland-scanner
    	imagemagick intel-media-driver iwd  kitty kvantum libpulse libva-intel-driver linux linux-firmware lsd lsd-print-git lua
    	meson nemo nemo-emblems nemo-preview nemo-terminal neovim neovim-lspconfig neovim-web-devicons-git network-manager-applet networkmanager
    	noto-fonts noto-fonts-emoji nwg-dock-hyprland nwg-look otf-fira-sans otf-font-awesome pacseek pacman-mirrorlist pavucontrol pinta pipewire pipewire-alsa
    	pipewire-jack pipewire-pulse pomodorolm prettier python-pywal16 python-pywalfox python-pillow python-hyprpy python-vlc qt5-base
    	qt5-graphicaleffects qt5-wayland qt6-wayland qt6ct-kde rofi-calc rofi-wayland sdm-sugar-candy-git
    	smile slurp smartmontools sof-firmware starship stow timeshift timeshift-autosnap tmux ttf-sharetech-mono-nerd unzip vala vim
    	vlc vlc-materia-skin-git vulkan-intel vulkan-radeon wl-clipboard wl-clipboard-history-git wget wireless_tools
    	wireplumber wofi xclip xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-utils xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vmware
    	xorg-xhost xorg-server xorg-xinit xorg-wayland xsettingsd waypaper waybar wtype yazi zig zoxide zram-generator zsh-autosuggestions-git
    	zsh wlogout python-terminaltexteffects
	)
  echo ""

	yay -S --noconfirm "${PACKAGES[@]}" || log_error "Failed to install packages"
	checklist[install_packages]=true
} || checklist[install_packages]=false

# Section 3: Configuration
echo ""
{
	log_status "🛠️  Applying configurations..." | lsd-print
	echo ""
  sudo cp ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
	cd ~/.dotfiles || log_error "Failed to enter .dotfiles directory"

	STOW_DIRS=("ags" "bat" "bpytop" "byobu" "dunst" "fastfetch" "fontconfig" "fzf" "ghostty" "gtk-3.0" "gtk-4.0" "home"
    	"htop" "hypr" "kitty" "nemo" "nvim" "nwg-dock-hyprland" "nwg-look" "pacseek" "pomodorolm" "qt6ct" "rofi" "scripts" "sddm" "settings" "systemd" "vim" "vlc"
    	"wal" "waybar" "waypaper" "wlogout" "xdg-desktop-portal"
      "xsettingsd" "yazi" "znt" ".config" "oh-my-zsh")

	for dir in "${STOW_DIRS[@]}"; do
    	stow "$dir" || log_error "Failed to stow $dir"
	done

	checklist[configuration]=true
} || checklist[configuration]=false

# Section 4: Starting Cron Job
{
	log_status " 🕰️  Setting up cron job..." | lsd-print
	setup_cron_job
} || checklist[cron_job]=false

# Section 5: Post-Configuration
{
    log_status " 🔧 Running post-configuration scripts..." | lsd-print
    echo "Checking ~/scripts/config.sh"

    if [[ -d ~/scripts && -f ~/scripts/config.sh ]]; then
        echo "Found ~/scripts/config.sh. Attempting to execute..."
        cd ~/scripts
        ./config.sh
        if [[ $? -eq 0 ]]; then
            checklist[post_configuration]=true
            echo "config.sh executed successfully."
        else
            log_error "config.sh execution failed."
            checklist[post_configuration]=false
        fi
    else
        log_error "Directory ~/scripts or script config.sh not found."
        checklist[post_configuration]=false
    fi
} || checklist[post_configuration]=false

clear
print_checklist_tte
echo ""
echo "   Hyprland Gruvbox Installation is Complete !! 🫠
     A list of common helpful keybinds is below:" | lsd-print

echo "⌨️  ▏ 󰖳 + ENTER             👻   Ghostty Terminal
⌨️  ▏ 󰖳 + B                    Firefox
⌨️  ▏ 󰖳 + N                    Nemo File Browser
⌨️  ▏ 󰖳 + CTRL + N             NeoVim
⌨️  ▏ 󰖳 + CTRL + ENTER       󰀻  Rofi App Launcher
⌨️  ▏ 󰖳 + Q                  󰅙  Close Window
⌨️  ▏ 󰖳 + CTRL + Q           󰗽  Logout
⌨️  ▏ 󰖳 + Mouse Left         Move Window"
echo ""
echo "To display a full list of keybinds use  ⌨️  ▏ 󰖳 + SPACE
or left-click the gear icon    in the Waybar" | lsd-print

# Options for reboot, rerun, or exit
echo " Restart is required to complete setup !!" | lsd-print
echo " 1.     Reboot now"
echo " 2.  󰑎   Rerun the installation script"
echo " 3.  󰩈   Exit"

# Prompt user for input with a 60-second timeout
echo "" 
read -t 60 -p " Enter your choice (auto reboot in 60 seconds): " choice 
echo ""

# Check the user's input or proceed to the default action
case $choice in
    1)
        echo " Rebooting now..." 
        waypaper --random && sudo reboot
        ;;
    2)
        echo " Rerunning the script..." 
        exec "$0"  # Reruns the current script
        ;;
    3)
        echo " Exiting. System will not reboot." 
        exit 0
        ;;
    *)
        echo " No input detected. Rebooting in 60 seconds..."
        waypaper --random && sudo reboot
        ;;

esac

