LEAGUE_DIR="/home/$USER/wine-lol-910"
APPIMAGE_NAME="wine-staging_lol-patched.AppImage"

mkdir "$LEAGUE_DIR"
mkdir "$LEAGUE_DIR/wineprefix"

wget -O "$LEAGUE_DIR/$APPIMAGE_NAME" "https://github.com/mmtrt/Wine_Appimage/releases/download/release-lol-patched/wine-staging-i386_lol-patched_x86_64-bionic.AppImage"
wget -O "$LEAGUE_DIR/League_Installer.exe" "https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20EUW.exe"

chmod +x "$LEAGUE_DIR/$APPIMAGE_NAME"

WINEPREF="/home/$USER/.wine-appimage-lol"

"$LEAGUE_DIR/$APPIMAGE_NAME" wine "$LEAGUE_DIR/League_Installer.exe" --mode unattended

"$LEAGUE_DIR/$APPIMAGE_NAME" wine "$WINEPREF/drive_c/Riot\ Games/League\ of\ Legends/LeagueClient.exe"