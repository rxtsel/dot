#!/bin/bash

remove_old_version() {
  sudo rm -rf /opt/discord
  sudo rm -rf /usr/bin/discord
  sudo rm -rf /usr/share/discord
  sudo rm -rf /usr/share/applications/discord.desktop
}

install_new_version() {
  cd ~/Downloads/ &&
    wget -O discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz" &&
    tar -xvzf discord.tar.gz &&
    sudo mv Discord /opt/discord &&
    sudo cp -rp /opt/discord/ /usr/share/ &&
    sudo ln -sf /opt/discord/Discord /usr/bin/discord &&
    sudo cp /opt/discord/discord.desktop /usr/share/applications/discord.desktop
}

echo "Removing old version of Discord..."
remove_old_version
echo "Installing new version of Discord..."
install_new_version
echo "Done! :)"
