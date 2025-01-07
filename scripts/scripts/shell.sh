./#!/bin/bash
clear
########################################################################## KMB 2025
### Gruvbox colors  ###############################################################
###################################################################################
RESET="\e[0m"                 	 # Reset ##
GREEN="\e[38;2;142;192;124m"  	 #8ec07c ##  **Notes
CYAN="\e[38;2;69;133;136m"    	 #458588 ##
YELLOW="\e[38;2;215;153;33m"  	 #d79921 ##
RED="\e[38;2;204;36;29m"      	 #cc241d ##
GRAY="\e[38;2;60;56;54m"      	 #3c3836 ##
BOLD="\e[1m"                  	 # Bold  ##

###################################################################################
# Function to display headers with figlet     #####################################
###################################################################################

display_header() {
    # clear
    figlet -f ~/.local/share/fonts/Graffiti.flf "$1"
}
###################################################################################
# Initialize checklist array ######################################################
###################################################################################

display_header "Shell Setup" | lsd-print

sleep 1

_isInstalledYay() {
    package="$1";
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "\." | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

clear
figlet -f smslant "Shell"

echo ":: Please select your preferred shell"
echo
shell=$(gum choose "bash" "zsh" "Cancel")
# ----------------------------------------------------- 
# Activate bash
# ----------------------------------------------------- 
if [[ $shell == "bash" ]] ;then

    # Change shell to bash
    while ! chsh -s $(which bash); do
        echo "ERROR: Authentication failed. Please enter the correct password."
        sleep 1
    done
    echo ":: Shell is now bash."

    gum spin --spinner dot --title "Please reboot your system." -- sleep 3

# ----------------------------------------------------- 
# Activate zsh
# ----------------------------------------------------- 
elif [[ $shell == "zsh" ]] ;then

    # Change shell to shh
    while ! chsh -s $(which zsh); do
        echo "ERROR: Authentication failed. Please enter the correct password."
        sleep 1
    done
    echo ":: Shell is now zsh."

    # Installing oh-my-posh
    # yay -S oh-my-posh-bin

    # Installing oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo ":: Installing oh-my-zsh"
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        cp ~/.config/ml4w/tpl/.zshrc ~/
    else
        echo ":: oh-my-zsh already installed"
    fi

    # Installing zsh-autosuggestions
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
        echo ":: Installing zsh-autosuggestions"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    else
        echo ":: zsh-autosuggestions already installed"
    fi

    # Installing zsh-syntax-highlighting
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
        echo ":: Installing zsh-syntax-highlighting"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    else
        echo ":: zsh-syntax-highlighting already installed"
    fi

    # Installing fast-syntax-highlighting
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting" ]; then
        echo ":: Installing fast-syntax-highlighting"
        git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting 
    else
        echo ":: fast-syntax-highlighting already installed"
    fi

    gum spin --spinner dot --title "Please reboot your system." -- sleep 3

# ----------------------------------------------------- 
# Cencel
# ----------------------------------------------------- 
else
    echo ":: Changing shell canceled"
    exit
fi
