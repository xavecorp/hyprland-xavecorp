#!/bin/bash

# Copy over Xavecorp configs
mkdir -p ~/.config
cp -R ~/.local/share/xavecorp/config/* ~/.config/

# Use default bashrc from Xavecorp
cp ~/.local/share/xavecorp/default/bashrc ~/.bashrc
cp ~/.local/share/xavecorp/default/zshenv ~/.zshenv
