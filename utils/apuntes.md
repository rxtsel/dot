### FUENTES NECESARIAS
1. JETBRAINS MONO (NerdFont)
2. MONONOKI NERD FONTS
3. SF PRO DISPLAY
4. SUPPORT EMOJIS:
```shell
pacman -Syu --needed noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation
``` 

### NECESARIO PARA BARRA DE QTILE
1. pip install psutil

### AJUSTAR HORA EN DUALBOOT POR ERRORES
1. timedatectl
2. si RTC IN LOCAL tz = none entonces ejecutar el siguiente comando
3. timedatectl set-local-rtc 1

### EJECUTAR: 
```shell
sudo locale-gen
```

### [ICONOS](https://drive.google.com/file/d/1nkfizcN8WmQPZY4GPwR1JN6K2sjJJKlH/view?usp=sharing)
```shell
sudo cp -r Darksel* /usr/share/icons/
```

### [THEME](https://drive.google.com/file/d/15HrJBuMED0I8PKonkp67i8wQB7wm6Ym-/view?usp=sharing)
```shell
sudo cp -r Darksel /usr/share/themes/
```

### LOCKSCREEN FOR TWM

[betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)

### ACTIVAR TOUCHPAD Y DESPLAZAMIENTO NATURAL
```
sudo pacman -S xf86-input-libinput

cd /etc/X11/xorg.conf.d

sudo nvim 30-touchpad.conf 
```

```shell
Section "Inputclass"
	Identifier "devname"
	Driver "libinput"
	Option "Tapping" "on"
	Option "NaturalScrolling" "true"
EndSection
```

### ENABLE BLUETOOTH
```
sudo pacman -S bluez bluez-utils blueberry

systemctl enable bluetooth.service

reboot
```

### SUPPORT MINIATURE PICTURES
```shell
yay -Sy ffmpegthumbnailer tumbler tumbler-extra-thumbnailers
```

### thunderbird on the system tray icon.
```shell
yay -S birdtray
```
Go to hidden and check this:
- [x] Start thunderbird when birdtray starts.
- [x] Hide/show thunderbird window when click on the system tray icon. 
- [x] Hide thunderbird window when minimized. 

### Hide grub unless the shift key is pressed:

Edit the file /etc/default/grub and put at the end of the lines [this](https://gist.githubusercontent.com/anonymous/8eb2019db2e278ba99be/raw/257f15100fd46aeeb8e33a7629b209d0a14b9975/gistfile1.sh):
```shell
GRUB_FORCE_HIDDEN_MENU="true"
```
Create this file 31_hold_shift and paste into it [this]()
```shell
sudo nvim /etc/grub.d/31_hold_shift
```
Give permissions and update grub:
````shell
sudo chmod a+x /etc/grub.d/31_hold_shift

sudo grub-mkconfig -o /boot/grub/grub.cfg
```


