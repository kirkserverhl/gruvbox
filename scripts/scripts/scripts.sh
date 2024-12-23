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

keybinds_hint="  Cleanup                    cleanup.sh
󰅍  Clipboard History          cliphist.sh
#   CPU Information          byptop & dufs & yazi $ matrix?
󰊪  HyprShade                  hyprshade.sh
Hyprshade +10
Hyprshade -10
  Keybindings                keybind_hints.sh
   Keybindings Config
󰀻  List Opened Apps           rofilaunch.sh
 
󰹑  Screenshot                 screenshot.sh
󰸉  Wallpaper Select           waypaper 
#   Wallpaper Random           waypaper --random
# 󰯃  Wallpaper Script           ~/scripts/random_wallpaper.sh
# 󰙧  Wallpaper Script Stop      pkill -f random_wallpaper.sh
  Waybar Launch      	       ~/scripts/launch.sh
󰁱  Waybar Theme      	       ~/scripts/themeswitcher.sh
󱈶  Waybar Kill		       killall waybar"

# This is with an '' as a separator
selected=$(echo -e "$keybinds_hint" | rofi -dmenu -p -i -theme-str "${fnt_override}" -theme-str "${r_override}" -theme-str "${icon_override}" -config "${roconf}" | sed 's/.*\s*//')

case "$selected" in
"keybinds_hint.sh")
  ~/scripts/keybinds_hint.sh
  ;;
"cpuinfo.sh")
  ~/scripts/cpuinfo.sh
  ;;
"cleanup.sh")
  ~/scripts/cleanup.sh
  ;;  
"rofilaunch.sh")
  if pgrep -x "rofi" >/dev/null; then
    killall rofi
  else
    ~/scripts/rofilaunch.sh w
  fi
  ;;
"wlogout")
  wlogout 
  ;;  
"cliphist.sh")
    ~/scripts/cliphist.sh # Open Clipboard Manager
  ;;
"screenshot.sh")
  ~/scripts/screenshot.sh m
  ;;
"waypaper")
  if pgrep -x "rofi" >/dev/null; then
    killall rofi
  else
    waypaper 
  fi
  ;;
"waypaper --random")
  waypaper --random 
  ;;
"~/scripts/random_wallpaper.sh")
  nohup ~/scripts/random_wallpaper.sh
  ;;
"pkill -f random_wallpaper.sh")
  pkill -f random_wallpaper.sh
  ;;
"hyprshade.sh")
  ~/scripts/hyprshade.sh
  ;;
"~/scripts/launch.sh")
  ~/scripts/launch.sh
  ;;
"~/scripts/themeswitcher.sh")   #.config/waybar/themeswitcher.sh")
  ~/scripts/themeswitcher.sh  #/.config/waybar/themeswitcher.sh
  ;;  
"killall waybar")
  killall waybar
  ;;
*)
  echo "Unknown: $selected"
  exit 1
  ;;
esac


