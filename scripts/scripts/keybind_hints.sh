#!/usr/bin/env sh

ScrDir=$(dirname $(realpath $0))
source $ScrDir/globalcontrol.sh
roconf="~/.config/rofi/config-compact.rasi"
# roconf="~/.config/rofi/keybind_hints.rasi"

# read hypr theme border
# wind_border=$((hypr_border * 3))
#elem_border=$([ $hypr_border -eq 0 ] && echo "10" || echo $((hypr_border * 2)))
#r_override="window {border: ${hypr_width}px; border-radius: ${wind_border}px;} element {border-radius: ${elem_border}px;}"

# read hypr font size
#fnt_override=$(gsettings get org.gnome.desktop.interface font-name | awk '{gsub(/'\''/,""); print $NF}')
#fnt_override="configuration {font: \"JetBrainsMono Nerd Font ${fnt_override}\";}"

# read hypr theme icon
#icon_override=$(gsettings get org.gnome.desktop.interface icon-theme | sed "s/'//g")
#icon_override="configuration {icon-theme: \"${icon_override}\";}"

keybinds_hint="󰌓 ▏󰖳 + 󰿄                  Kitty
󰌓 ▏󰖳 + 󰯯                  Firefox
󰌓 ▏󰖳 + 󰰓                  Nemo
󰌓 ▏󰖳 + CTRL + 󰰓           NeoVim
󰌓 ▏󰖳 + CTRL + 󰰫           Yazi File Browser
󰌓 ▏󰖳 + CTRL + 󰰟           Ranger File Browser
󰌓 ▏󰖳 + CTRL + 󰿄           Rofi App Launcher
󰌓 ▏󰖳 + CTRL + 󰰁           Open Htop
󰌓 ▏󰖳 + CTRL + 󰯯           Open Btop
󰌓 ▏󰖳 + CTRL + 󰰥          Open Bpytop
󰌓 ▏󰖳 + CTRL + 󰯲           K-Calc
󰌓 ▏󰖳 + CTRL + 󰯸           Smile Emoji
󰌓 ▏󰖳 + CTRL + 󰰫           VLC Player
󰌓 ▏󰖳 + CTRL + 󰰐           Network Manager
󰌓 ▏󰖳 + CTRL + 󰰜           Logout
━━━━━━━━━━━━━━━━━ Utils ━━━━━━━━━━━━━━━━━━━━
󰌓 ▏󰖳 + CTRL + Tab         List Opened Apps
󰌓 ▏󰖳 + SHIFT + 󰯲          Open Clipboard History
󰌓 ▏󰖳 + Print              Screenshot
󰌓 ▏󰖳 + Shift + 󰰢          Screenshot
󰌓 ▏󰖳 + CTRL + 󰰮           Select Wallpaper
󰌓 ▏󰖳 + 󰘶 + 󰰮              Random Wallpaper
󰌓 ▏󰖳 + 󰘶 + 󰰁              HyprShade (BlueFilter)
━━━━━━━━━━━━━━━━━━ Windows ━━━━━━━━━━━━━━━━━━
󰌓 ▏󰖳 + 󰰜                  Kill Active Window
󰌓 ▏󰖳 + 󰯻                  Fullscreen
󰌓 ▏󰖳 + 󰰢                  Toggle Split
󰌓 ▏󰖳 + 󰰥                  Toggle Floating
󰌓 ▏󰖳 + SHIFT + 󰰥          Toggle Group Float
󰌓 ▏󰖳 + 󰯾                  Toggle Group
󰌓 ▏ALT + 󰰴                Move Window    
󰌓 ▏󰖳  + 󰜱 󰜴 󰜷 󰜮           Move Focus    
󰌓 ▏󰖳  + 󰰁 󰰍 󰰊 󰰇           Move Focus    
󰌓 ▏󰖳 + 󰘶 + 󰜱 󰜴 󰜷 󰜮        Resize Window    
━━━━━━━━━━━━━━━━━━ Workspaces ━━━━━━━━━━━━━━━━
󰌓 ▏󰖳 + 󰲠-󰲰                Workspace 1-9
󰌓 ▏󰖳 + 󰘶 + 󰲠-󰲰            Move Window To 1-9
󰌓 ▏󰖳 + 󰰊                  This Menu
Tmux Add in keybind_hints.sh"

# 󰌓 ▏󰖳 + CTRL + 󰯲           Center Window
# 󰌓 ▏󰘶 + ALT + 󰲢            Shader (ExtraDark)
# 󰌓 ▏ALT + TAB              Cycle Focus
# 󰌓 ▏󰖳 + ALT + 󰰮            Wallpaper Automation

# ━━━━━━━━━━━━━━━━━━ Tmux ━━━━━━━━━━━━━━━━━━━━━━━
# 󰌓 ▏CTRL + 󰯬               Tmux: Main Prefix
# 󰌓 ▏Prefix + Alt + 󰰨       Tmux: List Keymaps
# 󰌓 ▏Prefix + ?             Tmux: List Keymaps
# 󰌓 ▏Prefix + 󰘶 + 󰰟         Tmux: Reload
# 󰌓 ▏Prefix + [ OR 󰌑        Tmux: Enter Vim-Mode
# 󰌓 ▏Prefix + ]             Tmux: Paste Last Yanked
# 󰌓 ▏Prefix + =             Tmux: Show older yanked text
# 󰌓 ▏Prefix + 󱁐             Tmux: Change Layout
# 󰌓 ▏Prefix + 󰘶 + 󰯲         Tmux: Customize options
# 󰌓 ▏Prefix + 󰘶 + 󰰄         Tmux: Install plugin
# 󰌓 ▏Prefix + 󰯾             Tmux: Open LazyGit
# ━━━━━━━━━━━━━━━━━━ Tmux Sessions ━━━━━━━━━━━━━━━
# 󰌓 ▏Prefix + 󰰢             Tmux: Choose session
# 󰌓 ▏Prefix + Hold 󰰢        Tmux: Save session
# 󰌓 ▏Prefix + 󰰓             Tmux: New Session
# 󰌓 ▏Prefix + 󰯵             Tmux: Detach session
# 󰌓 ▏Prefix + 󰘶 + 󰯵         Tmux: Choose session
# 󰌓 ▏Prefix + $             Tmux: Rename Session
# 󰌓 ▏Prefix + 󰰟             Tmux: Restore session
# 󰌓 ▏Prefix + 󰰍             Tmux: GoTo Last session
# 󰌓 ▏Prefix + )             Tmux: Move to next session
# 󰌓 ▏Prefix + (             Tmux: Move to prev session
# 󰌓 ▏Prefix + 󰰥             Tmux: Show a clock
# 󰌓 ▏Prefix + ~             Tmux: Show messages
# ━━━━━━━━━━━━━━━━━━ Tmux Windows ━━━━━━━━━━━━━━━━━━
# 󰌓 ▏Prefix + 󰰄             Tmux: Window Info
# 󰌓 ▏Prefix + 󰯻             Tmux: Find window/pane
# 󰌓 ▏Prefix + &             Tmux: Kill window
# 󰌓 ▏Prefix + 󰰮             Tmux: List windows
# 󰌓 ▏Prefix + 󰯲             Tmux: Create window
# 󰌓 ▏Prefix + ;             Tmux: Split Window Vertically
# 󰌓 ▏Prefix + ,             Tmux: Split Window Horizontally
# 󰌓 ▏Prefix + !             Tmux: Create new window of pane
# ━━━━━━━━━━━━━━━━━ Tmux Windows Navigating ━━━━━━━━━
# 󰌓 ▏Prefix + 󰘶 + .         Tmux: Navigate to Next Window
# 󰌓 ▏Prefix + 󰘶 + ,         Tmux: Navigate to Prev Window
# ━━━━━━━━━━━━━━━━━ Tmux Panes ━━━━━━━━━━━━━━━━━━━━━━
# 󰌓 ▏Prefix + 󰰜             Tmux: Display pane numbers
# 󰌓 ▏Prefix + 󰘶 + 󰰐         Tmux: Clear Marked pane
# 󰌓 ▏Prefix + 󰰱             Tmux: Kill pane
# ━━━━━━━━━━━━━━━━━ Tmux Panes Resize ━━━━━━━━━━━━━━━
# 󰌓 ▏Prefix + 󰘶 + 󰰇         Tmux: Resize DOWN
# 󰌓 ▏Prefix + 󰘶 + 󰰊         Tmux: Resize UP
# 󰌓 ▏Prefix + 󰘶 + 󰰍         Tmux: Resize RIGHT
# 󰌓 ▏Prefix + 󰘶 + 󰰁         Tmux: Resize LEFT
# 󰌓 ▏Prefix + 󰰐             Tmux: Maximize/Minimize Pane
# ━━━━━━━━━━━━━━━━━ Tmux Panes Navigating ━━━━━━━━━━━
# 󰌓 ▏CTRL + 󰰇               Tmux: Navigate DOWN
# 󰌓 ▏CTRL + 󰰊               Tmux: Navigate UP
# 󰌓 ▏CTRL + 󰰍               Tmux: Navigate RIGHT
# 󰌓 ▏CTRL + 󰰁               Tmux: Navigate LEFT
# 󰌓 ▏Prefix + >             Tmux: Swap pane RIGHT
# 󰌓 ▏Prefix + <             Tmux: Swap pane LEFT

# NOTE: this is with a '|' as a separator
# selected=$(echo -e "$keybinds_hint" | rofi -dmenu -p -i -theme-str "${fnt_override}" -theme-str "${r_override}" -theme-str "${icon_override}" -config "${roconf}" | cut -d '|' -f2 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# This is with an '' as a separator
selected=$(echo -e "$keybinds_hint" | rofi -dmenu -p -i -theme-str "${fnt_override}" -theme-str "${r_override}" -theme-str "${icon_override}" -config "${roconf}" | sed 's/.*\s*//')

case "$selected" in
"This Menu")
  ~/scripts/keybinds_hint.sh
  ;;
"Kill Hyprland Sesssion")
  hyprctl dispatch exit
  ;;
"Kitty")
  kitty
  ;;
"K-Calc")
  kcalc
  ;;  
"Firefox")
  firefox
  ;;
"Nemo")
  nemo
  ;;
"VLC Player")
  vlc
  ;;
"Logout")
  wlogout # ~/.config/hypr/scripts/logoutlaunch.sh 1
  ;;
"Smile Emoji")
  smile
  ;;
"NeoVim")
  kitty --class floating -e zsh -c 'nvim'
  ;;
"Network Manager")
  nm-connection-editor # kitty --class floating -e zsh -c 'nm-connection-editor'
  ;;
"Ranger File Browser")
  if pgrep -x "rofi" >/dev/null; then
    killall rofi
  else
    kitty --class floating -e zsh -c 'ranger' 
  fi
  ;;
"Open Btop")
  kitty --class floating -e zsh -c 'btop'
  ;;
"Open Htop")
  kitty --class floating -e zsh -cx 'htop'
  ;;
"Open Bpytop")
  kitty --class floating -e zsh -cx 'bpytop'
  ;;  
"Rofi App Launcher")
  if pgrep -x "rofi" >/dev/null; then
    killall rofi
  else
    rofi -show # ~/.config/hypr/scripts/rofilaunch.sh d
  fi
  ;;
"List Opened Apps")
  if pgrep -x "rofi" >/dev/null; then
    killall rofi
  else
    ~/scripts/rofilaunch.sh w
  fi
  ;;
"Yazi File Browser")
  if pgrep -x "rofi" >/dev/null; then
    killall rofi
  else
    kitty --class floating -e zsh -c 'yazi' 
  fi
  ;;
"Open Clipboard History")
    ~/scripts/cliphist.sh # Open Clipboard Manager
  ;;
#━━━━━━━━━━━━━━━━━━ Utils ━━━━━━━━━━━━━
"Screenshot")
  ~/.config/hypr/scripts/screenshot.sh m
  ;;
"Toggle Mute (Speaker)")
  ~/.config/hypr/scripts/volumecontrol.sh -o m &
  swayosd-client --output-volume mute-toggle
  ;;
"Toggle Mute (Mic)")
  ~/.config/hypr/scripts/volumecontrol.sh -i m &
  swayosd-client --input-volume mute-toggle
  ;;
"Decrease Volume")
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- &
  swayosd-client --output-volume lower &
  # ~/.config/hypr/scripts/volumecontrol.sh -o d
  ;;
"Increase Volume")
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ &
  swayosd-client --output-volume raise &
  # ~/.config/hypr/scripts/volumecontrol.sh -o i
  ;;
"Play")
  playerctl play-pause
  ;;
"Pause")
  playerctl play-pause
  ;;
"Play-Next")
  playerctl next
  ;;
"Play-Prev")
  playerctl previous
  ;;
"Brightness UP")
  # swayosd-client --brightness raise
  ~/.config/hypr/scripts/brightnesscontrol.sh i
  ;;
"Brightness DOWN")
  # swayosd-client --brightness lower
  ~/.config/hypr/scripts/brightnesscontrol.sh d
  ;;
#━━━━━━━━━━━━━━━ Wallpaper ━━━━━━━━━━━━━━
"Select Wallpaper")
  if pgrep -x "rofi" >/dev/null; then
    killall rofi
  else
    waypaper 
  fi
  ;;
"Random Wallpaper")
  waypaper --random 
  ;;
"HyprShade (BlueFilter)")
  ~/scripts/hyprshade.sh 
  ;;

#━━━━━━━━━━━━━━━ Windows ━━━━━━━━━━━━━━
"Kill Active Window")
  hyprctl dispatch killactive
  ;;
"Fullscreen")
  hyprctl dispatch fullscreen
  ;;






"Toggle Split")
  hyprctl dispatch togglesplit
  ;;
"Toggle Floating")
  hyprctl dispatch togglefloating
  ;;
"Toggle Group")
  hyprctl dispatch togglegroup
  ;;



"Center Window")
  hyprctl dispatch centerwindow
  ;;
"Move Window ")
  hyprctl dispatch movewindow l
  ;;
"Move Window ")
  hyprctl dispatch movewindow r
  ;;
"Move Window ")
  hyprctl dispatch movewindow u
  ;;
"Move Window ")
  hyprctl dispatch movewindow d
  ;;
"Move Focus ")
  hyprctl dispatch movefocus l
  ;;
"Move Focus ")
  hyprctl dispatch movefocus r
  ;;
"Move Focus ")
  hyprctl dispatch movefocus u
  ;;
"Move Focus ")
  hyprctl dispatch movefocus d
  ;;
"Resize Window ")
  hyprctl dispatch resizeactive -30 0
  ;;
"Resize Window ")
  hyprctl dispatch resizeactive 30 0
  ;;
"Resize Window ")
  hyprctl dispatch resizeactive 0 -30
  ;;
"Resize Window ")
  hyprctl dispatch resizeactive 0 30
  ;;
#━━━━━━━━━━━━━ Wrokspaces ━━━━━━━━━━━━━
"1st Workspace")
  hyprctl dispatch workspace 6 &
  hyprctl dispatch workspace 1
  ;;
"2nd Workspace")
  hyprctl dispatch workspace 7 &
  hyprctl dispatch workspace 2
  ;;
"3rd Workspace")
  hyprctl dispatch workspace 8 &
  hyprctl dispatch workspace 3
  ;;
"4th Workspace")
  hyprctl dispatch workspace 9 &
  hyprctl dispatch workspace 4
  ;;
"5th Workspace")
  hyprctl dispatch workspace 10 &
  hyprctl dispatch workspace 5
  ;;
"Window To 1st Workspace")
  hyprctl dispatch movetoworkspace 1
  ;;
"Window To 2nd Workspace")
  hyprctl dispatch movetoworkspace 2
  ;;
"Window To 3rd Workspace")
  hyprctl dispatch movetoworkspace 3
  ;;
"Window To 4th Workspace")
  hyprctl dispatch movetoworkspace 4
  ;;
"Window To 5th Workspace")
  hyprctl dispatch movetoworkspace 5
  ;;
"Window To 6th Workspace")
  hyprctl dispatch movetoworkspace 6
  ;;
"Window To 7th Workspace")
  hyprctl dispatch movetoworkspace 7
  ;;
"Window To 8th Workspace")
  hyprctl dispatch movetoworkspace 8
  ;;
"Window To 9th Workspace")
  hyprctl dispatch movetoworkspace 9
  ;;
*)
  echo "Unknown: $selected"
  exit 1
  ;;
esac

# NOTE: yad's implementation, not completed
# if output=$(
#   yad \
#     --center --width=800 --height=600 \
#     --no-buttons \
#     --list \
#     --separator='\n' \
#     --column="<b>󰌌 Key</b>" \
#     --column="<b>󰋖 Description</b>" \
#     --column="<b> Command</b>" \
#     "󰌌 ALT + Space" "󰋖 App Launcher" "hyprctl dispatch exec ~/.config/hypr/scripts/rofilaunch.sh d" \
#     "󰌌 ALT + Enter" "󰋖 FullScreen" "hyprctl dispatch fullscreen"
# ); then
#   bash -c "$output" >&2
# fi

# yad --width=800 --height=600 \
#   --center \
#   --no-buttons \
#   --list \
#   --column=Key: \
#   --column=Description: \
#   "Alt + Shift + Tab" "" \
#   " + Shift + C" "" \
#   "====================" "====================" \
#   "=" "SUPER KEY" \
#   " + Q / Alt + F4" "Close active window" \
#   " + L" "Lock screen" \
#   "Ctrl + Shift + Escape" "Open system monitor" \
#   " + Backspace / X" "Logout menu" \
#   " + Del" "Quit hyprland session logout w/out confirmation" \
#   " + SPACE" "Toggle window on focus to float" \
#   " + F" "Toggle window on focus to fullscreen keep borders" \
#   " + Shift + F" "Toggle window on focus to fullscreen" \
#   " + J" "Toggle layout" \
#   " + P" "Toggle pseudotile" \
#   " + G" "Toggle window group" \
#   " + Return / T | Numpad Enter" "Launch terminal" \
#   " + E" "Launch file explorer" \
#   " + C" "Launch editor 󰨞" \
#   " + B" "Launch browser" \
#   " + D" "Launch desktop applications (rofi)" \
#   " + Tab" "Switch open applications" \
#   " + R" "Browse system files" \
#   " + period" "Browse emoji" \
#   "Fn + Mute" "Mute audio output toggle" \
#   "Fn + Vol+ (hold)" "Decrease volume" \
#   "Fn + Vol- (hold)" "Increase volume" \
#   " + Ctrl + Alt + S" "Open spotify" \
#   " + Ctrl + ↓ (hold)" "Decrease volume for spotify" \
#   " + Ctrl + ↑ (hold)" "Increase volume for spotify" \
#   " + V" "Clipboard history" \
#   " + Shift + A" "screenshot snip rectangular select" \
#   " + Shift + S / PrintScreen" "screenshot all screen" \
#   " + Shift + W" "screenshot active window" \
#   " + Shift + D" "screenshot focused monitor" \
#   " + Shift + X" "opens screenshot folder" \
#   " + RightClick (drag)" "resize the window" \
#   " + LeftClick (drag)" "change the window position" \
#   " + MouseScroll / PageUp/PageDown" "cycle through workspaces" \
#   " + Shift + [←→↑↓] (hold)" "resizewindows" \
#   " + [0-9]" "switch to workspace [0-9] Workspace 9 (opens Spotify)" \
#   " + backtick" "switch to workspace 10" \
#   " + Ctrl + [←→]" "switch to relative workspaces" \
#   " + Ctrl + ↓" "switch to first empty workspace" \
#   " + Ctrl + Alt + [←→]" "move active window between relative workspaces" \
#   " + Shift + [0-9]" "move active window to workspace [0-9]" \
#   " + Shift + backtick / backquote" "move active window to workspace 0" \
#   " + Shift + Ctrl + ←→↑↓" "move active window around" \
#   " + Alt + [0-9]" "move active window to workspace [0-9] (silently)" \
#   " + Alt + backtick / backquote" "move active window to workspace 10 (silently)" \
#   " + Ctrl + S" "move window to special workspace" \
#   " + S" "toogle to special workspace" \
#   " + Alt + G" "disable hypr effects for gamemode" \
#   " + Alt + [←→]" "change wallpaper" \
#   " + Alt + [↑↓]" "change waybar mode" \
#   " + Alt + D" "toggle theme <//> wall based colors" \
#   " + Alt + T" "theme select menu" \
#   " + Alt + W" "wallpaper select menu" \
#   " + Alt + A" "rofi style select menu" \
#   " + Alt + PageDown/PageUp" "turn on/off blue light filter"
#
#   󰌓 ▏XF86MonBrightnessDown             Brightness DOWN

