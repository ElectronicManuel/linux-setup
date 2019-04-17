#!/bin/bash
#
#   Authors:
#   - sebi2306 (Github: https://github.com/sebi2306)
#   - ElectronicManuel (Github: https://github.com/ElectronicManuel)
#
#   'blitz.reg' written by @sebi236
#

LEAGUE_PATH=$(lutris -l -o | grep "League of Legends" | cut -d'|' -f 5 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

echo "Detected LoL path: \"$LEAGUE_PATH\""

if ! [ -d "$LEAGUE_PATH" ];
then
    echo "You need to install League of Legends in Lutris!"
    exit 1
fi

echo "Downloading Blitz installer..."
BLITZ_TMP=$(mktemp -d)
wget -O "$BLITZ_TMP/BlitzInstaller.exe" "https://dl.blitz.gg/download/windows"

echo "Configuring Wine..."

export WINEPREFIX="$LEAGUE_PATH"

LUTRIS_WINE_VERSION="tkg-4.6-x86_64"
LUTRIS_WINETRICKS="~/.local/share/lutris/runtime/winetricks/winetricks"
LUTRIS_WINE="~/.local/share/lutris/runners/wine/$LUTRIS_WINE_VERSION/bin/"

$LUTRIS_WINE/wine uninstaller --remove '{7290EA95-9F17-58E8-8436-4A532DA0F54E}'
$LUTRIS_WINETRICKS -q dotnet452 win7 corefonts
$LUTRIS_WINE/wine "$BLITZ_TMP/BlitzInstaller.exe"

echo "Configuring wine profiles..."
$LUTRIS_WINE/wine regedit `dirname $0`/blitz.reg

echo "Downloading Mono..."
MONO_TMP=$(mktemp -d)
wget -O "$MONO_TMP/mono-installer.msi" "https://dl.winehq.org/wine/wine-mono/4.8.2/wine-mono-4.8.2.msi"
$LUTRIS_WINE/wine msiexec /i "$MONO_TMP/mono-installer.msi"

echo "Blitz has been partially installed!"
echo "All that is left to do is to create a lutris game:"
echo "- Executable:     $LEAGUE_PATH/drive_c/users/$USER/Local\ Settings/Application\ Data/Blitz/Blitz.exe"
echo "- Wine prefix:    $WINEPREFIX"