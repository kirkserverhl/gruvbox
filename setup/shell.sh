#!/bin/bash

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
echo ":: Please select your preferred shell"
echo ""
echo ":: For best install and setup use Zsh !!" | lsd-print
echo ""

shell=$(gum choose "zsh" "bash" "Cancel")

####  Activate bash  ####

if [[ $shell == "bash" ]] ;then

    # Change shell to bash
    while ! chsh -s $(which bash); do
        echo "ERROR: Authentication failed. Please enter the correct password."
        sleep 1
#####  Cancel      done
    echo ":: Shell is now bash."

    gum spin --spinner dot --title "Please reboot your system." -- sleep 3

#####  Activate zsh  #####

elif [[ $shell == "zsh" ]] ;then

    # Change shell to zsh
    while ! chsh -s $(which zsh); do
        echo "ERROR: Authentication failed. Please enter the correct password."
        sleep 1
    done
    echo ":: Shell is now zsh."

#####  Cancel      #####

else
    echo ":: Changing shell canceled"
    exit
fi
