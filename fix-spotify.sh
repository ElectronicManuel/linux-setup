#!/bin/bash
SPOTIFY_USERNAME=$1

echo "ui.track_notifications_enabled=false" >> ~/.config/spotify/Users/$SPOTIFY_USERNAME-user/prefs
