#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Useful commands:
# - List Settings
# gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/ list-recursively org.gnome.shell.extensions.dash-to-panel


# Install extensions installer
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/

sudo apt -y install gnome-tweaks

# Extensions to install
# 1160: https://extensions.gnome.org/extension/1160/dash-to-panel/
gnome-shell-extension-installer 1160

# Change Setting
gsettings set org.gnome.desktop.interface gtk-theme Pop-dark
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/ set org.gnome.shell.extensions.dash-to-panel stockgs-panelbtn-click-only true
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

sh "$SCRIPTPATH/activate-gnome-extensions.sh"