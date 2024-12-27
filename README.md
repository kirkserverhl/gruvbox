Arch Linux Gruvbox by KirkServerHL Setup Instructions

Prerequisites:

Ventoy USB: Create a bootable USB using Ventoy and add the latest Arch Linux ISO to it.

Ensure Internet Access: Wired or wireless connection for installation.

Step 1: Boot into Arch Linux

Insert the USB and boot into the Arch Linux ISO.

Select Normal Mode in the boot menu.

Step 2: Install Arch Linux Using archinstall

Launch the guided installer:
 
Cmd: ‘archinstall’

Configure Installation:

Mirrors: Choose mirror region, once complete, go ‘back’ 

Disk Configuration: Partitioning, best effort, Choose your drive, select BTRFS, yes, use compression, go ‘back’ 

Bootloader: Select GRUB 

Root Password: Set a password for the root user

User Creation: Add a user and set a password, confirm and exit 

Profile: Type, Choose Desktop, then Hyprland, and enable Polkit, go ‘back’ 

Audio: Select PulseAudio.

Additional Packages: Add ‘firefox’

Network Configuration: Choose NetworkManager.

Timezone: Set your timezone.

Run install.

3.  Once complete Exit installer:  	‘exit’

4.  Reboot:				‘reboot’ or ‘shutdown - - now’

Optional: Setup swap partition. 
If not setting up swap use ‘shutdown - -now’ then remove usb and restart computer.

Step 3: Initial Login

At the login screen, switch to the Hyprland profile and log in with the username and password you created.

Open a terminal with Win + Q  

Launch Firefox with command ‘firefox’

Step 4: Prepare for Setup

Log in to your accounts:
GitHub: Log in to ensure you can clone repositories.
Google (optional): Sync browser settings if needed.

Step 5: Install Hyprland Setup

Open a terminal with ‘Win + Q’

Run the following  line of commands to start the installation:

sudo pacman -S git && git clone https://github.com/kirkserverhl/gruvbox.git ~/.dotfiles && cd ~/.dotfiles && ./install.sh

Common Issues and Fixes

Network Not Working After Reboot:

Ensure NetworkManager is running:
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
Check your Wi-Fi or Ethernet settings.

Display Issues with Hyprland:

Ensure the necessary graphics drivers are installed:
sudo pacman -S mesa xf86-video-amdgpu  / xf86-video-intel nvidia
(Choose the appropriate driver for your GPU.)

Errors Cloning Repository:

Verify your internet connection.

Log into GitHub in your browser and confirm access.

Script Errors:

Ensure the script has execute permissions:
chmod +x ~/.dotfiles/install.sh
Rerun the script if it fails:	 ~/.dotfiles/install.sh
Missing Firefox or Other Applications:
Install manually with:	 sudo pacman -S firefox

