#!/bin/bash

# Directory and file to watch
WATCH_DIR="$HOME/.config/settings/cache"
FILE_NAME="current_wallpaper"

# Monitor changes to the file
inotifywait -m -e modify "$WATCH_DIR/$FILE_NAME" | while read; do
    # Trigger wallpaper sync when the file is modified
    ~/scripts/sync_wallpaper.sh
done

