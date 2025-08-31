#!/bin/bash

# Install Pipewire
sudo pacman -S --noconfirm --needed \
    pipewire-alsa \
    pipewire-pulse \
    alsa-card-profiles \
    alsa-ucm-conf

# Unable Pipewire for user
systemctl --user enable --now pipewire.service wireplumber.service pipewire-pulse.socket
systemctl --user restart pipewire wireplumber