#!/bin/bash

# Ensure timezone can be updated without needing to sudo
sudo tee /etc/sudoers.d/xavecorp-tzupdate >/dev/null <<EOF
%wheel ALL=(root) NOPASSWD: /usr/bin/tzupdate, /usr/bin/timedatectl
EOF
sudo chmod 0440 /etc/sudoers.d/xavecorp-tzupdate
