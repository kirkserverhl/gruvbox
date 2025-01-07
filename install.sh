!/bin/bash
clear
###############################################################################################
### Gruvbox colors ############################################################################
###############################################################################################
RESET="\e[0m"                 	 # Reset ##
GREEN="\e[38;2;142;192;124m"  	 #8ec07c ##
CYAN="\e[38;2;69;133;136m"    	 #458588 ##
YELLOW="\e[38;2;215;153;33m"  	 #d79921 ##
RED="\e[38;2;204;36;29m"      	 #cc241d ##
GRAY="\e[38;2;60;56;54m"      	 #3c3836 ##
BOLD="\e[1m"                  	 # Bold  ##
##############################################################################################
## Function to display headers with figlet ###################################################
##############################################################################################
display_header() {
    # clear
    figlet -f ~/.local/share/fonts/Graffiti.flf "$1"
}
##############################################################################################
## Checklist to track completed sections  ####################################################
##############################################################################################

declare -A checklist
checklist=(
    [base_packages]=false
    [config_base]=false
    [main_packages]=false
    [config_main]
    [cron_job]=false
    [post_config]=false
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
    echo -e "\\n  📜   Installation Summary:\\n" > "$checklist_file"
    for section in "${!checklist[@]}"; do
        if [ "${checklist[$section]}" = true ]; then
            echo " ✔️ $section" >> "$checklist_file"
        else
            echo " ✖️ $section" >> "$checklist_file"
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
################################################################################################
## Function to add a cron job  #################################################################
################################################################################################

setup_cron_job() {
    (crontab -l 2>/dev/null; echo "0 */12 * * * ~/scripts/cleanup.sh") | crontab
    if [ $? -eq 0 ]; then
    checklist[cron_job]=true
    else
    checklist[cron_job]=false
    fi
    }
clear

################################################################################################
##  Welcome Screen  ############################################################################
################################################################################################

echo -e "\n  🫠   Welcome to Hyprland Gruvbox Installation !!   🚀
            Sit back and enjoy the ride !!   \n"  | lsd-print

################################################################################################
##  Section 1: Installing Base Packages ########################################################
################################################################################################
{
    echo -e "   📦️     Installing Base Packages..." | lsd-print
        sudo pacman -S --noconfirm git || log_error "Failed to install git"
        git  clone https://aur.archlinux.org/yay.git || log_success "Git installed successfully"
        cd yay &&  makepkg -si --noconfirm ||   log_success "YAY installed successfully"
      PACKAGES1=(
        amd-ucode ark aylurs-gtk-shell base-devel bluez bluez-utils bpytop btrfs-progs cliphist cmake cmatrix duf efibootmgr eza fastfetch figlet fortune-mod fortune-mod-archlinux fzf ghostty ghostty-shell-integration ghostty-terminfo go grimblast-git gst-plugin-pipewire gtk-engine-murrine gum htop hyprcursor hyprgraphics hypridle hyprlang hyprpaper hyprpicker hyprpicker hyprpolkitagent hyprshade hyprutils hyprwayland-scanner imagemagick iwd kate konsole konsole-gruvbox kvantum libpulse libva-intel-driver lsd lsd-print-git lua neovim network-manager-applet network-manager-applet networkmanager nwg-dock-hyprland nwg-look otf-fira-sans otf-font-awesome pacman-mirrorlist pacman-mirrorlist pacseek pavucontrol pipewire python-hyprpy python-pywal16 python-pywalfox python-terminaltexteffects qt5-base qt5-declarative qt5-graphicaleffects qt5-wayland qt5-x11extras qt5ct-kde qt6-base qt6-declarative qt6-wayland qt6ct-kde rofi-calc rofi-wayland sddm-sugar-candy-git slurp smile starship stow syntax-highlighting tldr++ tmux tree-sitter ttf-nerd-fonts-symbols ttf-sharetech-mono-nerd vlc vlc-materia-skin-git waybar waypaper wget wireless_tools wireplumber wl-clipboard wl-clipboard-history-git wlogout wtf wtype xclip xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-utils xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vmware xorg-server xorg-wayland xorg-xhost xorg-xinit xsettingsd yazi zig zoxide zsh zsh-autosuggestions-git zsh-syntax-highlighting
        )
        yay -S --noconfirm "${PACKAGES1[@]}"
     checklist[base_packages]=true
} || checklist[base_packages]=false
clear

###############################################################################################
## Section 2: Configure Main  #################################################################
###############################################################################################
{
    log_status "  🛠️   Applying base configurations..." | lsd-print
        cd ~/.dotfiles
        stow ags bat bpytop byobu .config dunst fastfetch fontconfig fzf ghostty gtk-3.0 gtk-4.0 home htop hypr kate kitty kvantum nemo nvim nwg-dock hyprland nwg-look oh-my-zsh pacseek pomodorolm qt6ct rofi scripts sddm settings vim vlc wal waybar waypaper wlogout xdg-desktop-portal xsettingsd yazi --adopt
        sudo cp ~/.dotfiles/home/hyprland.conf ~/.config/hypr
      checklist[config_main]=true
} ||  checklist[config_main]=false
clear

###############################################################################################
## Section 3: Install Main Packages ###########################################################
###############################################################################################

###############################################################################################
## Section 4: Starting Cron Job  ##############################################################
###############################################################################################
#{
#    log_status "   🕰️    Setting up Cleanup cron job..."
#    nohup setup_cron_job &
#} || checklist[cron_job]=false
#clear
#
###############################################################################################
## Section 5: Post-Configuration  #############################################################
###############################################################################################
{
    log_status "   🔧    Running post-configuration scripts..." | lsd-print
    echo "Checking ~/scripts/config.sh"

    if [[ -d ~/scripts && -f ~/scripts/config.sh ]]; then
        echo "Found ~/scripts/config.sh. Attempting to execute..."
        cd ~/scripts
        ./config.sh
        if [[ $? -eq 0 ]]; then
            checklist[post_config]=true
            echo "config.sh executed successfully."
        else
            log_error "config.sh execution failed."
            checklist[post_config]=false
        fi
    else
        log_error "Directory ~/scripts or script config.sh not found."
        checklist[post_config]=false
    fi
} || checklist[post_config]=false
clear

################################################################################################
## Section 6: Post Install Checklist  ##########################################################
################################################################################################

clear
print_checklist_tte

echo -e "\n       Hyprland Gruvbox Installation is Complete !! 🫠
        A list of common helpful keybinds is below:" | lsd-print

echo -e "  ⌨️  ▏ 󰖳 + ENTER              👻  Ghostty Terminal
  ⌨️  ▏ 󰖳 + B                     Firefox
  ⌨️  ▏ 󰖳 + F                     Krusader Browser
  ⌨️  ▏ 󰖳 + N                     NeoVim
  ⌨️  ▏ 󰖳 + Q                  󰅙   Close Window
  ⌨️  ▏ 󰖳 + SPACE              󰀻   Rofi App Launcher
  ⌨️  ▏ 󰖳 + CTRL + Q           󰗽   Logout 
  ⌨️  ▏ 󰖳 + Mouse Left         🪟  Move Window"

echo -e "   Display Full list of keybinds with:  ⌨️  ▏ 󰖳 + SPACE
   or left-click the gear icon    in the Waybar" | lsd-print
echo -e " Restart is required to complete setup !!" | lsd-print
echo -e "  1.   🥾    Reboot Now \n
  2.   🔙    Rerun Installation \n
  3.   🚀    Exit Installation \n"

read -p "Enter your choice: " choice
echo -e ""

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
