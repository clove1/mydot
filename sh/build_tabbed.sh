#!/bin/bash

# http://git.suckless.org/tabbed
# http://dl.suckless.org/tools/tabbed-0.6.tar.gz

[[ ! -f "./tabbed-0.6" ]] && wget http://dl.suckless.org/tools/tabbed-0.6.tar.gz

tar xvzfp tabbed-0.6.tar.gz
cd tabbed-0.6
make
sudo make install
