#!/bin/ash

# https://github.com/reymar98/alpine-linux-setup.git
# git clone https://github.com/reymar98/alpine-linux-setup

alpineversion=`cat /etc/alpine-release | cut -d "." -f 1-2 | awk '{print "v"$1}'`
echo $alpineversion

echo "http://dl-cdn.alpinelinux.org/alpine/$alpineversion/community" >> /etc/apk/repositories
apk update
apk upgrade

#------------------------------- 

apk add xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter dbus firefox
apk add font-terminus font-inconsolata font-dejavu font-noto font-noto-cjk font-awesome font-noto-extra font-liberation

apk add chromium
apk add mousepad
apk add rsync
apk add nano

#------------------------------- 

rc-update add dbus
rc-update add lightdm


