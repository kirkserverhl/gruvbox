#!/bin/bash

# Path to the monitor.conf file that we want to modify
monitor_conf="~/.dotfiles/hypr/.config/hypr/conf/monitor.conf"

# Define the paths for each configuration
default_conf="~/.config/hypr/conf/monitors/default.conf"
gruvbox_conf="~/.config/hypr/conf/monitors/gruvbox.conf"
thin_gruv_conf="~/.config/hypr/conf/monitors/thin_gruv.conf"
double_monitor_conf="~/.config/hypr/conf/monitors/double_monitor.conf"
single_monitor_conf="~/.config/hypr/conf/monitors/single_monitor.conf"

# Expand the ~ symbol to the full home directory path
monitor_conf=$(eval echo $monitor_conf)
default_conf=$(eval echo $default_conf)
gruvbox_conf=$(eval echo $gruvbox_conf)
thin_gruv_conf=$(eval echo $thin_gruv_conf)
double_monitor_conf=$(eval echo $double_monitor_conf)
single_monitor_conf=$(eval echo $single_monitor_conf)

# Ask if the user wants to ignore monitor.conf in Git
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

# Prompt user for the workspace setup choice
echo "Which setup are you using?"
echo "1. Default"
echo "2. Gruvbox"
echo "3. Thin Gruv"
echo "4. Double Monitor"
echo "5. Single Monitor"

read -p "Enter choice (1-5): " choice

# Determine the appropriate config file based on the user input
case "$choice" in
  1)
    selected_conf="$default_conf"
    ;;
  2)
    selected_conf="$gruvbox_conf"
    ;;
  3)
    selected_conf="$thin_gruv_conf"
    ;;
  4)
    selected_conf="$double_monitor_conf"
    ;;
  5)
    selected_conf="$single_monitor_conf"
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

# Update the monitor.conf file with the selected configuration
echo "Updating monitor.conf to use $selected_conf..."
sed -i "s|source = .*|source = $selected_conf|" "$monitor_conf"

echo "monitor.conf has been updated successfully!"

