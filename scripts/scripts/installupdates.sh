#!/bin/bash
#  .___                 __         .__  .__
#  |   | ____   _______/  |______  |  | |  |
#  |   |/    \ /  ___/\   __\__  \ |  | |  |
#  |   |   |  \\___ \  |  |  / __ \|  |_|  |__
#  |___|___|  /____  > |__| (____  /____/____/
#           \/     \/            \/
#  ____ ___            .___       __
# |    |   \______   __| _/____ _/  |_  ____   ______
# |    |   /\____ \ / __ |\__  \\   __\/ __ \ /  ___/
# |    |  / |  |_> > /_/ | / __ \|  | \  ___/ \___ \
# |______/  |   __/\____ |(____  /__|  \___  >____  >
#          |__|        \/     \/          \/     \/
#
sleep 1
clear
install_platform="$(cat ~/scripts/platform.sh)"
figlet -f smslant "Updates"
echo

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------

if gum confirm "DO YOU WANT TO START THE UPDATE NOW?" ;then
    echo 
    echo ":: Update started."
elif [ $? -eq 130 ]; then
        exit 130
else
    echo
    echo ":: Update canceled."
    exit;
fi

# Check if platform is supported
case $install_platform in
    arch)
        aur_helper="$(cat ~/scripts/aur.sh)"

        _isInstalledAUR() {
            package="$1";
            check="$($aur_helper -Qs --color always "${package}" | grep "local" | grep "${package} ")";
            if [ -n "${check}" ] ; then
                echo 0; #'0' means 'true' in Bash
                return; #true
            fi;
            echo 1; #'1' means 'false' in Bash
            return; #false
        }

        if [[ $(_isInstalledAUR "timeshift") == "0" ]] ;then
            echo
            if gum confirm "DO YOU WANT TO CREATE A SNAPSHOT?" ;then
                echo
                c=$(gum input --placeholder "Enter a comment for the snapshot...")
                sudo timeshift --create --comments "$c"
                sudo timeshift --list
                sudo grub-mkconfig -o /boot/grub/grub.cfg
                echo ":: DONE. Snapshot $c created!"
                echo
            elif [ $? -eq 130 ]; then
                echo ":: Snapshot skipped."
                exit 130
            else
                echo ":: Snapshot skipped."
            fi
            echo
        fi

        $aur_helper

        if [[ $(_isInstalledAUR "flatpak") == "0" ]] ;then
            flatpak upgrade
        fi
    ;;
    fedora)
        sudo dnf upgrade
    ;;
    *)
        echo ":: ERROR - Platform not supported"
        echo "Press [ENTER] to close."
        read
    ;;
esac

notify-send "Update complete"
echo 
echo ":: Update complete"
echo 
echo 

echo "Press [ENTER] to close."
read
