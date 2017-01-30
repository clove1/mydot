#/usr/bin/bash

[[ ! -f "~/.vim/bundle/Vundle.vim" ]] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
[[ ! -f "~/.oh-my-zsh" ]] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[[ ! -f "~/.tmux/plugins/tpm" ]] && git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

chmod 755 ~/tmux/tm.sh
chmod 755 ~/tmux/tm-start.sh
chmod 755 ~/tmux/tm-newcopysession.sh

