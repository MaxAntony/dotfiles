# My dotfiles

## Dependencies

- Arch Linux
- AwesomeWM

## AUR documentation

https://wiki.archlinux.org/title/Arch_User_Repository#What_is_the_difference_between_foo_and_foo-git_packages?

### xplr file manager

https://xplr.dev/en/introduction

### zsh plugins

https://github.com/unixorn/awesome-zsh-plugins#plugins

### cambiar DNS

https://askubuntu.com/questions/721080/how-to-change-dns-of-network-from-terminal

### Instalar y configurar OBS

- Instalar obs from repo
- Instalar `sudo pacman -S v4l2loopback-utils v4l2loopback-dkms linux-headers`
- En /etc/modules-load.d/v4l2loopback.conf escribir `v4l2loopback`
- En /etc/modprobe.d/v4l2loopback.conf escribir `options v4l2loopback devices=1 video_nr=10 card_label="OBS Cam" exclusive_caps=1`
- `sudo usermod -aG video max`
- `sudo modprobe v4l2loopback`
- reiniciar

### Nvidia

Si el video nvidia falla y los 3 monitores tienen la misma imagen o Si haces lspci -k y en el controlador nvidia dice que esta usando nouveau hacer lo siguiente

- Agregar a `/etc/default/grub` en la linea que tenga `GRUB_CMDLINE_LINUX_DEFAULT` agregar al final esto `rdblacklist=nouveau`
- ejecutar `grub-mkconfig -o /boot/grub/grub.cfg`
- Ir a `/etc/modprobe.d/` crear un archivo `modprobe.d` y agregar dentro `blacklist nouveau`
- Recompilar con `sudo mkinitcpio -p linux`

### ZSH

Poner zsh como shell por defecto

- `chsh -s $(which zsh)`

### Sonido

Instalar pipewire
https://bbs.archlinux.org/viewtopic.php?id=273969
https://forum.endeavouros.com/t/pipewire-pipewire-media-session-vs-wireplumber/20705

- `sudo pacman -S pipewire pipewire-{jack,alsa,pulse}`

### Thunar

[arch wiki](https://wiki.archlinux.org/title/thunar)

- `sudo pacman -S thunar thunar-volman gvfs tumbler ffmpegthumbnailer`
- para acceso a telefono android `sudo pacman gvfs gvfs-mtp` [link](https://www.reddit.com/r/xfce/comments/kbkag8/thunar_not_recognizing_my_android_device/)
- reiniciar
- Go to edit>preferences>advanced>volume management>configure>activate “mount removable drives…” “mount removable media …”

### Neovim

- `sudo pacman -S fd xclip ripgrep`
- `pip install neovim`
- `npm i -g neovim`

### Utils

- `sudo pacman -S bat btop docker docker-compose zip unzip rsync wget curl rustup`
- `cargo install lfs`

### Polkit

Escalar privilegios a root en apps
(Lxsession o lxpolkit es el agente polkit por default en algunas apps como el widget de awesome pacma, tener cuidado por que vamos a usar otro agente )
Instalar el paquete polkit-gnome (no es muy pesado y no tiene dependencias creo),Al parecer lxsession es el polkit por default por lo que no es nesesario llamarlo sino que automaticamente se va a llamar al inicio
Los demas agentes si debemos llamarlos y deben de ejecutarse en el fondo (para eso la funcion run) para que se puedan usar en el entorno grafico

- instalar `polkit-gnome`
- Editar `~/.config/awesome/autorun.sh` agregar `run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1` para que corra en segundo plano durante toda la sesion

## Errores

### Pantalla negra por error en particiones

Que hacer si sale un error que dice que no encuentra bloques o que los discos no estan del mismo tamano que antes, me ocurrio con el dual boot, estando en windows actualizando volvi a arh y me quedo una pantalla negra con unas letras sobre el disco o las particiones

- lanzar arch desde un usb booteable
- montar las particiones en /mnt (seguir los videos de Linux Made Simple )como estaban originalmente
- generar un nueva configuracion de fstab
- generar una nueva configuracion de grub con grub-mkconfig
  estos pasos los ves en el video de linux made simple, y asi deberia de funcionar

### Hora no Sincronizada en dual boot

- https://wiki.archlinux.org/title/System_time#:~:text=Run%20ntpd%20%2Dqg%20to%20manually,time%20to%20the%20hardware%20clock.
- https://unix.stackexchange.com/questions/60772/i-messed-up-my-system-clock-in-arch-linux

### activar wifi

- seguir el tutorial de linux made simple de arch con uefi, al final agregar el usuario al grupo network y reiniciar

### packages

alacritty 0.12.1-1
awesome 4.3-3
baobab 44.0-1
base 3-1
base-devel 1-1
bat 0.23.0-3
bitwarden 2023.4.0-1
btop 1.2.13-1
calibre 6.17.0-3
chromium 113.0.5672.126-1
code 1.78.2-1
dbeaver 23.0.4-1
dialog 1:1.3_20230209-1
discord 0.0.27-1
docker 1:24.0.0-1
docker-compose 2.18.1-1
fd 8.7.0-1
filelight 23.04.1-1
firefox 113.0.2-1
flameshot 12.1.0-1
flatpak 1:1.15.4-1
glow 1.5.1-1
gnome-disk-utility 44.0-1
gnucash 5.1-1
gparted 1.5.0-1
grub 2:2.06.r499.ge67a551a4-1
htop 3.2.2-1
intel-ucode 20230516.a-1
inxi 3.3.27.1-1
kitty 0.28.1-2
lazygit 0.38.2-1
luarocks 3.9.2-1
lxappearance 0.6.3-4
lxsession 1:0.5.5-1
mupdf 1.22.1-2
nano 7.2-1
neofetch 7.1.0-2
neovim 0.9.0-2
nvidia 530.41.03-13
pacman-contrib 1.9.0-1
pamixer 1.6-2
pavucontrol 1:5.0+r61+gee77d86-2
pqiv 2.12-6
qbittorrent 4.5.2-1
qemu-base 8.0.0-1
reflector 2021.11-7
rofi 1.7.5-1
sl 5.05-4
slock 1.5-1
sxiv 26-1
terminus-font 4.49.1-5
transmission-gtk 4.0.3-1
ttf-joypixels 7.0.0-1
v4l2loopback-utils 0.12.7-2
vi 1:070224-6
virt-manager 4.1.0-2
virtualbox 7.0.8-2
vlc 3.0.18-9
wireless_tools 30.pre9-3
xf86-video-vesa 2.6.0-1
xorg-bdftopcf 1.1.1-1
xorg-docs 1.7.2-2
xorg-font-util 1.4.0-1
xorg-fonts-100dpi 1.0.4-2
xorg-fonts-75dpi 1.0.4-1
xorg-iceauth 1.0.9-1
xorg-mkfontscale 1.2.2-1
xorg-server-xnest 21.1.8-1
xorg-server-xvfb 21.1.8-1
xorg-sessreg 1.1.3-1
xorg-smproxy 1.0.7-1
xorg-x11perf 1.6.2-1
xorg-xbacklight 1.2.3-3
xorg-xcmsdb 1.0.6-1
xorg-xcursorgen 1.0.8-1
xorg-xev 1.2.5-1
xorg-xgamma 1.0.7-1
xorg-xinit 1.4.2-1
xorg-xinput 1.6.4-1
xorg-xkbevd 1.1.5-1
xorg-xkbutils 1.0.5-1
xorg-xkill 1.0.6-1
xorg-xlsatoms 1.1.4-1
xorg-xlsclients 1.1.5-1
xorg-xpr 1.1.0-1
xorg-xrefresh 1.0.7-1
xorg-xsetroot 1.1.3-1
xorg-xvinfo 1.1.5-1
xorg-xwayland 23.1.1-1
xorg-xwd 1.0.8-1
xorg-xwud 1.0.6-1
zathura 0.5.2-2
zsh 5.9-3
anydesk-bin 6.2.1-2
brave-beta-bin 1.53.66-1
brave-bin 1:1.51.118-1
brave-dev-bin 1.52.104-1
brave-nightly-bin 1.54.6-1
cava 0.8.3-1
cheat-bin 4.4.0-2
clifm 1.12-1
etcher-bin 1.18.4-1
ferdium-bin 6.2.7-1
figma-linux-bin 0.10.0-2
firefox-nightly-bin 113.0a1.20230316.125715-1
gitkraken 9.4.0-1
google-chrome 113.0.5672.126-1
google-chrome-beta 114.0.5735.45-1
google-chrome-dev 115.0.5773.4-1
hardcode-fixer-git 2.0-1
hardcode-tray-git 4.3.r246.g1d52b2c-1
mongodb-compass 1.37.0-1
nama 2.0.7.r3.gc67f9c0-1
nama-gui 1.0.5.r3.g6b1911c-1
ngrok 3.3.0-1
nmtool 1.0-1
notion-app 2.0.18-1
obs-backgroundremoval-git v0.5.17.r27.f9a886c-1
ocs-url 3.1.0-7
p7zip-gui 16.02-8
papirus-icon-theme-git 1:20230301.r8.g74ce118afd-1
picom-pijulius-git 1691_Next.129.g982bb43_2021.10.23-1
postman-bin 10.14.2-1
shortwave 1:3.2.0-1
tumbler-folder-thumbnailer 1-2
yay 12.0.5-1
zoom 5.14.7-1
