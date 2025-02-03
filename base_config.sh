#!/bin/bash

mkdir ~/Pictures
cd ~/.dotfiles
./zsh_fix.sh
nohup waypaper --random &>/dev/null &

clear
