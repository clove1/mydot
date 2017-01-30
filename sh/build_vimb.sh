#!/bin/bash

sudo apt-get install libsoup2.4-dev libwebkit-dev libgtk-3-dev libwebkitgtk-3.0-dev

[[ ! -f "./vimb" ]] && git clone https://github.com/fanglingsu/vimb.git

cd vimb
#make clean
# make // or make GTK=3 to compile against gtk3
make
sudo make install
