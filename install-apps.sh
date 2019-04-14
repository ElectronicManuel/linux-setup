#!/bin/bash

# Update repos
sudo apt -y update

# VSCode
VSCODE_DIR=$(mktemp -d)
curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > $VSCODE_DIR/vscode.deb
sudo apt -y install $VSCODE_DIR/vscode.deb

# Spotify
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt -y update
# 4. Install Spotify
sudo apt -y install spotify-client

# Brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ `lsb_release -sc` main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-`lsb_release -sc`.list
sudo apt -y update
sudo apt -y install brave-keyring brave-browser

# Discord
DISCORD_TEMP="$(mktemp -d)"
wget -O $DISCORD_TEMP/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt -y install $DISCORD_TEMP/discord.deb

# Lutris incl. Wine
# Drivers
sudo dpkg --add-architecture i386
sudo apt -y install libvulkan1 libvulkan1:i386
sudo apt -y install wine
sudo apt -y install winetricks

# https://dl.blitz.gg/download/windows
# Lutris itself
sudo add-apt-repository -y ppa:lutris-team/lutris
sudo apt -y update
sudo apt -y install lutris

# Steam
sudo apt -y install steam

# OBS Studio
sudo apt -y install ffmpeg
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt -y update
sudo apt -y install obs-studio

# Java
sudo apt -y install openjdk-8-jdk

# Flameshot
sudo apt -y install flameshot


# Manual actions to be taken
echo "You need to configure the keyboard shortcuts for taking screenshots"
echo "You need to configure the new default browser"
echo "You need to configure Spotify so that it doesn't show notifications on every new song"
