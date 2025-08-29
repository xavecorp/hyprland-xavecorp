#!/bin/bash

sudo pacman -Syu --noconfirm --needed git

XAVECORP_REPO="${XAVECORP_REPO:-xavecorp/hyprland-xavecorp}"

echo -e "\nCloning Xavecorp Hyprland from: https://github.com/${XAVECORP_REPO}.git"
rm -rf ~/.local/share/xavecorp/
git clone "https://github.com/${XAVECORP_REPO}.git" ~/.local/share/xavecorp >/dev/null

# Use custom branch if instructed, otherwise default to main branch
XAVECORP_REF="${XAVECORP_REF:-main}"
if [[ $XAVECORP_REF != "main" ]]; then
  echo -e "\eUsing branch: $XAVECORP_REF"
  cd ~/.local/share/xavecorp
  git fetch origin "${XAVECORP_REF}" && git checkout "${XAVECORP_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/xavecorp/install.sh
