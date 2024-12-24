#!/bin/bash

# Define source directory
SOURCE_DIR="$HOME/.dotfiles/assets"

# Define items to symlink and their target locations
declare -A SYMLINKS=(
    ["$SOURCE_DIR/sddm.conf.d"]="/usr/lib/sddm/sddm.conf.d"
    ["$SOURCE_DIR/pacman.conf"]="/etc/pacman.conf"
    ["$SOURCE_DIR/sddm.jpg"]="/usr/share/sddm/themes/Sugar-Candy/Backgrounds/sddm.jpg"
)

# Function to create a symlink
create_symlink() {
    local source=$1
    local target=$2

    # Check if the target exists and handle it
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Removing existing target: $target"
        sudo rm -rf "$target"
    fi

    # Create the symlink
    echo "Creating symlink: $target -> $source"
    sudo ln -s "$source" "$target"
}

# Loop through the symlink items and create them
for source in "${!SYMLINKS[@]}"; do
    target=${SYMLINKS[$source]}
    create_symlink "$source" "$target"
done

echo "Symlinks setup complete."

