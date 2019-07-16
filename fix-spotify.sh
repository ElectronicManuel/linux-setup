#!/bin/bash

echo "This script is no longer needed on newer versions of Spotify!"

SPOTIFY_USERNAME=$1

if [ -z "$SPOTIFY_USERNAME" ];
then
     printf "Please enter your spotify username: "
     read SPOTIFY_USERNAME
fi

if [ ! -f "~/.config/spotify/Users/$SPOTIFY_USERNAME-user/prefs" ];
then
    echo "Could not find a spotify config for your account!"
    exit 1
fi

echo "ui.track_notifications_enabled=false" >> ~/.config/spotify/Users/$SPOTIFY_USERNAME-user/prefs
echo "If the fix did not work, close Spotify and run the script again"
