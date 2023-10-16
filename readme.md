After minimal Arch linux setup, then:

### Install dependencies

```bash
sudo pacman -S git neovim alacritty neofetch chromium ranger feh brightnessctl udiskie ntfs-3g glib2 gvfs pipewire wireplumber polkit-kde-agent qt5-wayland qt5-wayland grim slurp brightnessctl pamixer cliphist swappy swayidle xautolock lxappearance mpv rofi thunar waybar ark ttf-fira-sans ttf-fira-code ttf-firacode-nerd blueman  bluez bluez-utils ripgrep xsel tmux libsodium

# yay packages
yay -S swaylock-effects swww wlogout pywal ffmpegthumbnailer tumbler tumbler-extra-thumbnailers xdg-desktop-portal-hyprland-git gammastep
```

### zsh

```bash
sudo pacman -S zsh &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
sudo chsh -s $(which zsh) &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# reboot compositor
```

### dev

```bash
curl -fsSL https://fnm.vercel.app/install | zsh &&
export PATH="/home/rxtsel/.local/share/fnm:$PATH"
  eval "`fnm env`"

# install a node version, list with fnm list-remote
# install ni
npm i -g @antfu/ni

# install cz-cli
npm install -g commitizen cz-conventional-changelog && echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
```

### fonts

```bash
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation ttf-font-awesome ttf-bitstream-vera gnu-free-fonts ttf-croscore ttf-droid ttf-ibm-plex ttf-liberation &&
cd && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip &&
sudo unzip CascadiaCode.zip -d /usr/share/fonts/CascadiaCode
```

### yay

```bash
sudo pacman -S base-devel &&
cd /opt/ &&
sudo git clone https://aur.archlinux.org/yay-git.git &&
sudo chown -R rxtsel:rxtsel yay-git/ &&
cd yay-git &&
makepkg -si
```

### GTK Theme, Icons, Cursor

Download [GTk THEME](https://github.com/vinceliuice/Orchis-theme), [Icons](https://github.com/bikass/kora), [Cursor](https://www.gnome-look.org/p/1914825/)

| <!-- -->  |       <!-- -->        |
| :-------: | :-------------------: |
| GTK Theme |        Orchis         |
|   Icons   |         kora          |
|  Cursor   | Bibata-Modern-Classic |
