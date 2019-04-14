#!/bin/bash

LEAGUE_PATH=$(lutris -l -o | grep "League of Legends" | cut -d'|' -f 5 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

echo "Detected LoL path: \"$LEAGUE_PATH\""

if ! [ -d "$LEAGUE_PATH" ];
then
    echo "You need to install League of Legends in Lutris!"
    exit 1
fi

BLITZ_PATH="$LEAGUE_PATH/drive_c/users/$USER/AppData/Blitz"

echo "Configuring Wine..."
export WINEPREFIX="$LEAGUE_PATH"
winetricks -q win10
winetricks -q corefonts

echo "Installing Blitz..."

BLITZ_TMP=$(mktemp -d)
wget -O "$BLITZ_TMP/BlitzAppPortable.zip" "https://dl.dropboxusercontent.com/s/b8wlgsp8xeauovk/BlitzAppFullPortable.zip"
unzip "$BLITZ_TMP/BlitzAppPortable.zip" -d -f "$BLITZ_PATH"

BLITZ_YML="$(mktemp)"
cat >$BLITZ_YML <<EOF
name: Blitz App
game_slug: blitz-app
version: Installer
slug: blitz-app-installer

script:
  game:
    exe: $BLITZ_PATH/Blitz.exe
    prefix: $WINEPREFIX
EOF

lutris -i $BLITZ_YML

if [ "$?" -eq "0" ];
then
    echo "Blitz has been installed!"
else
    echo "Blitz has been partially installed!"
    echo "All that is left to do is to create a lutris game:"
    echo "- Executable:     $BLITZ_PATH/Blitz.exe"
    echo "- Wine prefix:    $WINEPREFIX"
fi