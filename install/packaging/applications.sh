#!/bin/bash

# Install default
yay -S --noconfirm \
    1password \
    1password-cli \
    brave-bin \
    visual-studio-code-bin \
    slack-desktop \
    yubico-authenticator-bin

# Activate Yubico Authenticator
sudo systemctl start pcscd.service