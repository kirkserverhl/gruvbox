#!/bin/bash

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

sudo nvim pacman.conf
sudo cp ~/.dotfiles/assets/pacman.conf /etc/pacman.conf
sudo cp pacman.conf ~/.dotfiles/assets/pacman.conf

sudo pacman -Syyu lightly-qt
sudo pacman -Syu
sudo pacman -S ungoogled-chromium

sudo pacman -Sy && sudo powerpill -Su && paru -Su

