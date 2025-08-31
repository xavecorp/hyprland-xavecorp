#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eE

export PATH="$HOME/.local/share/xavecorp/bin:$PATH"
export XAVECORP_PATH=$HOME/.local/share/xavecorp
XAVECORP_INSTALL=~/.local/share/xavecorp/install

# Preparation
source $XAVECORP_INSTALL/preflight/show-env.sh
source $XAVECORP_INSTALL/preflight/guard.sh
source $XAVECORP_INSTALL/preflight/chroot.sh
source $XAVECORP_INSTALL/preflight/repositories.sh
source $XAVECORP_INSTALL/preflight/first-run-mode.sh

# Packaging
echo
echo
echo "  ==> Start packages config"
echo
source $XAVECORP_INSTALL/packages.sh
source $XAVECORP_INSTALL/packaging/fonts.sh
source $XAVECORP_INSTALL/packaging/zsh.sh
source $XAVECORP_INSTALL/packaging/asdcontrol.sh
source $XAVECORP_INSTALL/packaging/applications.sh
source $XAVECORP_INSTALL/packaging/webapps.sh

# Configuration
echo
echo
echo "  ==> Start default config"
echo
source $XAVECORP_INSTALL/config/config.sh
source $XAVECORP_INSTALL/config/theme.sh
source $XAVECORP_INSTALL/config/gpg.sh
source $XAVECORP_INSTALL/config/timezones.sh
source $XAVECORP_INSTALL/config/increase-sudo-tries.sh
source $XAVECORP_INSTALL/config/increase-lockout-limit.sh
source $XAVECORP_INSTALL/config/ssh-flakiness.sh
source $XAVECORP_INSTALL/config/detect-keyboard-layout.sh
source $XAVECORP_INSTALL/config/xcompose.sh
source $XAVECORP_INSTALL/config/mise-ruby.sh
source $XAVECORP_INSTALL/config/docker.sh
source $XAVECORP_INSTALL/config/localdb.sh
source $XAVECORP_INSTALL/config/hardware/network.sh
source $XAVECORP_INSTALL/config/hardware/fix-fkeys.sh
source $XAVECORP_INSTALL/config/hardware/bluetooth.sh
source $XAVECORP_INSTALL/config/hardware/printer.sh
source $XAVECORP_INSTALL/config/hardware/usb-autosuspend.sh
source $XAVECORP_INSTALL/config/hardware/ignore-power-button.sh
source $XAVECORP_INSTALL/config/hardware/sound.sh

#source $XAVECORP_INSTALL/config/branding.sh
#source $XAVECORP_INSTALL/config/git.sh
source $XAVECORP_INSTALL/config/mimetypes.sh
#source $XAVECORP_INSTALL/config/hardware/nvidia.sh

# Login
echo
echo
echo "  ==> Start login config"
echo
source $XAVECORP_INSTALL/login/plymouth.sh
source $XAVECORP_INSTALL/login/limine-snapper.sh
source $XAVECORP_INSTALL/login/alt-bootloaders.sh

# Reboot
clear
echo
echo "You're done! So we're ready to reboot now..." | tte --frame-rate 640 wipe

sleep 5
systemctl reboot
