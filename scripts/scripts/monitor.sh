#!/bin/bash

# Path to the monitor.conf file that we want to modify
monitor_conf="~/.dotfiles/hypr/.config/hypr/conf/monitor.conf"

# Define the paths for each configuration
default_conf="~/.config/hypr/conf/monitors/default.conf"
thin_gruv_conf="~/.config/hypr/conf/monitors/thin_gruv.conf"

# Expand the ~ symbol to the full home directory path
monitor_conf=$(eval echo $monitor_conf)
default_conf=$(eval echo $default_conf)
thin_gruv_conf=$(eval echo $thin_gruv_conf)

# Prompt user for the workspace setup choice
echo "Which setup are you using?"
echo "1. Default"
echo "2. Thin Gruv"

read -p "Enter choice (1 or 2): " choice

# Determine the appropriate config file based on the user input
case "$choice" in
  1)
    # If the user chooses 'default', update the monitor.conf with default.conf
    selected_conf="$default_conf"
    ;;
  2)
    # If the user chooses 'thin_gruv', update the monitor.conf with thin_gruv.conf
    selected_conf="$thin_gruv_conf"
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

