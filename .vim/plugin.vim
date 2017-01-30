
" fzf
if ostype == "Linux"
    set rtp+=~/.fzf
endif

""" Ag
let g:ag_prg="ag --silent --nogroup --case-sensitive"
" let g:ag_prg="ag --column --nogroup --noheading"
let g:ag_highlight=1
let g:ag_working_path_mode="r"
let g:ag_format="%f:%l:%m"

""" Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 0
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

""" Goyo
let g:goyo_width=100
let g:goyo_height=90
let g:goyo_linenr=1

""" seoul256
let g:seoul256_background = 233
"let g:seoul256_light_background = 256

""" airline 설정
let g:airline#extensions#tabline#enabled = 1                      " 목록 켜기 
let g:airline#extensions#tabline#left_sep = ''                    " 좌측 라인 활성 문자
let g:airline#extensions#tabline#left_alt_sep = '|'               " 좌측 라인 구분자
let g:airline#extensions#tabline#right_sep = ''                   " 우측 라인 활성 문자
let g:airline#extensions#tabline#right_alt_sep = '|'              " 우측 라인 구분자
let g:airline#extensions#tabline#fnamemod = ':t'                  " 파일명만 출력 
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1      " 분할된 탭의 파일 목록
let g:airline#extensions#tabline#show_tabs = 1                    " 탭 목록 활성화/비활성화
let g:airline#extensions#tabline#show_buffers = 1                 " 버퍼 목록 활성화/비활성화
let g:airline#extensions#tabline#show_tab_nr = 1                  " 탭넘버 보이기/안보이기
let g:airline#extensions#tabline#tab_nr_type = 1                  " 1:탭넘버, 2: 탭넘버.나눔순서
let g:airline#extensions#tabline#buffer_nr_show = 1               " 버퍼넘버 보이기/안보이기
let g:airline#extensions#tabline#buffer_nr_format = '%s:'         " buffer number format

""" BufferGator 설정
let g:buffergator_viewport_split_policy = 'B'             " L:왼쪽 , R: , T: , B:오른쪽
                                                          " 공백이면 기존 윈도우
let g:buffergator_suppress_keymaps = 1                    " 단축키를 직접 지정하겠음
let g:buffergator_mru_cycle_loop = 1                      " 버퍼 돌기 (Looper buffers)
" let g:buffergator_split_size = 40                         " 창 크기
let g:buffergator_vsplit_size = 60                        " 창 가로 사이즈
let g:buffergator_hsplit_size = 20                        " 창 높이 사이즈

""" Commentary
autocmd FileType autohotkey setlocal commentstring=;\ %s
autocmd FileType apache setlocal commentstring=#\ %s

""" CtrlP
let g:loaded_ctrlp = 0                                    " 1이면 disable
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" 가장 가까운 .git 디렉토리를 cwd(현재 작업 디렉토리)로 사용
" 버전 관리를 사용하는 프로젝트를 할 때 꽤 적절하다.
" .svn, .hg, .bzr도 지원한다.
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_show_hidden = 1
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " let g:ctrlp_use_caching = 0
endif
" let g:ctrlp_user_command = 'find %s -type f'       " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
let g:ctrlp_prompt_mappings = {'PrtExit()':['<esc>', '<c-c>', '<c-g>']}

""" Emmet
"let g:user_emmet_expandabbr_key='<C-j>'
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"To remap the default <C-Y> leader:
let g:user_emmet_leader_key='<C-y>'
"Custom snippets
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

""" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "left"

""" Nerd Commenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

""" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'

""" SuperTab
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

""" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

""" vim-markdown
autocmd BufNewFile,BufReadPost *.md,*.markdown,*.html set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

""" vim-instant-markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0

""" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


