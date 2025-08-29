#!/bin/bash

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Setup theme links
mkdir -p ~/.config/xavecorp/themes
for f in ~/.local/share/xavecorp/themes/*; do ln -nfs "$f" ~/.config/xavecorp/themes/; done

# Set initial theme
mkdir -p ~/.config/xavecorp/current
ln -snf ~/.config/xavecorp/themes/xavecorp ~/.config/xavecorp/current/theme
ln -snf ~/.config/xavecorp/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/xavecorp/current/background

# Set specific app links for current theme
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/xavecorp/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/xavecorp/current/theme/mako.ini ~/.config/mako/config
