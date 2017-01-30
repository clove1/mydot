
" ostype 별 설정값
let ostype = substitute(system('uname'), "\n", "", "")

source ~/.vim/bundles.vim
source ~/.vim/function.vim
source ~/.vim/plugin.vim
source ~/.vim/register.vim

" enable filetype dectection and ft specific plugin/indent
filetype plugin on
filetype indent on

" 문법 강조가 가능하면 켜기
if has("syntax")
  syntax on
endif

" 컬러 스키마 설정
" color solarized
" set background=dark             " Use colours that work well on a dark background (Console is usually black)
" color torte
color seoul256
" color seoul256-light

" 파일 인코딩
set fileencodings=utf-8,cp949,euc-kr,ucs-bom,ucs-2,ucs-2le,ucs-2be,ucs-4,ucs-4le,ucs-4be
set fileencoding=utf-8
set encoding=utf-8

" 들여쓰기 설정
set autoindent                  " 자동으로 들여쓰기를 한다. set ai
set smartindent                 " 좀더 똑똑한 들여쓰기를 위한 옵션이다.
set tabstop=2                   " Tab을 눌렀을 때 8칸 대신 4칸 이동하도록 한다.
set shiftwidth=2                " 자동 들여쓰기를 할때 4칸 들여쓰도록 한다.
set expandtab                   " 탭문자 공백으로 처리
set smarttab
" set cindent                     " C 프로그래밍을 할때 자동으로 들여쓰기를 한다.
" set textwidth=79                " 만약 79번째 글자를 넘어가면 \

" 검색 설정
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set incsearch
set hlsearch                    " 일반모드에서 / 검색시 하이라이트

" 에디터 설정
set title                       " 윈도우 타이틀바에 열린 파일 이름을 표시합니다.
set history=1000
set wrap                        " 자동으로 <CR>를 삽입하여 다음 줄로 넘어간다.
set nowrapscan                  " 검색할 때 문서의 끝에서 다시 처음으로 돌아가지 않는다.
set visualbell                  " 키를 잘못눌렀을 때 삑 소리를 내는 대신 번쩍이게 한다. set vb
set ruler                       " 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set laststatus=2                " 상태바를 항상 보이게 설정
set backspace=indent,eol,start  " make that backspace key work the way it should
set showmode                    " show the current mode
set showcmd
set number                      " 줄번호를 표시합니다.
set nofoldenable                " disable folding"
set scrolloff=5                 " 5 lines above/below cursor when scrolling
set report=0                    " always report number of lines changed
set matchtime=2                 " show matching bracket for 0.2 seconds
set matchpairs+=<:>             " specially for html
" set ignorecase                  " 대소문자 무시
set wildmenu                    " <TAB> 자동완성

" 명령 라인 완성에서는 확장자 무시
set suffixes=.bak,.o,.h,.info,.swp,.aux,.bbl,.blg,.dvi,.lof,.log,.lot,.ps,.toc

" 백업 파일 설정
"set nobackup                    " 백업 파일을 생성하지 않습니다.
set backup                       " 백업 파일을 생성합니다.
set backupdir=~/.vim/backup      " 백업 디렉터리를 지정합니다.

" 80 column을 넘어서면 배경으로 강조
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
" highlight OverLength ctermbg=red ctermfg=white guibg=#ff0000
" match OverLength /\%81v.\+/

" keyboard mapping
" esc 누를 경우 한영전환(터미널에서는 작동안함)
" inoremap <ESC> <ESC>:set imdisable<CR>
" nnoremap i :set noimd<CR>i
" nnoremap I :set noimd<CR>I
" nnoremap a :set noimd<CR>a
" nnoremap A :set noimd<CR>A
" nnoremap o :set noimd<CR>o
" nnoremap O :set noimd<CR>O
" set noimd
" set imi=1
" set ims=-1

" if has('gui_running')
"   set guioptions=T
" endif

" windows gvim 일 경우 설정값
if has('win32') || has('win64')
  set guifont=Bitstream_Vera_Sans_Mono:h11
  set lines=60
  set columns=180
  set encoding=cp949
  " winpos 720 0
  " au GUIEnter * simalt ~x             " 최대 크기로

  set guioptions-=tT                  " DISABLE> 't': Tearoff menu items
                                      "          'T': Toolbar
  " set guioptions+=gb                  " ENABLE>  'g': Inactive menu items to grey
                                      "          'b': Bottom (horizontal) scrollbar
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ko_kr.utf-8
  source $VIMRUNTIME/menu.vim

  set directory=.,$TEMP
endif

if ostype == "MSYS_NT-6.1"
  " set term=xterm
  set mouse=a
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  "inoremap <Esc>[62~ <C-X><C-E>
  "inoremap <Esc>[63~ <C-X><C-Y>
  "nnoremap <Esc>[62~ <C-E>
  "nnoremap <Esc>[63~ <C-Y>
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"

  let &t_ti.="\e[?7727h"
  let &t_te.="\e[?7727l"
  noremap <Esc>O[ <Esc>
  noremap! <Esc>O[ <Esc>

  " tmux에서 <C-h> 작동하게함
  " https://github.com/neovim/neovim/issues/2048
  nmap <BS> <C-W>h

  " 윈도우 클립보드와 yank를 공유합니다.
  set clipboard=unnamed
endif

if ostype == "Linux"
  " 클립보드와 yank를 공유합니다.
  set clipboard=unnamedplus
endif

" 커서 위치에 파일이 없다면 만들고 연다
nnoremap gF :view <cfile><CR>

" NERDTree 열기/닫기
map <F2> :NERDTreeToggle<CR>
" 이전 버퍼,탭으로 이동
nmap <F3> :call BTprevious()<CR>
" 다음 버퍼,탭으로 이동
nmap <F4> :call BTnext()<CR>
" 커스텀 명령 실행
map <F5> :call CustomExecute()<CR>
" 커스텀 명령 실행(컴파일 모드)
map <F6> :call CustomCompile()<CR>
" 커스텀 명령 실행(디버그 모드)
map <F7> :call CustomDebug()<CR>
" 커서 위치의 단어 Ack 검색
nnoremap <silent> <F8> :Ag<CR>
" Buffergator 열기/닫기
map <F9> :BuffergatorToggle<CR>
" BuffergatorTabs 열기/닫기
map <F10> :BuffergatorTabsToggle<CR>
" Tagbar 열기/닫기
map <F11> :TagbarToggle<CR>
" Autohotkey 자동 실행 모드
map <F12> :call AhkExecute()<CR>

" 버퍼 : 새로 만들기
nmap <leader>e :enew<CR>
" 버퍼 : 버퍼 닫기
" nmap <leader>q :bp <BAR> bd! #<CR>
nmap <leader>q :Bclose<CR>
" 버퍼 : 현재 파일 위치로 작업 디렉터리 변경
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

" 현재 파일 위치에서 NERDTreeCWD 열기
nmap <leader>. :NERDTreeCWD<CR>
nmap <leader>/c :NERDTree /c<CR>
nmap <leader>/x :NERDTree /x<CR>
nmap <leader>/z :NERDTree /z<CR>

" 탭(레이아웃) : 새로 만들기
nmap <leader>tn :tabnew<CR>
" 탭(레이아웃) : 새로 만들기 tabedit
nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" 탭(레이아웃) : 닫기
nmap <leader>tq :tabclose<cr>
" 탭(레이아웃) : 마지막으로 사용했던 탭으로 이동
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" 윈도우 : 새로 만들기
nmap <leader>wn <C-w>n
" 윈도우 : 새로 만들기 가로
nmap <leader>ws :sp<CR>
" 윈도우 : 새로 만들기 세로
nmap <leader>wv :vs<CR>
" 윈도우 : 닫기
nmap <leader>wq <C-w>q

" Buffergator
" nmap <leader>jj :BuffergatorMruCyclePrev<cr>
" nmap <leader>kk :BuffergatorMruCycleNext<cr>

" CtrlP 설정
nmap <leader>r :CtrlPMRU<CR>
nmap <leader>b :CtrlPBuffer<CR>
" nmap <leader>bm :CtrlPMixed<cr>
" nnoremap <silent> <F7> :TlistUpdate<CR>
" nnoremap <silent> <F8> :Tlist<CR>
" nnoremap <silent> <F9> :TlistSync<CR>

" easy motion
" map <Leader>w <Plug>(easymotion-w)
" nmap s <Plug>(easymotion-overwin-f)
" nmap s <Plug>(easymotion-overwin-f2)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" " <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)
" " Move to line
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)
" " Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)
" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
" nmap s <Plug>(easymotion-s)
" " Bidirectional & within line 't' motion
" omap t <Plug>(easymotion-bd-tl)
" " Use uppercase target labels and type as a lower case
" let g:EasyMotion_use_upper = 1
 " " type `l` and match `l`&`L`
" let g:EasyMotion_smartcase = 1
" " Smartsign (type `3` and match `3`&`#`)
" let g:EasyMotion_use_smartsign_us = 1
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
nmap f <Plug>(easymotion-f)
omap f <Plug>(easymotion-f)
vmap f <Plug>(easymotion-f)

" neo compl cache
imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" 윈도우간 이동 : 아래로 이동
nmap <C-j> <C-w>j
" 윈도우간 이동 : 위로 이동
nmap <C-k> <C-w>k
" 윈도우간 이동 : 좌로 이동
nmap <C-h> <C-w>h
" 윈도우간 이동 : 우로 이동
nmap <C-l> <C-w>l

" " 윈도우 크기 : 가로 크게
" nmap <C-Up> <C-w>+
" " 윈도우 크기 : 가로 작게
" nmap <C-Down> <C-w>-
" " 윈도우 크기 : 좌로 확장
" nmap <C-Left> <C-w>>
" " 윈도우 크기 : 우로 확장
" nmap <C-Right> <C-w><

" Alt
" nmap <A-e> :Ex<CR>
" nmap <A-v> :Ve<CR>
" nmap <A-s> :He<CR>
" nmap <A-t> :Te<CR>
"map <Char-27>e :Ex<CR>
"map <Char-27>v :Ve<CR>
"map <Char-27>s :He<CR>
"map <Char-27>t :Te<CR>


" Vim을 닫을 때 세션을 자동 저장
autocmd VimLeave * call AutoSaveSession()
" Vim을 실행할 때 세션을 자동 로드
"autocmd VimEnter * call <SID>AutoRestoreSession()

" 버퍼를 열때 파일의 디렉터리로 경로 설정
autocmd BufEnter * silent! lcd %:p:h

"Set UTF-8 as the default encoding for commit messages
autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

"Remember the positions in files with some git-specific exceptions"
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$")
            \           && expand("%") !~ "COMMIT_EDITMSG"
            \           && expand("%") !~ "ADD_EDIT.patch"
            \           && expand("%") !~ "addp-hunk-edit.diff"
            \           && expand("%") !~ "git-rebase-todo" |
            \   exe "normal g`\"" |
            \ endif

autocmd BufNewFile,BufRead *.patch set filetype=diff
autocmd BufNewFile,BufRead *.diff set filetype=diff

autocmd Syntax diff
            \ highlight WhiteSpaceEOL ctermbg=red |
            \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

autocmd Syntax gitcommit setlocal textwidth=74
