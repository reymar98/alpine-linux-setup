#!/bin/ash

# https://github.com/reymar98/alpine-linux-setup.git

alpineversion=`cat /etc/alpine-release | cut -d "." -f 1-2 | awk '{print "v"$1}'`
echo $alpineversion

echo "http://dl-cdn.alpinelinux.org/alpine/$alpineversion/community" >> /etc/apk/repositories
apk update
apk upgrade

#------------------------------- 

apk add curl socat nmap net-tools build-base setxkbmap sudo xrandr bash zsh dbus dbus-x11 sudo setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
apk add open-vm-tools open-vm-tools-guestinfo open-vm-tools-deploypkg open-vm-tools-gtk
apk add lightdm-gtk-greeter i3wm i3status libxcb-dev i3lock xf86-video-vmware dmenu
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add docker docker-compose

# add user
adduser uuu
mkdir -p /home/uuu/wallpaper
mkdir -p /home/uuu/.config/i3

# user setup uuu
cp ./uuu/wallpaper/compass.jpg /home/uuu/wallpaper/compass.jpg
cp ./uuu/.config/i3/config /home/uuu/.config/i3/config
cp ./uuu/.profile /home/uuu/.profile
mkdir -p /home/uuu/.scripts
cp ./uuu/login-script.sh /home/uuu/.scripts/login-script.sh
chown -R uuu:uuu /home/uuu

# add uuu to sudoers
cat ./uuu/sudoers >> /etc/sudoers

# greeter background
echo "background=/home/uuu/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
cp ./uuu/uuu /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/uuu

# add user to docker
addgroup uuu docker

# enable copy paste in vmware
chmod g+s /usr/bin/vmware-user-suid-wrapper

# give uuu write access to /opt dir
chown uuu:uuu /opt

# mkdir /opt/docker
mkdir -p /opt/docker
cp ./docker/* /opt/docker/
chown uuu:uuu /opt/docker

#------------------------------- 

#!/bin/ash

rc-service dbus start
rc-update add dbus

rc-service lightdm start
rc-update add lightdm

rc-service open-vm-tools start
rc-update add open-vm-tools boot

rc-service docker start
rc-update add docker boot

