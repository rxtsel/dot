#!/bin/bash

# Check if the script is running as root
no_root() {
  if [ "$EUID" -eq 0 ]; then
    echo "Please do not run as root"
    exit
  fi
}

remove_download() {
  [ -d ~/Downloads/discord.tar.gz ] && rm -rf ~/Downloads/discord.tar.gz
  [ -d ~/Downloads/Discord ] && rm -rf ~/Downloads/Discord
}

remove_old_version() {
  [ -d /opt/discord ] && sudo rm -rf /opt/discord
  [ -d /usr/bin/discord ] && sudo rm -rf /usr/bin/discord
  [ -d /usr/share/discord ] && sudo rm -rf /usr/share/discord
  [ -d /usr/share/applications/discord.desktop ] && sudo rm -rf /usr/share/applications/discord.desktop
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

no_root &&
  echo "Removing old version of Discord..."
remove_old_version &&
  echo "Installing new version of Discord..."
install_new_version &&
  echo "Removing downloaded files..."
remove_download &&
  echo "Done! :)"
