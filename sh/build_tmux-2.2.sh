#!/bin/bash

sudo apt-get install libevent-dev

# https://github.com/tmux/tmux
# https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz

[[ ! -f "./tmux-2.2" ]] && wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz
tar xvzfp tmux-2.2.tar.gz
cd tmux-2.2
./configure
make
sudo make install

