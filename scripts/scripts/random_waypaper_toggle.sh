#!/bin/bash
# File: ~/scripts/random_waypaper_toggle.sh

PIDFILE="$HOME/.random_waypaper.pid"

# Check if the PID file exists
if [[ -f "$PIDFILE" ]]; then
    # If it exists, stop the running process
    if kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        echo "Stopping random wallpaper changer..."
        kill "$(cat "$PIDFILE")" && rm "$PIDFILE"
        exit 0
    else
        # If the PID file exists but the process isn't running, clean up
        echo "Process not running. Cleaning up PID file."
        rm "$PIDFILE"
    fi
fi

# Function to clean up on shutdown or reboot
cleanup() {
    echo "Cleaning up random wallpaper changer..."
    rm -f "$PIDFILE"
    exit
}

# Start the process
echo "Starting random wallpaper changer..."
trap cleanup SIGINT SIGTERM EXIT  # Ensure cleanup on script termination
(
    while true; do
        waypaper --random
        sleep 300  # 5 minutes
    done
) &
echo $! > "$PIDFILE"

