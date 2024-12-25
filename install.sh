#!/bin/bash

# Checklist to track completed sections
declare -A checklist
checklist=(
	[git_and_yay]=false
	[install_packages]=false
	[configuration]=false
	[cron_job]=false
	[post_configuration]=false
	[extra_utilities]=false
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
	cd .dotfiles && stow scripts && cd ~/scripts && ./assets.sh && cd ..
	yay -Syyu --noconfirm || log_error "Failed to update package database"

	PACKAGES=(
		# List of packages...
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

	STOW_DIRS=( "ags" "alacritty" "bat" # Add other directories
	)

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
	rm ~/.bash_history ~/.bash_logout ~/.bash_profile ~/.bashrc

	cd ~/scripts || log_error "Failed to enter scripts directory"
	./shell.sh || log_error "Failed to run shell.sh"
	./cleanup.sh || log_error "Failed to run cleanup.sh"
	./zsh_fix.sh || log_error "Failed to run zsh_fix.sh"
	./assets.sh || log_error "Failed to run assets.sh"
	./hypr_swap.sh || log_error "Failed to run hypr_swap.sh"
	checklist[post_configuration]=true
} || checklist[post_configuration]=false

# Section 6: Extra Utilities (linux_util.sh)
{
	read -rp "Would you like to install a Grub Theme/ Extra Utilities? (y/n): " choice
	if [[ "$choice" =~ ^[Yy]$ ]]; then
		cd ~/scripts || log_error "Failed to enter scripts directory"
		./linux_util.sh || log_error "Failed to run linux_util.sh"
		checklist[extra_utilities]=true
	else
		log_status "Skipping Grub Theme/ Extra Utilities installation."
		checklist[extra_utilities]=false
	fi
}

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






