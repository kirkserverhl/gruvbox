#!/bin/bash
#     _         _         __        ______  
#    / \  _   _| |_ ___   \ \      / /  _ \ 
#   / _ \| | | | __/ _ \   \ \ /\ / /| |_) |
#  / ___ \ |_| | || (_) |   \ V  V / |  __/ 
# /_/   \_\__,_|\__\___/     \_/\_/  |_|    
#                                          

sec=$(cat ~/scripts/wallpaper-automation.sh)
_setWallpaperRandomly() {
    waypaper --random
    echo ":: Next wallpaper in 60 seconds..."
    sleep $sec
    _setWallpaperRandomly
}

if [ ! -f ~/scripts/wallpaper-automation ] ;then
    touch ~/scripts/wallpaper-automation
    echo ":: Start wallpaper automation script"
    notify-send "Wallpaper automation process started" "Wallpaper will be changed every $sec seconds."
    _setWallpaperRandomly
  else
    rm ~/scripts/wallpaper-automation
    notify-send "Wallpaper automation process stopped."
    echo ":: Wallpaper automation script process $wp stopped"
    wp=$(pgrep -f wallpaper-automation.sh)
    kill -KILL $wp
fi
