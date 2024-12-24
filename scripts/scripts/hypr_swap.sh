#!/bin/bash

cd ~/.dotfiles  
touch ~/.config/hypr/hyprland.conf &&
rm ~/.config/hypr/hyprland.conf && stow hypr --adopt &&
waypaper --random && 
touch ~/.config/hypr/hyprland.conf
