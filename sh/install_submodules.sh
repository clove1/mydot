#/bin/sh

[[ ! -f "~/.oh-my-zsh" ]] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[[ ! -f "~/.oh-my-zsh/plugins/alias-tips" ]] && git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/plugins/alias-tips

[[ ! -f "~/.vim/bundle/Vundle.vim" ]] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
[[ ! -f "~/.tmux/plugins/tpm" ]] && git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
[[ ! -f "~/.tmux/plugins/tmux-resurrect" ]] && git clone https://github.com/tmux-plugins/tmux-resurrect.git ~/.tmux/plugins/tmux-resurrect
[[ ! -f "~/.config/awesome" ]] && git clone https://github.com/tony/awesome-config.git ~/.config/awesome

chmod 755 ~/sh/tm.sh
chmod 755 ~/sh/tm-start.sh
chmod 755 ~/sh/tm-newcopysession.sh

