#!/bin/bash

LEAGUE_PATH="$HOME/Games/league-of-legends"

if ! [ -z "$1" ]; then
    LEAGUE_PATH="$1"
fi

BLITZ_PATH="$LEAGUE_PATH/drive_c/users/$USER/AppData/Blitz"

echo "Configuring Wine..."
export WINEPREFIX="$LEAGUE_PATH"
winetricks -q win10
winetricks -q corefonts

echo "Installing Blitz..."

BLITZ_TMP=$(mktemp -d)
curl -o "$BLITZ_TMP/BlitzAppPortable.zip" "https://dl.dropboxusercontent.com/s/b8wlgsp8xeauovk/BlitzAppFullPortable.zip"
unzip "$BLITZ_TMP/BlitzAppPortable.zip" -d "$BLITZ_PATH"

cat <<EOL
Blitz has been installed!
Add a new Lutris game with the following properties:
- Wine prefix:  "$WINEPREFIX"
- Executable:   "$BLITZ_PATH/Blitz.exe"
EOL