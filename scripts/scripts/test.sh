#!/bin/bash

# Path to the monitor.conf file that we want to modify
monitor_conf="~/.dotfiles/hypr/.config/hypr/conf/monitor.conf"

# Expand the ~ symbol to the full home directory path
monitor_conf=$(eval echo $monitor_conf)

# Dynamically list all available configuration files in the monitors directory
monitor_dir="$HOME/.config/hypr/conf/monitors"
configs=($(find "$monitor_dir" -type f -name "*.conf"))

# Prompt user to ignore monitor.conf in Git
read -p "Do you want to ignore monitor.conf in Git (y/n)? " git_ignore_choice

if [[ "$git_ignore_choice" =~ ^[Yy]$ ]]; then
    echo "Marking monitor.conf as assume-unchanged in Git..."
    git update-index --assume-unchanged "$monitor_conf"
    echo "monitor.conf is now ignored by Git."
else
    echo "Ensuring monitor.conf is tracked by Git..."
    git update-index --no-assume-unchanged "$monitor_conf"
    echo "monitor.conf is now being tracked by Git."
fi

# Display available configurations to the user
echo "Available monitor configurations:"
for i in "${!configs[@]}"; do
    config_name=$(basename "${configs[$i]}")
    echo "$((i + 1)). $config_name"
done

# Prompt user to select a configuration
read -p "Enter the number of your choice: " choice

# Validate the choice
if [[ "$choice" -ge 1 && "$choice" -le "${#configs[@]}" ]]; then
    selected_conf="${configs[$((choice - 1))]}"
    selected_name=$(basename "$selected_conf")
    echo "You selected: $selected_name"
else
    echo "Invalid choice. Exiting."
    exit 1
fi

# Update the monitor.conf file with the selected configuration
echo "Updating monitor.conf to use $selected_conf..."
sed -i "s|source = .*|source = $selected_conf|" "$monitor_conf"

# Send a dunst notification
notify-send -u normal -t 3000 "Monitor Configuration Updated" "Selected: $selected_name"

echo "monitor.conf has been updated successfully!"

