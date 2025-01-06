#!/bin/bash
# Function to add a cron job
setup_cron_job() {
	(crontab -l 2>/dev/null; echo "0 */12 * * * ~/scripts/cleanup.sh") | crontab -
	if [ $? -eq 0 ]; then
    	checklist[cron_job]=true
	else
    	checklist[cron_job]=false
	fi
}
clear

# Gruvbox colors
RESET="\e[0m"                 # Reset all attributes
GREEN="\e[38;2;142;192;124m"  # #8ec07c
CYAN="\e[38;2;69;133;136m"    # #458588:q
YELLOW="\e[38;2;215;153;33m"  # #d79921
RED="\e[38;2;204;36;29m"      # #cc241d
GRAY="\e[38;2;60;56;54m"      # #3c3836"
BOLD="\e[1m"                  # Bold text

echo -e " 🫠  Welcome to Hyprland Gruvbox Installation !!" | lsd-print
echo -e "  ${GREEN}${BOLD}      Sit back and enjoy the ride !!   🚀 ${RESET} \n"

# Checklist to track completed sections
declare -A checklist
checklist=(
    [git_and_yay]=false
    [configuration]=false
    [install_packages]=false
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

# Section 1: Git and Yay Setup
{
    log_status " ⚙️  Installing Git and Yay..."  | lsd-print
    echo -e"\n     " && sudo pacman -S --noconfirm git || log_error "Failed to install git"
    git clone https://aur.archlinux.org/yay.git || log_error
    cd yay && makepkg -si --noconfirm || log_error
    log_success "Git and Yay installed successfully."

    # Installing Dotfiles
    cd ~/ && git clone https://github.com/kirkserverhl/gruvbox.git || log_error "Unable to
    install dotfiles download dotfiles... 🤡 " | lsd-print
    log_success "Gruvbox Dependencies acquired, configuring  packages   🤖 "

    checklist[git_and_yay]=true
} || checklist[git_and_yay]=false

# Section 2: Configuration
{
    log_status "🛠️  Applying configurations..." | lsd-print
    sudo cp ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
    cd ~/.dotfiles || log_error "Failed to enter .dotfiles directory"

    STOW_DIRS=("ags" "bat" "bpytop" "byobu" "dunst" "fastfetch" "fontconfig" "fzf" "ghostty"
    "gtk-3.0" "gtk-4.0" "home" "htop" "hypr"    "kitty" "nemo" "nvim" "nwg-dock-hyprland" "nwg-
    look" "pacseek" "pomodorolm" "qt6ct" "rofi" "scripts" "sddm" "settings" "systemd"    "vim"
    "vlc" "wal" "waybar" "waypaper" "wlogout" "xdg-desktop-portal" "xsettingsd" "yazi" "znt"
    ".config" "oh-my-zsh")

    for dir in "${STOW_DIRS[@]}"; do
        stow "$dir" || log_error "Failed to stow $dir"
    done

    checklist[configuration]=true
} || checklist[configuration]=false

# Section 3: Install Packages
{
  log_status "📦️  Installing packages..." | lsd-print
  if yay -S --noconfirm "${PACKAGES[@]}"; then
      log_success "All packages installed successfully." | lsd-print
      checklist[install_packages]=true
  else
      log_error "Failed to install some packages."
      checklist[install_packages]=false
  fi

    PACKAGES=(
        amd-ucode aylurs-gtk-shell base base-devel blueprint-compiler bluez
        bluez-utils blueberry bpytop brightnessctl btrfs-progs cliphist cmake
        cmatrix cbonsai-git duf dunst efibootmgr eza fastfetch figlet fortune-mod
        fortune-mod-archlinux fzf ghostty gnome-text-editor go grim grimblast-git
        gst-plugin-pipewire gum htop hyprpolkitagent hyprpicker hyprshade hyprcursor
        hyprpaper hypridle hyprgraphics hyprlang hyprutils hyprwayland-scanner
        imagemagick intel-media-driver iwd kitty kvantum libpulse libva-intel-driver
        lsd lsd-print-git lua 	meson neovim neovim-lspconfig neovim-web-devicons-git
        network-manager-applet networkmanager noto-fonts noto-fonts-emoji nwg-dock
        hyprland nwg-look otf-fira-sans otf-font-awesome pacseek pacman-mirrorlist
        pavucontrol pinta pipewire pipewire-alsa pipewire-jack pipewire-pulse
        pomodorolm prettier  python-pillow python-hyprpy python-vlc qt5-base
        qt5-graphicaleffects qt5-wayland qt6-wayland qt6ct-kde rofi-calc rofi-wayland
        sddm-sugar-candy-git smile slurp smartmontools sof-firmware starship stow
        timeshift timeshift-autosnap tmux ttf-sharetech-mono-nerd unzip vala vim vlc
        vlc-materia-skin-git vulkan-intel vulkan-radeon wl-clipboard
        wl-clipboard-history-git wget wireless_tools wireplumber wofi xclip
        xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-utils xf86-video-amdgpu
        xf86-video-ati xf86-video-nouveau xf86-video-vmware xorg-xhost xorg-server
        xorg-xinit xorg-wayland xsettingsd waypaper waybar wtype yazi zig zoxide
        zram-generator zsh-autosuggestions-git zsh wlogout python-terminaltexteffects
        )
        yay -S --noconfirm "${PACKAGES[@]}" || log_error "Failed to install packages"
            checklist[install_packages]=true
} ||        checklist[install_packages]=false

# Section 4: Starting Cron Job
{
    log_status " 🕰️  Setting up cron job..." | lsd-print
    setup_cron_job
} || checklist[cron_job]=false


# Missing pkgs, Fix Zsh, refresh Hyprland, move Ass’s  ##
echo "${GREEN}${BOLD}     Running post-boot configuration..." | lsd-print

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
read -p "  🫠    Would you like to install Editors Choice packages  (y/n) ? " editors_choice
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
echo -e " ✔️   Installation is complete."    | lsd-print
echo " Choose an option:"                  | lsd-print
echo " 1.  󰑎   Rerun this script"
echo -e " 2.  󰩈   Exit \n"
echo "If at any time you would like too rerun the Gruvbox configuration again simply type: 'config' into a temrinal window  🤓 "

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




# Section 5: Post-Configuration
{
    log_status " 🔧 Running post-configuration scripts..." | lsd-print
    # Run config.sh script in the same terminal
    cd ~/scripts || { log_error "Failed to navigate to ~/scripts"; exit 1; }
    ./config.sh || { log_error "Failed to run config.sh"; exit 1; }

    checklist[post_configuration]=true
} || checklist[post_configuration]=false
clear

print_checklist_tte

# Post Installation Summary
echo "   Hyprland Gruvbox Installation is Complete !! 🫠
     A list of common helpful keybinds is below:" | lsd-print

echo " ⌨️  ▏ 󰖳 + ENTER             👻   Ghostty Terminal
⌨️  ▏ 󰖳 + B                    Firefox
⌨️  ▏ 󰖳 + F                    Nemo File Browser
⌨️  ▏ 󰖳 + N                    NeoVim
⌨️  ▏ 󰖳 + SPACE              󰀻  Rofi App Launcher
⌨️  ▏ 󰖳 + Q                  󰅙  Close Window
⌨️  ▏ 󰖳 + CTRL + Q           󰗽  Logout
⌨️  ▏ 󰖳 + Mouse Left        🪟  Move Window""

"To display a full list of keybinds use  ⌨️   ▏ CTRL + SPACE
or left-click the gear icon    in the Waybar" | lsd-print

# Options for reboot, rerun, or exit
echo " Restart is required to complete setup !!" | lsd-print
echo -e " 1.  🥾   Reboot now \n"
echo -e " 2.  🔙   Rerun the installation script\n"
echo -e " 3.  🚀   Exit \n"

# Prompt user for input
read -p " Enter your choice: " choice

# Check the user's input
case $choice in
  1)
        echo : ibooting now..."  | lsd-print
        sudo reboot
        ;;
  2)
        echo " Rerunning the script...  📜" | lsd-print
        exec "$0"  # Reruns the current script
        ;;
  3)
        echo " Exiting. System will not reboot... 🚀" lsd-print
        exit 0
        ;;
  *)
        echo " Invalid input. Exiting terminal... 🚀" | lsd-print
        exit 0
        ;;
esac


##### START OF CONFIG.SH SCRIPT #####

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
  echo "  ⛔️   No input detected." | lsd-print
        echo "Close terminal windows with keybind:  󰌓  ▏ 󰖳 + Q" | lsd-print
        ;;

esac
