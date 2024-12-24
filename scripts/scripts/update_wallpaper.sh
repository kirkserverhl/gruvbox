#!/bin/bash

# Variables
WALLPAPER_FILE="$HOME/.config/settings/cache/current_wallpaper"

# Read the current wallpaper path
CURRENT_WALLPAPER=$(cat "$WALLPAPER_FILE")

# Set the wallpaper using Waypaper
waypaper --backend hyprpaper --wallpaper "$CURRENT_WALLPAPER"

