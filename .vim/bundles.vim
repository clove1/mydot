set nocompatible
filetype off

set rtp+=~/.vim
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle')
Plugin 'VundleVim/Vundle.vim'

" Code Completions
Plugin 'Shougo/neocomplcache'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'

" Snippets
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'

" Navigation
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/nerdtree'
Plugin 'edsono/vim-matchit'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'haya14busa/vim-easyoperator-line'
Plugin 'haya14busa/vim-easyoperator-phrase'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
" Plugin 'haya14busa/incsearch-fuzzy.vim'
" Plugin 'mileszs/ack.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'rking/ag.vim'

" Editing
Plugin 'tpope/vim-surround'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
if !has('gui_running')
  Plugin 'airblade/vim-gitgutter'
endif
Plugin 'tpope/vim-repeat'
" Plugin 'scrooloose/syntastic'
" Plugin 'godlygeek/tabular'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'sjl/gundo.vim'
" Plugin 'bronson/vim-trailing-whitespace'

" Easy
Plugin 'a.vim'
Plugin 'tpope/vim-dispatch'
"Plugin 'nvie/vim-togglemouse'
if ostype == "Linux"
    Plugin 'junegunn/fzf'
endif
" Plugin 'eiginn/netrw'
Plugin 'netrw.vim'

" Language
"Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'lepture/vim-jinja'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/jquery.vim'
Plugin 'groenewege/vim-less'
Plugin 'wavded/vim-stylus'
Plugin 'nono/vim-handlebars'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'fatih/vim-go'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'elzr/vim-json'

" Color Scheme
Plugin 'torte.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'rickharris/vim-blackboard'
"Plugin 'rickharris/vim-monokai'
"Plugin 'tpope/vim-vividchalk'
"Plugin 'Lokaltog/vim-distinguished'
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'fisadev/fisa-vim-colorscheme'

" Other
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'sunsol/vim_python_fold_compact'
"Plugin 'michalliu/sourcebeautify.vim'
"Plugin 'Xdebug'
"Plugin 'cgraeser/vim-cmdpathup'
"Plugin 'AutoComplPop'
"Plugin 'msanders/snipmate.vim'
"Plugin 'EditPlus'
"Plugin 'grep.vim'
"Plugin 'klen/python-mode'
"Plugin 'davidhalter/jedi-vim'
call vundle#end()


filetype plugin indent on
