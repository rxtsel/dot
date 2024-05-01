#/bin/sh
if [ -f "/usr/bin/nautilus" ]; then
    echo "nautilus is installed."
    nautilus --new-window
else
    echo "nautilus not installed. Launching thunar instead."
    thunar
fi;

