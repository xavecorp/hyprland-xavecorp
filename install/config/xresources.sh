#!/bin/bash

# Set default Xresources
tee ~/.Xresources >/dev/null <<EOF
Xft.dpi: 150

EOF

tee ~/.xinitrc >/dev/null <<EOF
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

EOF