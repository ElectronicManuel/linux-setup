#!/bin/bash

gnome-shell-extension-tool -e dash-to-panel@jderose9.github.com
# Replaced with TopiconsPlus # gnome-shell-extension-tool -e appindicatorsupport@rgcjonas.gmail.com
gnome-shell-extension-tool -e TopIcons@phocean.net
gnome-shell-extension-tool -e sound-output-device-chooser@kgshank.net
gnome-shell-extension-tool -e tweaks-system-menu@extensions.gnome-shell.fifi.org
gnome-shell-extension-tool -e panel-osd@berend.de.schouwer.gmail.com
gnome-shell-extension-tool -e drop-down-terminal@gs-extensions.zzrough.org

# Restart the gnome shell
cat <<EOL
[INFO] To apply the changes press Alt+F2 and type 'r'.
[INFO] If the taskbar still does not change, invoke the linux-setup/activate-gnome-extensions.sh script again.
EOL
