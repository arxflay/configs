#!/usr/bin/bash

echo "Installing music tools"
pacman -Sy qpwgraph guitarix pipewire pipewire-jack wireplumber --noconfirm

echo "Installing system tools"
pacman -Sy alacritty wine winetricks --noconfirm

echo "Installing GUI tools"
pacman -Sy gnome-tweaks niri swaybg mako waybar --noconfirm

echo "Installing general tools"
pacman -Sy drawio-desktop discord gimp inkscape krita obsidian --noconfirm

echo "Installing C++ dev tools"
pacman -Sy cmake nvim clang gcc conan mkdocs git ninja --noconfirm
pacman -S --needed base-devel --noconfirm