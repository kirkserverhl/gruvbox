#!/bin/bash
{

	# cd ~/.dotfiles
	stow home --adopt
	stow .config ags bat bpytop byobu dunst fastfetch fontconfig fzf ghostty gtk-2.0 gtk-3.0 gtk-4.0 home htop hypr kate kitty kvantum nvim nwg-dock-hyprland nwg-drawer nwg-look oh-my-zsh pomodorolm qt5ct qt6ct ranger rofi scripts sddm settings tmux vlc wal waybar waypaper wlogout xdg-desktop-portal xsettingsd yazi zed znt --adopt

}
