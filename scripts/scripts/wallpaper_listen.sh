#!/bin/bash

# Path to the file containing the wallpaper path
CURRENT_WALLPAPER_FILE="$HOME/.config/settings/cache/current_wallpaper"

# Ensure the current_wallpaper file exists
if [[ ! -f "$CURRENT_WALLPAPER_FILE" ]]; then
    echo "Error: current_wallpaper file not found."
    exit 1
fi

# Read the wallpaper path from the file
CURRENT_WALLPAPER=$(cat "$CURRENT_WALLPAPER_FILE")

# Ensure the wallpaper file exists (it should be symlinked)
if [[ ! -f "$CURRENT_WALLPAPER" ]]; then
    echo "Error: Wallpaper file not found: $CURRENT_WALLPAPER"
    exit 1
fi

# Update the wallpaper using waypaper on Computer A
echo "Setting wallpaper to: $CURRENT_WALLPAPER"
waypaper --wallpaper "$CURRENT_WALLPAPER"

# Optionally, you can run pywal or other wallpaper-related commands here

# Wait for 30 seconds before updating Computer B
echo "Waiting 30 seconds before updating Computer B's wallpaper..."
sleep 30

# SSH into Computer B and run the update_wallpaper.sh script
echo "Triggering wallpaper update on Computer B..."
ssh kirk@192.168.0.69 'bash -s' < ~/scripts/update_wallpaper.sh

