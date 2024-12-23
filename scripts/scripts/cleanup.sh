#!/bin/bash
clear
aur_helper="$(cat ~/scripts/aur.sh)"
figlet -f smslant "Cleanup"
echo
$aur_helper -Scc
yay -Rsn $(pacman -Qdtq)
