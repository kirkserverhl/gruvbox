# .__                 __         .__  .__              .__
# |__| ____   _______/  |______  |  | |  |        _____|  |__
# |  |/    \ /  ___/\   __\__  \ |  | |  |       /  ___/  |  \
# |  |   |  \\___ \  |  |  / __ \|  |_|  |__     \___ \|   Y  \
# |__|___|  /____  > |__| (____  /____/____/ /\ /____  >___|  KB25/
# \/     \/            \/            \/      \/     \/
###################################################################
#
#!/bin/bash
clear

# Gruvbox colors
RESET="\e[0m"                 	# Reset all attributes
GREEN="\e[38;2;142;192;124m"  	# #8ec07c
CYAN="\e[38;2;69;133;136m"    	# #458588
YELLOW="\e[38;2;215;153;33m"  	# #d79921
RED="\e[38;2;204;36;29m"      	# #cc241d
GRAY="\e[38;2;60;56;54m"      	# #3c3836
BOLD="\e[1m"                  	# Bold text

echo -e "  🫠   Welcome to Hyprland Gruvbox Installation !!
        Sit back and enjoy the ride !!   🚀 \n"  | lsd-print

# Define Packages to Install
  PACKAGES1=(base-devel hyprcursor hyprgraphics hypridle hyprlang hyprpaper nwg-look
    hyprpicker hyprpolkitagent hyprshade hyprutils hyprwayland-scanner imagemagick
    lsd-print-git neovim network-manager-applet networkmanager nwg-dock-hyprland
    pacman-mirrorlist pacseek python-pywal16 python-pywalfox python-terminaltexteffects
    qt5-base qt5-graphicaleffects qt5-wayland qt6-wayland qt6ct-kde rofi-wayland
    sddm-sugar-candy-git stow ttf-sharetech-mono-nerd ttf-sharetech-mono-nerd
    waybar waypaper xdg-desktop-portal-gtk xdg-desktop-portal-hyprland zsh)

PACKAGES2=( amd-ucode ark aylurs-gtk-shell blueberry blueprint-compiler bluez
    bluez-utils bpytop brightnessctl btrfs-progs cliphist cmake cmatrix duf efibootmgr
    eza fastfetch figlet fortune-mod fortune-mod-archlinux fzf ghostty go grim grimblast-git
    gst-plugin-pipewire gum htop intel-media-driver iwd kate konqueror kvantum libpulse
    libva-intel-driver lsd lua meson neovim-lspconfig neovim-web-devicons-git noto-fonts
    noto-fonts-emoji otf-fira-sans otf-font-awesome pavucontrol pinta pipewire pipewire-alsa
    pipewire-jack pipewire-pulse pomodorolm prettier python-hyprpy python-pillow python-vlc
    rofi-calc slurp smile starshi timeshift-autosnap tmux vala vim vlc vlc-materia-skin-git
    vulkan-intel vulkan-radeon wget wireless_tools wireplumber wl-clipboard xorg-xinit
    wl-clipboard-history-git wlogout wtype xclip  xdg-utils xf86-video-amdgpu xf86-video-ati
    xf86-video-nouveau xf86-video-vmware xorg-server xorg-wayland xorg-xhost xsettingsd
    yazi zig zoxide zram-generator zsh-autosuggestions-gitptimeshift
)

# Function to add a cron job
setup_cron_job() {
    (crontab -l 2>/dev/null; echo "0 */12 * * * ~/scripts/cleanup.sh") | crontab -
    if [ $? -eq 0 ]; then
    checklist[cron_job]=true
    else
    checklist[cron_job]=false
    fi
    }

# Checklist to track completed sections
declare -A checklist
checklist=(
    [base_packages]=false
    [configuration]=false
    [additional_apps]=false
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
        if  command -v tte &>/dev/null; then
        cat "$checklist_file" | tte beams
    else
        cat "$checklist_file"
        fi
    	# Clean up temporary file
    rm "$checklist_file"
}

# Section 1: Installing Git and Yay
{    echo "  🛸     Installing Git and Yay..." | lsd-print
    sudo pacman -S --noconfirm git base-devel || { echo "Failed to install git and base-devel";
    exit 1; }
    git clone https://aur.archlinux.org/yay.git || { echo "Failed to clone yay"; exit 1; }
    cd yay || { echo "Failed to enter yay directory"; exit 1; }
    makepkg -si --noconfirm || { echo "Failed to install yay"; exit 1; }
    cd ..  &&  rm -rf yay
    echo "Git and Yay installed successfully" | lsd-print
        checklist[git_and_yay]=true
} ||    checklist[git_and_yay]=false

# Clone the dotfiles respository directory on your computer.

# Section 2: Install Dependencies & Assets
{    echo "      Installing base packages..." | lsd-print
    yay -Syyu --noconfirm || { echo "Failed to update package database"; exit 1; }
    yay -S --noconfirm "${PACKAGES1[@]}" || { echo "Failed to install base packages"; exit 1; }
    echo "Base packages installed successfully" | lsd-print
        checklist[install_packages]=true
} ||    checklist[install_packages]=false
clear

## Section X: Install Main Packages
{    echo "   📦️     Installing main packages..." | lsd-print
    yay -S --noconfirm "${PACKAGES2[@]}" || { echo "Failed to install main packages"; exit 1; }
    echo "Main packages installed successfully" | lsd-print
        checklist[install_packages]=true
} ||    checklist[install_packages]=false
clear

#######################################################################################################################################
##  Section 4:                             ########################################################################################### #######################################################################################################################################
#######################################################################################################################################
{
        log_status "  Applying configurations..."    | lsd-print
        sudo cp ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
        cd ~/.dotfiles || log_error "Failed to enter .dotfiles directory"

        STOW_DIRS=("ags" "alacritty" "bat" "bpytop" "byobu" "dunst" "fastfetch" "fontconfig" "fzf" "ghostty" "gtk-3.0" "gtk-4.0" "home" "htop" "hypr" "kitty" "nemo" "nvim" "nwg-dock-hyprland"
        "nwg-look" "pacseek" "pomodorolm" "qt6ct" "rofi" "scripts" "sddm" "settings" "systemd" "vim" "vlc" "wal" "waybar" "waypaper" "wlogout" "xsettingsd" "yazi" "znt" ".config" "oh-my-zsh")

        for dir in "${STOW_DIRS[@]}"; do
        stow "$dir" || log_error "Failed to stow $dir"
        done

        checklist[configuration]=true
} ||    checklist[configuration]=false
clear

# Section 4: Starting Cron Job
{
    log_status "  Setting up cron job..."      | lsd-print
    setup_cron_job
} || checklist[cron_job]=false

#######################################################################################################################################
##  Section 5: Main Package Build / Install  ########################################################################################## #######################################################################################################################################
#######################################################################################################################################
{
    log_status "󰯂  Running post-configuration scripts..."
    echo -e "\nDO NOT CLOSE THIS TERMINAL\n!!"

    cd ~/scripts || { log_error "Failed to navigate to ~/scripts"; exit 1; }
    ./config.sh || { log_error "Failed to run config.sh"; exit 1; }

    checklist[post_configuration]=true
} || checklist[post_configuration]=false
clear

# Post Install Checklist
print_checklist_tte

# New User Instructions
echo -e "\n       Hyprland Gruvbox Installation is Complete !! 🫠
        A list of common helpful keybinds is below:" | lsd-print

echo "  ⌨️  ▏ 󰖳 + ENTER             👻   Ghostty Terminal
  ⌨️  ▏ 󰖳 + B                    Firefox
  ⌨️  ▏ 󰖳 + F                    Krusader Browser
  ⌨️  ▏ 󰖳 + N                    NeoVim
  ⌨️  ▏ 󰖳 + Q                  󰅙  Close Window
  ⌨️  ▏ 󰖳 + SPACE              󰀻  Rofi App Launcher
  ⌨️  ▏ 󰖳 + CTRL + Q           󰗽  Logout
  ⌨️  ▏ 󰖳 + Mouse Left         🪟 Move Window"

echo -e "\nDisplay Full list of keybinds with:  ⌨️  ▏ 󰖳 + SPACE
or left-click the gear icon    in the Waybar" | lsd-print

# Options for reboot, rerun, or exit
echo " Restart is required to complete setup !!" | lsd-print
echo -e " 1.  🥾  Reboot now \n"
echo -e " 2.  🔙  Rerun the installation script \n"
echo -e " 3.  🚀   Exit \n"

# Prompt user for input
read -p "Enter your choice: " | lsd-print choice

# Check the user's input
case $choice in
  1)
        echo " Rebooting now..."` lsd-print
        sudo reboot
        ;;
  2)
        echo " Rerunning the script..."` | lsd-print
        exec "$0"
        ;;
  3)
        echo " Exiting. System will not reboot."  | lsd-print
        exit 0
        ;;
  *)
        echo " Invalid input. Exiting without reboot."  | lsd-print
        exit 0
        ;;
esac

# Section 5: Post-Configuration
{
    log_status "󰯂  Running post-configuration scripts..."
    cd ~/scripts || { log_error "Failed to navigate to ~/scripts"; exit 1; }
    ./config.sh || { log_error "Failed to run config.sh"; exit 1; }
        checklist[post_configuration]=true
} ||    checklist[post_configuration]=false
clear
#######################################################################################################################################
##  Section 6: Post Install Configuration   ########################################################################################### #######################################################################################################################################
#######################################################################################################################################
{
    log_status "  🔧    Running post-configuration scripts..." | lsd-print
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


#######################################################################################################################################
  clear  ##############################################################################################################################
#######################################################################################################################################

# Post Install Checklist
print_checklist_tte

# New User Instructions
echo -e "\n       Hyprland Gruvbox Installation is Complete !! 🫠
     A list of common helpful keybinds is below:" | lsd-print

echo "  ⌨️  ▏ 󰖳 + ENTER             👻    Ghostty Terminal
  ⌨️  ▏ 󰖳 + B                      Firefox
  ⌨️  ▏ 󰖳 + F                     Krusader Browser
  ⌨️  ▏ 󰖳 + N                     NeoVim
  ⌨️  ▏ 󰖳 + Q                  󰅙   Close Window
  ⌨️  ▏ 󰖳 + SPACE              󰀻   Rofi App Launcher
  ⌨️  ▏ 󰖳 + CTRL + Q           󰗽   Logout 
  ⌨️  ▏ 󰖳 + Mouse Left        🪟   Move Window"

echo -e "\nDisplay Full list of keybinds with:  ⌨️  ▏ 󰖳 + SPACE
or left-click the gear icon    in the Waybar" | lsd-print

# Options for reboot, rerun, or exit
echo " Restart is required to complete setup !!" | lsd-print
echo -e "   1.  🥾    Reboot now \n"
echo -e "   2.  🔙    Rerun the installation script \n"
echo -e "   3.  🚀    Exit \n"

# Prompt user for input
read -p "Enter your choice:| lsd-print " choice

# Check the user's input
case $choice in
  1)
        echo " Rebooting now..." | lsd-print
        sudo reboot
        ;;
  2)
        echo " Rerunning the script..."   | lsd-print
        exec "$0"  # Reruns the current script
        ;;
  3)
        echo " Exiting. System will not reboot."  | lsd-print
        exit 0
        ;;
  *)
        echo " Invalid input. Exiting without reboot."  | lsd-print
        exit 0
        ;;
esac
:
