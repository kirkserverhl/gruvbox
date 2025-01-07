!/bin/bash
clear
###############################################################################################
### Gruvbox colors ############################################################################
RESET="\e[0m"                 	 # Reset ##
GREEN="\e[38;2;142;192;124m"  	 #8ec07c ##
CYAN="\e[38;2;69;133;136m"    	 #458588 ##
YELLOW="\e[38;2;215;153;33m"  	 #d79921 ##
RED="\e[38;2;204;36;29m"      	 #cc241d ##
GRAY="\e[38;2;60;56;54m"      	 #3c3836 ##
BOLD="\e[1m"                  	 # Bold  ##

##############################################################################################
# Function to display headers with figlet ####################################################
##############################################################################################

display_header() {
    # clear
    figlet -f ~/.local/share/fonts/Graffiti.flf "$1"
}
##############################################################################################
# Checklist to track completed sections  #####################################################
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
###############################################################################################
# Function to add a cron job  #################################################################
###############################################################################################

setup_cron_job() {
    (crontab -l 2>/dev/null; echo "0 */12 * * * ~/scripts/cleanup.sh") | crontab
    if [ $? -eq 0 ]; then
    checklist[cron_job]=true
    else
    checklist[cron_job]=false
    fi
    }
clear

###############################################################################################
#  Welcome Screen  ############################################################################
###############################################################################################

echo -e "\n  🫠   Welcome to Hyprland Gruvbox Installation !!   🚀
            Sit back and enjoy the ride !!   \n"  | lsd-print

###############################################################################################
#  Section 1: Installing Base Packages  #######################################################
###############################################################################################
{
    echo -e "   📦️     Installing Base Packages..." | lsd-print
        sudo pacman -S --noconfirm git || log_error "Failed to install git"
        git  clone https://aur.archlinux.org/yay.git || log_success "Git installed successfully"
        cd yay &&  makepkg -si --noconfirm ||   log_success "YAY installed successfully"
      PACKAGES1=(
        base-devel figlet hyprcursor hyprgraphics hypridle hyprlang hyprpaper nwg-look
        hyprpicker hyprpolkitagent hyprshade hyprutils hyprwayland-scanner imagemagick
        lsd-print-git neovim network-manager-applet networkmanager nwg-dock-hyprland
        pacman-mirrorlist pacseek python-pywal16 python-pywalfox python-terminaltexteffects
        qt5-base qt5-declarative qt5-graphicaleffects qt5-wayland qt5-x11extras qt5ct-kde
        qt6-base qt6-declarative qt6-wayland qt6ct-kde rofi-wayland sddm-sugar-candy-git
        stow ttf-sharetech-mono-nerd waybar waypaper xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland zsh
        )
        yay -S --noconfirm "${PACKAGES1[@]}"
     checklist[base_packages]=true
} || checklist[base_packages]=false
clear

###############################################################################################
# Section 2: Configure Main  ##################################################################
###############################################################################################
{
    log_status "  🛠️   Applying base configurations..." | lsd-print
      STOW_DIRS=(
        "ags" "bat" "bpytop" "byobu" "dunst" ".config" "fastfetch" "fontconfig" "fzf"
        "ghostty" "gtk-3.0" "gtk-4.0" "home" "htop" "hypr" "kate" "kitty" "kvantum" "nemo" "nvim" "nwg-dock-hyprland" "rofi" "nwg-look" "pacseek" "pomodorolm" "qt6ct" "scripts" "sddm" "settings" "systemd" "vim" "vlc" "wal" "waybar" "waypaper" "wlogout"
        "xdg-desktop-portal" "xsettingsd" "yazi" "oh-my-zsh"
        )
        cd ~/.dotfiles
        for dir in "${STOW_DIRST[@]}"; do
        stow "$dir" || log_error "Failed to stow $dir"
        stow home --adopt || log_error "Failed to stow Home"
        done
      checklist[config_main]=true
} ||  checklist[config_main]=false
clear

###############################################################################################
# Section 3: Install Main Packages ############################################################
###############################################################################################
{
    echo -e "   📦️    Installing Main Packages..." | lsd-print
      PACKAGES2=(
        amd-ucode ark aylurs-gtk-shell bluez bluez-utils bpytop btrfs-progs cliphist cmake cmatrix
        duf efiibootmgr eza fastfetch fortune-mod fortune-mod-archlinux fzf go grimblast-git
        gst-plugin-pipewire gum htop iwd libpulse libva-intel-driver lsd lua ghostty
        ghostty-shell-integration ghostty-terminfo gtk-engine-murrine hyprpicker kate konsole
        konsole-gruvbox krusader kvantumnemo nemo-emblems nemo-preview nemo-python nemo-terminal
        neovim-cmp-nvim-lsp-git neovim-coc neovim-coc-highlight-git neovim-lightline-git
        neovim-lightline-gruvbox-material-git neovim-nvim-treesitter neovim-gruvbox-material-git
        neovim-lspconfig neovim-plug neovim-web-devicons-git nvim-lazy mason-lspconfig.nvim
        mason.nvim meson neovim-coc-highlight-git network-manager-applet noto-fonts noto-fonts-emoji
        otf-fira-sans otf-font-awesomepacman-mirrorlist pacseek pavucontrol pcmanfm-qt pipewire
        obs-studio pipewire-alsa pipewire-jack pipewire-pulse pomodorolm prettier python-annotated-types
        python-attrs python-autocommand python-build python-cattrs python-click python-colormaps
        python-colorthief python-columnar python-dbus python-colorama Python-docstring-to-markdown
        python-editables python-fastjsonschema python-ftputil python-gobject python-jsonschema
        python-jsonschema-specifications python-log_colorizer python-lsp-jsonrpc python-lsp-server
        python-lsprotocol python-lxml python-markdown python-markupsafe python-poetry-core
        python-powerline-git python-pygments python-pygments-style-gruvbox-git python-pynvim
        python-pytest python-string-color python-tcolorpy python-termcolor python-toolz
        python-tree-sitter-zathurarc python-webcolors python-wheel python-xtermcolor python2
        python2-pillow python2-pyfiglet python2-pygments python2-pygments-style-gruvbox-git
        python2-setuptools python3-colorsysplus  python-hyprpy python-jedi python-lsp-tree-sitter
        python-pillow python-powerline-git python-pygments python-pygments-style-gruvbox-git
        python-tree-sitter python-vlc rainbow rofi-calc ruby ruby-color ruby-colorator ruby-manpages
        ruby-rainbow rubygems rust slurp  smile starship syntax-highlighting timeshift timeshift-autosnap
        tmux yazi tldr++  tree-sitter tree-sitter-bash-highlight tree-sitter-c tree-sitter-lua
        tree-sitter-markdown tree-sitter-python-highlight tree-sitter-query tree-sitter-vim
        tree-sitter-vimdoc ttf-nerd-fonts-symbols vala vim-airline vim-airline-gruvbox-material-git
        vim-asyncomplete vim-asyncomplete-lsp-git vim-coc  vim-coc-vimlsp-git vim-gruvbox-material-git
        vim-lightline-git vim-lightline-gruvbox-material-git vim-nerdtree vim-nerdtree-syntax-highlighting
        vim-plug vim-polygot-git vim-rainbow-parentheses-improved-git vim-runtime vim-searchhighlighting
        vim-syntax-highlighting-feder vlc vlc-materia-skin-git vulkan-intel vulkan-radeon wget wireless_tools
        wireplumber wl-clipboard wl-clipboard-history-git wlogout wtf wtype xclip  xdg-utils xf86-video-amdgpu
        xf86-video-ati xf86-video-nouveau xf86-video-vmware xrg-server xorg-wayland xorg-xhost xorg-xinit xsettingsd
        zathura zathura-gruvbox-git zathura-pywal-gitzig zoxide zsh-autosuggestions-git zsh-syntax-highlighting
        )
        yay -S --noconfirm "${PACKAGES2[@]}"
        checklist[main_packages]=true
} ||    checklist[main_packages]=false
clear

###############################################################################################
# Section 4: Starting Cron Job  ###############################################################
###############################################################################################
{
    log_status "   🕰️    Setting up Cleanup cron job..."
    nohup setup_cron_job &
} || checklist[cron_job]=false
clear

###############################################################################################
# Section 5: Post-Configuration  ##############################################################
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

###############################################################################################
# Section 6: Post Install Checklist  ##########################################################
###############################################################################################

clear
print_checklist_tte

echo -e "\n       Hyprland Gruvbox Installation is Complete !! 🫠
        A list of common helpful keybinds is below:" | lsd-print

echo -e "  ⌨️  ▏ 󰖳 + ENTER             👻   Ghostty Terminal
  ⌨️  ▏ 󰖳 + B                     Firefox
  ⌨️  ▏ 󰖳 + F                     Krusader Browser
  ⌨️  ▏ 󰖳 + N                     NeoVim
  ⌨️  ▏ 󰖳 + Q                  󰅙   Close Window
  ⌨️  ▏ 󰖳 + SPACE              󰀻   Rofi App Launcher
  ⌨️  ▏ 󰖳 + CTRL + Q           󰗽   Logout 
  ⌨️  ▏ 󰖳 + Mouse Left        🪟   Move Window"

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
