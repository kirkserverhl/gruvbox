Arch Linux: HyprGruv Setup Instructions
Developed by Kirk Bass

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Prerequisites:

Ventoy USB: Create a bootable USB using Ventoy and add the latest Arch Linux ISO to it.

Ensure Internet Access: Wired or wireless connection for installation.

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Step 1: Install Arch Linux

Insert the Ventoy USB when the computer is off, turn on your device and you will choose the the Arch Linux ISO from the option menu.

Select Normal Mode in the boot menu and then choose archinstall-medium.

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Step 2: Install Arch Linux Using 'archinstall'

Launch the guided installer with command:
 
$ archinstall

Configure Installation:

Choose mirrors: US / back
Disk Configuration: Partitioning, Use best-effort, choose drive, btrfs (or ext4), no btrfs subvolumes, use compression, no separate home partition / back
Swap: enabled
Bootloader: grub
Choose Hostname & Password
Create User Account, password, give sudo privileges / confirm & exit
Profile: Type, Desktop, Hyprland, polkit / back
Audio: Pipewire
Network Configuration: Use NetworkManager
Additional Packages: firefox
Choose Timezone
Install

Once installation is completed use the following commands to reboot:

"Would you like to chroot?"    

$  no
$  shutdown -–now

When the device is powered off remove the Ventoy usb and restart the device.


XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Step 3: Initial Login and Configuration

When Arch linux boots up you are greeted with the SDDM sign-on screen.

In top left of screen choose 'Hyprland' for session, not (uwsm-managed)

Use the user credentials created durring the archinstall to login!

Open terminal with keybind:   Win + Q    
 **temporary, after install   Win + ENTER

### $ firefox
### Login to github.com

Run the following string of commands Line:

sudo pacman -S git && git clone https://github.com/kirkserverhl/gruvbox.git ~/.dotfiles && cd ~/.dotfiles && ./install.sh

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

The initial install will install the base packages and configure the zsh or bash shell configuration.  At this point the device will reboot to complete configurations.  
When the device reboots the next half of the installation, configuration, will begin in which personal preferences and extras can be configured.

If the script does not finish completely either ~/.dotfiles/install.sh or ~/scriptss/config.sh can be ran manually or at any time to change original configurations.

Please note that full configuration will require a restart.

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

To move windows you can use: Win + Left Mouse
**permanent bind, works before and after install

To close windows during install use:  Win + C
** temporary bind, after install use:  Win + Q

** be careful closing unnecessary windows during install

** after install a list of keydinds is available using:
 ‘Win + K’ or by typing ‘keybinds’ in the terminal.

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

