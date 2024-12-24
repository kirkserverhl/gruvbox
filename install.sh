#!/bin/bash

# Checklist to track completed sections
declare -A checklist
checklist=(
    [git_and_yay]=false
    [install_packages]=false
    [configuration]=false
    [cron_job]=false
    [ssh_keygen]=false
    [post_configuration]=false
    [git_config]=false
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

# Check if GitHub authentication is valid (for email kirkserverhl@gmail.com)
check_github_authentication() {
    local current_email
    current_email=$(git config --global user.email)

    if [ "$current_email" == "kirkserverhl@gmail.com" ]; then
        log_status "GitHub authenticated as kirkserverhl with email $current_email."
        return 0  # Authenticated
    else
        log_status "Not authenticated with GitHub as kirkserverhl or incorrect email."
        return 1  # Not authenticated
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
        # List of packages
    )

    yay -S --noconfirm "${PACKAGES[@]}" || log_error "Failed to install packages"
    checklist[install_packages]=true
} || checklist[install_packages]=false

# Section 3: Configuration
{
    log_status "Applying configurations..."
    unzip ~/a.zip -d ~/ || log_error "Failed to unzip a.zip"
    rm -f ~/a.zip || log_error "Failed to remove a.zip"

    sudo mv ~/.dotfiles/assets/pacman.conf /etc/ || log_error "Failed to move pacman.conf"
    mv ~/.dotfiles/assets/wallpaper /home/kirk/ || log_error "Failed to move wallpaper"

    sudo rm -r -f /usr/lib/sddm/sddm.conf.d || log_error "Failed to remove old sddm config"
    sudo mv ~/.dotfiles/assets/sddm.conf.d /usr/lib/sddm/ || log_error "Failed to move sddm.conf.d"
    sudo mv ~/.dotfiles/assets/sddm.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds/ || log_error "Failed to move sddm.jpg"

    cd ~/.dotfiles || log_error "Failed to enter .dotfiles directory"

    STOW_DIRS=("ags" "alacritty" "bat" "bpytop" "byobu" "dunst" "fastfetch" "fontconfig" "fzf" "gtk-3.0" "gtk-4.0" "home"
        "htop" "hypr" "kitty" "nemo" "nwg-look" "pacseek" "qt6ct" "ranger" "rofi" "scripts" "sddm" "settings" "vlc"
        "wal" "waybar" "waypaper" "wlogout" "xsettingsd" "yazi" "znt" ".config" "oh-my-zsh")

    for dir in "${STOW_DIRS[@]}"; do
        stow "$dir" || log_error "Failed to stow $dir"
    done

    checklist[configuration]=true
} || checklist[configuration]=false

# Section 4: Starting Cron Job
{
    log_status "Setting up cron job..."
    setup_cron_job
} || checklist[cron_job]=false

# Section 5: SSH Key Generation (Removed for others)
{
    log_status "Creating and adding SSH key for GitHub..."

    SSH_KEY_PATH="$HOME/.ssh/id_ed25519"
    if [ -f "$SSH_KEY_PATH" ]; then
        log_status "SSH key already exists. Skipping creation."
    else
        ssh-keygen -t ed25519 -C "kirkserverhl@gmail.com" -f "$SSH_KEY_PATH" -N "" || log_error "Failed to generate SSH key"
        log_status "SSH key created successfully."
    fi

    eval "$(ssh-agent -s)" || log_error "Failed to start SSH agent"
    ssh-add "$SSH_KEY_PATH" || log_error "Failed to add SSH key to agent"

    if command -v xclip &>/dev/null; then
        xclip -selection clipboard < "$SSH_KEY_PATH.pub"
        log_status "SSH key copied to clipboard. Please add it to GitHub."
    else
        log_status "Install xclip to copy SSH key to clipboard automatically."
    fi

    log_status "SSH public key:"
    cat "$SSH_KEY_PATH.pub"

    if command -v xdg-open &>/dev/null; then
        log_status "Opening GitHub SSH key settings page..."
        xdg-open "https://github.com/settings/keys"
    else
        log_status "Please visit https://github.com/settings/keys to add the SSH key manually."
    fi

    checklist[ssh_keygen]=true
} || checklist[ssh_keygen]=false

# Section 6: Git Configuration (Optional for authenticated users)
{
    if check_github_authentication; then
        log_status "Running git_config.sh for authenticated user..."
        ~/.dotfiles/scripts/git_config.sh || log_error "Failed to run git_config.sh"
        checklist[git_config]=true
    else
        log_status "Skipping GitHub configuration because authentication failed."
    fi
} || checklist[git_config]=false

# Section 7: Post-Configuration
{
    log_status "Running post-configuration scripts..."

    cd scripts || log_error "Failed to enter scripts directory"

    ./shell.sh || log_error "Failed to run shell.sh"
    ./cleanup.sh || log_error "Failed to run cleanup.sh"

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






