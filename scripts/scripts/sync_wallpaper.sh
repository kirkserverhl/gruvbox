#!/bin/bash

# Variables
WALLPAPER_FILE="$HOME/.config/settings/cache/current_wallpaper"
TARGET_USER="kirk"
TARGET_IP="192.168.0.69"
TARGET_WALLPAPER_FILE="/home/kirk/.config/settings/cache/current_wallpaper"

# Sync the wallpaper file to Computer B
scp -i ~/.ssh/id_ed25519 "$WALLPAPER_FILE" "$TARGET_USER@$TARGET_IP:$TARGET_WALLPAPER_FILE"

# Optional: Trigger wallpaper change on Computer B
ssh -i ~/.ssh/id_ed25519 "$TARGET_USER@$TARGET_IP" "waypaper set /home/kirk/wallpaper/$(cat $TARGET_WALLPAPER_FILE)"


