#!/bin/sh

sudo rm -rf /etc/modprobe.d/*
sudo echo "deb http://www.deb-multimedia.org/ jessie main non-free" >> /etc/apt/sources.list
sudo echo "deb http://ftp.kr.debian.org/debian/ jessie-backports main" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install deb-multimedia-keyring
sudo apt-get install zsh
sudo apt-get install gnome-terminal
sudo apt-get install thunar
sudo apt-get install vlc
sudo apt-get install iceweasel
sudo apt-get install samba samba-client
sudo apt-get install xcompmgr
sudo apt-get install nabi
sudo apt-get install fonts-nanum
sudo apt-get install im-config

