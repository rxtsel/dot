# After minimal Arch linux setup, then:

### Install dependencies

```bash
sudo pacman -S git neovim kitty neofetch chromium yazi ntfs-3g glib2 gvfs pipewire wireplumber polkit-kde-agent qt5-wayland qt5-wayland grim slurp mpv tofi thunar waybar ark ttf-fira-sans ttf-fira-code ttf-firacode-nerd bluez bluez-utils ripgrep xsel wl-clipboard pavucontrol unzip discord spotify-launcher zsh swaync greetd-tuigreet
# yay packages
yay -S swww ffmpegthumbnailer xdg-desktop-portal-hyprland-git gammastep wlr-randr lightdm-git
```

### yay

Replace `<username>` with your username.

```bash
sudo pacman -S base-devel &&
cd /opt/ &&
sudo git clone https://aur.archlinux.org/yay-git.git &&
sudo chown -R <username>:<username> yay-git/ &&
cd yay-git &&
makepkg -si
```

### Oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
sudo chsh -s $(which zsh) &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# reboot compositor
```

### fonts

For emoji support, install the following fonts:

```bash
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation ttf-font-awesome ttf-bitstream-vera gnu-free-fonts ttf-croscore ttf-droid ttf-ibm-plex ttf-liberation &&
cd && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip &&
sudo unzip CascadiaCode.zip -d /usr/share/fonts/CascadiaCode
```

### Utils for development

```bash
curl -fsSL https://fnm.vercel.app/install | zsh &&
export PATH="/home/rxtsel/.local/share/fnm:$PATH"
  eval "`fnm env`"
```

Install a node version:

```bash
# list node versions remote
fnm list-remote

# install node version
fnm install <your_version>
```

Install package manager:

```bash
npm i -g @antfu/ni
```

Install `cz-cli` globally:

```bash
npm install -g commitizen cz-conventional-changelog && echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
```

### Display manager

Enable greetd service:

```bash
sudo systemctl enable greetd.service
```

Add config:

```bash
sudo rm /etc/greetd/config.toml && sudo ln -s ~/dot/custom/tuigreet/config.toml /etc/greetd/
```

For more customization, read this [doc](https://github.com/apognu/tuigreet?tab=readme-ov-file).

### rEFInd

Copy theme folder to `/boot/EFI/refind/` folder:

```bash
sudo cp ~/dot/custom/refind/themes/ /boot/EFI/refind/
```

Copy `refind.conf` to `/boot/EFI/refind/` folder:

```bash
sudo cp ~/dot/custom/refind/refind.conf /boot/EFI/refind/
```

> [!IMPORTANT]
> Edit `refind.conf` it to your liking. For example: PARTUUID, UUID, etc.

For view partition UUIDs execute this command:

```bash
blkid
```

And edit `refind.conf`:

```bash
resolution 2560 1440

menuentry "Arch Linux" {
    icon     /EFI/refind/themes/minimal/icons/os_arch.png
    volume   "Arch Linux"
    loader   # /vmlinuz-linux or /vmlinuz-linux-lts according to your kernel
    initrd   # /initramfs-linux.img or /initramfs-linux-lts.img according to your kernel
    options  "root=PARTUUID=<YOUR_PARTUUID> rw add_efi_memmap" # Replace <YOUR_PARTUUID> with your partition UUID for / (root)
    graphics  on
}

# For dual booting with Windows
menuentry "Windows 11" {
    icon /EFI/refind/themes/minimal/icons/os_win.png
    volume    "Windows 11"
    loader    /EFI/Microsoft/Boot/bootmgfw.efi
    graphics  on
}
```

For more customization, read this [doc](https://www.rodsbooks.com/refind/).
