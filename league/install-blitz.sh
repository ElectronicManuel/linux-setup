#!/bin/bash

if ! [ -z "$1" ]; then
    LEAGUE_PATH="$1"
else
    echo "Enter the path of your LoL Wine prefix. Leave empty to use the default path [$HOME/Games/league-of-legends]"
    read LEAGUE_PATH
    if [ -z "$LEAGUE_PATH" ];
    then
        LEAGUE_PATH="$HOME/Games/league-of-legends"
    fi
fi

BLITZ_PATH="$LEAGUE_PATH/drive_c/users/$USER/AppData/Blitz"

echo "Configuring Wine..."
export WINEPREFIX="$LEAGUE_PATH"
winetricks -q win10
winetricks -q corefonts

echo "Installing Blitz..."

BLITZ_TMP=$(mktemp -d)
wget -O "$BLITZ_TMP/BlitzAppPortable.zip" "https://dl.dropboxusercontent.com/s/b8wlgsp8xeauovk/BlitzAppFullPortable.zip"
unzip "$BLITZ_TMP/BlitzAppPortable.zip" -d "$BLITZ_PATH"

cat <<EOL
Blitz has been installed!
Add a new Lutris game with the following properties:
- Executable:   "$BLITZ_PATH/Blitz.exe"
- Wine prefix:  "$WINEPREFIX"
EOL