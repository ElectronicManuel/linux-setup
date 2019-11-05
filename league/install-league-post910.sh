LEAGUE_DIR="/home/$USER/Games/wine-lol"
WINE_DIR="/opt/wine-lol/bin"

# Configure wine settings
export WINEPREFIX=$LEAGUE_DIR
export WINEARCH=win32

# Init wine prefix
"$WINE_DIR/wine" wineboot

# Download installer
LOL_INSTALLER="/home/$USER/Downloads/League_Installer.exe"
wget -O $LOL_INSTALLER "https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20EUW.exe"

# Install
"$WINE_DIR/wine" $LOL_INSTALLER --mode unattended

# Run the client
"$WINE_DIR/wine" "$WINEPREFIX/drive_c/Riot\ Games/League\ of\ Legends/LeagueClient.exe"
