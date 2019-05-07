#!/bin/bash

gnome-shell-extension-tool -e dash-to-panel@jderose9.github.com
gnome-shell-extension-tool -e appindicatorsupport@rgcjonas.gmail.com

# Restart the gnome shell
cat <<EOL
[INFO] To apply the changes press Alt+F2 and type 'r'.
[INFO] If the taskbar still does not change, invoke the linux-setup/activate-gnome-extensions.sh script again.
EOL