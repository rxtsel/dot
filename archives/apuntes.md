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
sudo locale.gen
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
