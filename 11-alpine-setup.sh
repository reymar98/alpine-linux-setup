#!/bin/ash

# https://github.com/reymar98/alpine-linux-setup.git
# git clone https://github.com/reymar98/alpine-linux-setup

alpineversion=`cat /etc/alpine-release | cut -d "." -f 1-2 | awk '{print "v"$1}'`
echo $alpineversion

echo "http://dl-cdn.alpinelinux.org/alpine/$alpineversion/community" >> /etc/apk/repositories
apk update
apk upgrade

#------------------------------- 

sudo apk add xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter dbus firefox
sudo apk add font-terminus font-inconsolata font-dejavu font-noto font-noto-cjk font-awesome font-noto-extra font-liberation

sudo apk add chromium
sudo apk add mousepad
sudo apk add rsync
sudo apk add nano

#------------------------------- 

rc-update add dbus
rc-update add lightdm


