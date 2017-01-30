#!/bin/bash

if [ -f "/usr/bin/awesome" ]; then
    sudo apt-get remove -y awesome
fi

sudo apt-get install -y \
    lua5.1 liblua5.1-0-dev luadoc lua-ldoc \
    lua-lgi-dev xmlto cmake imagemagick \
    libxcb-randr0-dev libxcb-cursor-dev \
    libxcb-xtest0-dev libxcb-xinerama0-dev \
    libxcb-shape0-dev libxcb-keysyms1-dev \
    libxcb-icccm4-dev libx11-xcb-dev \
    libxcb-image0-dev libxcb-util0-dev \
    libstartup-notification0-dev \
    libxdg-basedir-dev \
    libgdk-pixbuf2.0-dev

wget https://awesome.naquadah.org/download/awesome-3.5.9.tar.xz
tar xvf awesome-3.5.9.tar.xz
cd awesome-3.5.9
cmake -DCMAKE_PREFIX_PATH=/usr -DSYSCONFDIR=/etc
make
sudo make install
