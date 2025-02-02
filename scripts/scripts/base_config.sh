#!/bin/bash

mkdir ~/Pictures
cd ~/.dotfiles/assets/set_scrpts
./zsh_fix.sh
nohup waypaper --random &>/dev/null &
clear
