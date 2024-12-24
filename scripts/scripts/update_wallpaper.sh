#!/bin/bash

# Variables
WALLPAPER_FILE="$HOME/.config/settings/cache/current_wallpaper"

# Read the current wallpaper path from the file
CURRENT_WALLPAPER=$(cat "$WALLPAPER_FILE")

# Set the wallpaper using Waypaper (the full path is already in the file)
waypaper --backend hyprpaper --wallpaper "$CURRENT_WALLPAPER"
