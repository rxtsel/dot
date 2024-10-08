#!/bin/bash
#Source the file with optional packages functions
chmod +x ~/dot/.config/scripts/core/optional_packages.sh
source ~/dot/.config/scripts/core/optional_packages.sh

install_yay() {
  sudo pacman -S --noconfirm base-devel git &&
    cd /opt/ &&
    sudo git clone https://aur.archlinux.org/yay-git.git &&
    sudo chown -R $(whoami):$(whoami) yay-git/ &&
    cd yay-git &&
    makepkg -si --noconfirm
}

install_pacman_packages() {
  sudo pacman -S --noconfirm neovim kitty neofetch chromium yazi ntfs-3g glib2 gvfs pipewire wireplumber polkit-kde-agent mpv thunar ark bluez bluez-utils ripgrep xsel wl-clipboard pavucontrol unzip zsh swaync imagemagick mpv feh vulkan-tools vulkan-radeon

}

install_aur_packages() {
  yay -S --noconfirm swww ffmpegthumbnailer xdg-desktop-portal-hyprland-git gammastep wlr-randr lightdm-git mkinitcpio-firmware
}

install_oh_my_zsh() {
  sudo chsh -s $(which zsh) &&
    source ~/.zshrc &&
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

install_fonts() {
  sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation ttf-font-awesome ttf-bitstream-vera gnu-free-fonts ttf-croscore ttf-droid ttf-ibm-plex ttf-liberation ttf-fira-sans ttf-fira-code ttf-firacode-nerd
  cd /usr/share/fonts/ &&
    sudo wget -q --show-progress -O CascadiaCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip
  sudo wget -q --show-progress -O SanFranciscoPro.zip https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/archive/refs/heads/master.zip
  sudo unzip -oq CascadiaCode.zip -d /usr/share/fonts/cascadia &&
    sudo rm -f CascadiaCode.zip
  sudo unzip -oq SanFranciscoPro.zip &&
    sudo rm -f SanFranciscoPro.zip
  fc-cache -f -v
}

create_symlinks() {
  [ -d ~/.config/kitty ] && rm -rf ~/.config/kitty
  [ -d ~/.config/gammastep ] && rm -rf ~/.config/gammastep
  [ -d ~/.config/yazi ] && rm -rf ~/.config/yazi
  [ -d ~/.config/zellij ] && rm -rf ~/.config/zellij
  [ -d ~/.config/neofetch ] && rm -rf ~/.config/neofetch
  [ -f ~/.zshrc ] && rm -r ~/.zshrc

  ln -s ~/dot/.config/kitty ~/.config/
  ln -s ~/dot/.config/gammastep ~/.config/
  ln -s ~/dot/.config/yazi ~/.config/
  ln -s ~/dot/.config/zellij ~/.config/
  ln -s ~/dot/.config/neofetch ~/.config/
  ln -s ~/dot/.zshrc ~/
}

# Main script
echo "Welcome to the Arch Linux with Hyprland configuration script!"

# Base configuration
install_yay
install_pacman_packages
install_aur_packages
install_oh_my_zsh
install_fonts
create_symlinks

echo "Base packages completed successfully!"

# Install optional packages
install_dev_utils
install_display_manager
install_refind

echo "Optional packages completed successfully!"
