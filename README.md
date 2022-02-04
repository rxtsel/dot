# CONFIGURACIÓN ARCH LINUX
### Instalando arch...
-  Descargar [Arch](http://https://archlinux.org/download/ "Arch") iso.

- Bootear arch iso en una usb.

####  Una vez booteado arch, ejecutar los siguientes comandos:

- Cambiar distribución de teclado a español latino:
`loadkeys la-latin1`

- Conectarse a red wifi:
`Iwctl --passphrase "contraseñawifi” station wlan0 connect “nombrewifi”`

-  Verificar conexión:
`ping 8.8.8.8`
Si la conexión es correcta, deberían ir cargando lineas en la consola.

-  Actualizar reloj:
`timedatectl set-ntp true`

#### En este punto, vamos a ver los discos que tenemos y en el que vamos a instalar arch.
-  ver  los discos:
`lsblk`

- Particionar los discos:
`cfdisk`

#### Crear 3 particiones :
1. 512M <- PARA UEFI
2.  las mismas gb de tu RAM     <- Para LINUX SWAP
3.  El resto de gb PARA ROOT (linux filesystem)

Darle a write, escribir "yes" y enter para guardar.

- Formatear los discos:
1.  `mkfs.fat -F32 /dev/efi_partición` <-Para UEFI
2.  `mkswap /dev/swap_partition` <-Para Swap
3.  `mkfs.ext4 /dev/root_partition` <-Para Root

#### Montar los discos:
1. Crear una montura para UEFI:
`mkdir /mnt/efi`

- `mount /dev/efi_partition /mnt/efi`<-Para UEFI
- `mount /dev/root_partition /mnt` <-Para root
- `swapon /dev/swap_partition` <-Para Swap

#### instalar paquetes esenciales:
`pacstrap /mnt base linux linux-firmware neovim iwd`

- Ejecutar fstab:
`genfstab -U /mnt >> /mnt/etc/fstab`

- Ejecutar chroot:
`arch-chroot /mnt`

- Configurar zona horaria:
 `ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime`
 
- Ejecutar:
`hwclock –-systohc`

- Editar localización:
 `nvim /etc/locale.gen` Y descomentar: es_CO.UTF-8 ITF-8
 Guardar y salir.
 
- Crear locale.conf:
 `nvim /etc/locale.conf`Y escribir: LANG=es_CO.UTF-8
 
- Configurar teclado:
`nvim /etc/vconsole.conf` Y escribir: KEYMAP=la-latin1 

- Configurar hostname:
 `nvim /etc/hostname` Y escribir un nombre para la pc (en mi caso "rxtsel")
 
- Configurar host:
`nvim /etc/hosts` Y escribir:
