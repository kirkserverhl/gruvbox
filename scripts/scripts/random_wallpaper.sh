#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/wallpapers"

# Loop to change wallpaper every 6 minutes
while true; do
    # Select a random wallpaper
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    # Set the wallpaper using waypaper
    waypaper --random #output eDP-1 --file "$WALLPAPER"

    # Update Pywal colorscheme
    wal -i "$WALLPAPER"

    # Reload Hyprland configuration to apply the new color scheme
    hyprctl reload

    # Wait for 6 minutes before changing again
    sleep 360
done

