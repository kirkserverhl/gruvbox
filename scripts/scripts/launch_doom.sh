#!/bin/bash

# Run doom
cd ~/terminal-doom && zig-out/bin/terminal-doom


#!/bin/bash

# Launch doom in a floating window
# cd ~/terminal-doom && zig-out/bin/terminal-doom &

# Wait for the window to launch
#sleep 1

# Get the window ID of the last launched window and make it float
# window_id=$(hyprctl clients | grep 'terminal-doom' | awk '{print $1}')
# hyprctl dispatch rule windowid:$window_id float
