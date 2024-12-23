#!/bin/bash
echo "Setting up dotfiles..."
# -----------------------------------------------------
# INIT
# -----------------------------------------------------

# Exit on error
set -e

# Function to print status messages
log_status() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1"
    exit 1
}

# -----------------------------------------------------
# INSTALLATION
# -----------------------------------------------------

####  Install Git and yay! #### 
log_status "Installing Git and Yay..."

sudo pacman -S --noconfirm git || log_error "Failed to install git"

# Clone yay from AUR and build
git clone https://aur.archlinux.org/yay.git || log_error "Failed to clone yay"
cd yay
makepkg -si --noconfirm || log_error "Failed to build and install yay"
cd .. || log_error "Failed to return to home directory"

####  Install Packages ####
log_status "Installing packages..."

yay -Syyu --noconfirm || log_error "Failed to update package database"

# List of packages
PACKAGES=(
    alacritty amd-ucode base base-devel blueprint-compiler bluez bpytop brightnessctl btrfs-progs cliphist cmake cmatrix cbonsai-git
    duf dunst efibootmgr eza fastfetch figlet firefox fortune-mod fortune-mod-hackers fortune-mod-archlinux fzf git
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
    zsh
)

yay -S --noconfirm "${PACKAGES[@]}" || log_error "Failed to install packages"

# -----------------------------------------------------
# CONFIGURATION
# -----------------------------------------------------

####  Move Assets #### 
log_status "Moving assets..."

unzip ~/a.zip -d ~/ || log_error "Failed to unzip a.zip"
rm -f ~/a.zip || log_error "Failed to remove a.zip"

# Move pacman.conf and wallpaper
sudo mv ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
mv ~/.dotfiles/assets/wallpaper /home/kirk/ || log_error "Failed to move wallpaper"

# Move SDDM configuration files
sudo rm -r -f /usr/lib/sddm/sddm.conf.d || log_error "Failed to remove old sddm config"
sudo mv ~/.dotfiles/assets/sddm.conf.d /usr/lib/sddm/ || log_error "Failed to move sddm.conf.d"
sudo mv ~/.dotfiles/assets/sddm.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds/ || log_error "Failed to move sddm.jpg"

####  Distribute Stow Files #### 
log_status "Distributing stow files..."

cd ~/.dotfiles || log_error "Failed to enter .dotfiles directory"

# Stow directories
STOW_DIRS=("ags" "alacritty" "bat" "bpytop" "byobu" "dunst" "fastfetch" "fontconfig" "fzf" "gtk-3.0" "gtk-4.0" "home"
    "htop" "hypr" "kitty" "nemo" "nvim" "nwg-look" "pacseek" "qt6ct" "ranger" "rofi" "scripts" "sddm" "settings" "vlc"
    "wal" "waybar" "waypaper" "wlogout" "xsettingsd" "yazi" "znt" ".config" "oh-my-zsh")

# Stow each directory
for dir in "${STOW_DIRS[@]}"; do
    stow "$dir" || log_error "Failed to stow $dir"
done

####  Scripts, Cleanup, Zsh, Reboot #### 
log_status "Making scripts executable..."

# Batch set permissions for scripts
find ~/.dotfiles/scripts/scripts -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/scripts/scripts -type f -name "*.py" -exec chmod +x {} \;
find ~/.dotfiles/rofi/.config/rofi/applets/bin -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/ags/.config/ags/scripts -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/hypr/.config/hypr/hyprctl -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/hypr/.config/hypr/scripts -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/settings/.config/settings -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/waybar/.config/waybar/themes/gruv-blur/colored -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/waybar/.config/waybar/themes/gruv-blur/dark -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/waybar/.config/waybar/themes/gruv-blur/light -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/waybar/.config/waybar/themes/gruv-blur/mixed -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/waybar/.config/waybar/themes/gruv/colored -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/waybar/.config/waybar/themes/gruv/dark -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/waybar/.config/waybar/themes/gruv/light -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/zsh/.oh-my-zsh -type f -name "*.sh" -exec chmod +x {} \;
find ~/.dotfiles/zsh/.oh-my-zsh/tools -type f -name "*.sh" -exec chmod +x {} \;


#### SSH Key for GitHub ####
log_status "Creating and adding SSH key for GitHub..."

# Check if SSH key already exists
SSH_KEY_PATH="$HOME/.ssh/id_ed25519"
if [ -f "$SSH_KEY_PATH" ]; then
    log_status "SSH key already exists. Skipping creation."
else
    # Generate a new SSH key
    ssh-keygen -t ed25519 -C "kirkserverhl@gmail.com" -f "$SSH_KEY_PATH" -N "" || log_error "Failed to generate SSH key"
    log_status "SSH key created successfully."
fi

# Add the SSH key to the agent
eval "$(ssh-agent -s)" || log_error "Failed to start SSH agent"
ssh-add "$SSH_KEY_PATH" || log_error "Failed to add SSH key to agent"

# Copy SSH key to clipboard
if command -v xclip &>/dev/null; then
    xclip -selection clipboard < "$SSH_KEY_PATH.pub"
    log_status "SSH key copied to clipboard. Please add it to GitHub."
else
    log_status "Install xclip to copy SSH key to clipboard automatically."
fi

# Print SSH key to the console as a fallback
log_status "SSH public key:"
cat "$SSH_KEY_PATH.pub"

# Open GitHub SSH key settings page (if xdg-open is available)
if command -v xdg-open &>/dev/null; then
    log_status "Opening GitHub SSH key settings page..."
    xdg-open "https://github.com/settings/keys"
else
    log_status "Please visit https://github.com/settings/keys to add the SSH key manually."
fi


####  Run Post-Configuration Scripts and Reboot #### 
log_status "Running post-configuration scripts..."

cd scripts || log_error "Failed to enter scripts directory"

# Run shell and cleanup scripts
./shell.sh || log_error "Failed to run shell.sh"
./cleanup.sh || log_error "Failed to run cleanup.sh"

# Reboot the system
log_status "Rebooting the system..."
reboot


set -e

log_status() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1"
    exit 1
}


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






