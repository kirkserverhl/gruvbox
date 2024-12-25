#!/bin/bash

# Define source directory
SOURCE_DIR="$HOME/.dotfiles/assets"

# Define items to copy and their target locations
declare -A FILES_TO_COPY=(
    ["$SOURCE_DIR/sddm.conf.d"]="/usr/lib/sddm/sddm.conf.d"
    ["$SOURCE_DIR/pacman.conf"]="/etc/pacman.conf"
    ["$SOURCE_DIR/sddm.jpg"]="/usr/share/sddm/themes/Sugar-Candy/Backgrounds/sddm.jpg"
    ["$SOURCE_DIR/theme.conf"]="/usr/share/sddm/themes/Sugar-Candy/"
)

# Function to copy the file
copy_file() {
    local source=$1
    local target=$2

    # Check if the source file exists
    if [ ! -e "$source" ]; then
        echo "Error: Source file does not exist: $source"
        return 1
    fi

    # Check if the target exists and remove it
    if [ -e "$target" ]; then
        echo "Removing existing target: $target"
        sudo rm -rf "$target"
    fi

    # Copy the source to the target location
    echo "Copying file: $source -> $target"
    sudo cp -r "$source" "$target"
}

# Loop through the file items and copy them
for source in "${!FILES_TO_COPY[@]}"; do
    target=${FILES_TO_COPY[$source]}
    copy_file "$source" "$target" || { echo "Failed to copy file for $source"; exit 1; }
done

echo "Files setup complete."

