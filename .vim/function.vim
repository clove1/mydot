
" 파일 실행
function! CustomExecute()
  if &filetype == 'autohotkey'
    exec 'silent !start /c/a/AutoHotkey/AutoHotkey %'
    redraw!
  elseif &filetype == 'python'
    call CmdExecute('python %')
  elseif &filetype == 'java'
    let file_name = expand('%:t:r')
    exec 'silent !/c/a/java/jdk1.7.0_02/bin/javac %'
    call CmdExecute('/c/a/java/jdk1.7.0_02/bin/java '.file_name)
  elseif &filetype == 'markdown'
    exec ':InstantMarkdownPreview'
    exec 'silent !/c/a/s/ahkrun http://localhost:8090'
    redraw!
  else
    call s:MsgE("filetype(".&filetype.") 실행 명령어가 존재하지 않습니다.")
  endif
endfunction

function! CustomCompile()
  if &filetype == 'autohotkey'
    exec 'silent !start /c/a/s/ahkcompiler %' 
    redraw!
  elseif &filetype == 'less'
    let file_name = expand('%:t:r')
    exec 'silent !/z/w/nodejs/node_modules/.bin/lessc -x % > '.file_name.'.css'
    exec 'vsplit '.file_name.'.css'
    redraw!
    call s:MsgV(file_name.".css 파일 생성 완료")
    unlet file_name
  elseif &filetype == 'markdown'
    let file_name = expand('%:t:r')
    exec 'silent !pandoc % -o '.file_name.'.html'
    exec 'vsplit '.file_name.'.html'
    redraw!
    call s:MsgV(file_name.".html 파일 생성 완료")
  else
    call s:MsgE("filetype(".&filetype.") 컴파일러가 존재하지 않습니다.")
  endif
endfunction

function! CustomDebug()
  if &filetype == 'autohotkey'

  elseif &filetype == 'python'

  elseif &filetype == 'less'

  else
    call s:MsgE("filetype(".&filetype.") 디버거가 존재하지 않습니다.")
  endif
endfunction

" 명령행 모드로 결과 보는 함수
function! CmdExecute(cmd)
  let tmpnam=tempname()
  exec "silent !".a:cmd." 2>&1| tee ".tmpnam

  if bufexists("ResultWindow") && bufwinnr("ResultWindow") > 0
    exe bufwinnr("ResultWindow")."wincmd w"
    set ma noro
  else
    bo 5split
    enew
    setlocal bt=nofile
    file ResultWindow
  endif

  exec "0"
  exec "normal dG"
  exec "r ".tmpnam
  exec "silent !rm ".tmpnam
  redraw!
endfunction

" Autohotkey 자동 실행모드
function! AhkExecute()
  let tmpdate = substitute(system('date +%Y%m%d%H%M%S'), "\n", "", "")
  exec "set fileencoding=cp949"
  exec "saveas /c/a/AutoHotkey/ex/" . tmpdate . ".ahk"
  exec "$bd!"
  exec "silent !start /c/a/autohotkey/autohotkey\ %"
  redraw!
endfunction

" bprevious, tabprevious
function! BTprevious()
  if tabpagenr('$') > 1
    exec "tabprevious"
  else
    exec "bprevious!"
  endif
endfunction

" bnext, tabnext
function! BTnext()
  if tabpagenr('$') > 1
    exec "tabnext"
  else
    exec "bnext!"
  endif
endfunction

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("Ag \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Visual 메세지 출력
function! s:MsgV(msg)
  echohl Visual
  echomsg a:msg
  echohl NONE
endfunction

" Error 메세지 출력
function! s:MsgE(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Warning 메세지 출력
function! s:MsgW(msg)
  echohl WarningMsg
  echomsg a:msg
  echohl NONE
endfunction

" 현재 레이아웃 유지하며 버퍼만 삭제
" <SID>로 현재 스크립트에서만 유효하도록 설정
" 외부에서 호출이 필요하면 <SID>를 쓰지 말것
command! Bclose call <SID>BufCloseIt()
function! <SID>BufCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:currentBufName = bufname("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    exec "buffer #"
  else
    exec "bnext"
  endif

  if bufnr("%") == l:currentBufNum
    exec "enew"
  endif

  if buflisted(l:currentBufNum)
    exec "bdelete! ".l:currentBufNum
  endif

  redraw!
  call s:MsgV("버퍼(".l:currentBufName.")를 삭제하였습니다.")
endfunction

" 현재 버퍼만 남기고 모두 삭제
command! Bonly call <SID>BufCloseOnly()
function! <SID>BufCloseOnly()
  for l in range(1, bufnr('$'))
    if buflisted(l)               " 버퍼가 리스트된 상태라면
      if bufnr('%') != l
        exec 'bdelete! ' . l
      endif
    endif
  endfor

  redraw!
  call s:MsgV("현재 버퍼(".bufname('%').")를 남기고 모두 삭제하였습니다.")
endfunction

" 로드된 버퍼만 남기고 모두 삭제
command! Bonlyp call <SID>BufCloseOnlyp()
function! <SID>BufCloseOnlyp()
  for l in range(1, bufnr('$'))
    if buflisted(l)               " 버퍼가 리스트된 상태라면
      if !bufloaded(l)            " 버퍼가 편집중이 아니라면
        exec 'bdelete! ' . l
      endif
    endif
  endfor

  redraw!
  call s:MsgV("편집중인 버퍼를 남기고 모두 삭제하였습니다.")
endfunction

" 현재 열려진 버퍼 갯수 출력
command! Bcount echo len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

" 소스를 html 형식으로 변환 2html.vim
command! Tohtml call <SID>This2html()
function! <SID>This2html()
  exec "so ".$VIMRUNTIME."/syntax/2html.vim"
endfunction

" 현재 세션 자동 저장
" 사용자 명령어(세션) :ASS
command! ASS call AutoSaveSession()
function! AutoSaveSession()
  let l:filepath = $HOME."/.vim/sessions/last.vim"
  exec "mksession! ".l:filepath
endfunction

" 현재 세션 자동 불러오기
" 사용자 명령어(세션) :ARS
command! ARS call AutoRestoreSession()
function! AutoRestoreSession()
  let l:filepath = $HOME."/.vim/sessions/last.vim"

  if filereadable(l:filepath)
    exec "so ".l:filepath

    redraw!
    call s:MsgV("<".l:filepath."> 를 불러왔습니다.")
  endif
endfunction

" 세션 저장
" 사용자 명령어(세션) :SS __저장할파일이름__
command! -nargs=1 SS call SaveSession(<f-args>)
function! SaveSession(sname)
  if a:sname != ""
    let l:filepath = $HOME."/.vim/sessions/".a:sname.".vim"
    exec "mksession! ".l:filepath
    call s:MsgV("<".l:filepath."> 에 저장되었습니다.")
  endif
endfunction

" 세션 불러오기
" 사용자 명령어(세션) :RS __로드할파일이름__
command! -nargs=1 RS call RestoreSession(<f-args>)
function! RestoreSession(sname)
  let l:filepath = $HOME."/.vim/sessions/".a:sname.".vim"

  if filereadable(l:filepath)
    for l in range(1, bufnr('$'))
      if buflisted(l)
        exec 'bdelete! ' . l
      endif
    endfor

    exec "so ".l:filepath

    redraw!
    call s:MsgV("<".l:filepath."> 를 불러왔습니다.")
  else
    call s:MsgE("세션 파일이 존재하지 않습니다.")
  endif
endfunction



function! FTPW()

  "Define Site Information-------------------------------
  let SD_1_ID = 'USER_ID1'
  "let SD_1_PASSWD = 'PASSWORD1'
  let SD_1_HOSTNAME = 'HOSTNAME.COM'
  let SD_1_LOCALPATH = 'D:\wwwroot'
  "let SD_1_PORT = '21'
  "let SD_1_REMOTEPATH = ''

  let SD_2_ID = 'USER_ID2'
  let SD_2_PASSWD = 'PASSWORD2'
  let SD_2_HOSTNAME = 'OTHER.HOSTNAME.COM'
  let SD_2_LOCALPATH = 'D:\otherwwwroot\public_html'
  let SD_2_PORT = '2121'
  let SD_2_REMOTEPATH = 'public_html'

  let COUNT = 2
  "End Of Information------------------------------------

  let current = 1
  let found = 0

  while current <= COUNT
    exe "let localpath = SD_".current."_LOCALPATH"

    let localpath = localpath.'\'
    let lb_len = strlen(localpath)
    let curdir = strpart(expand("%:p"), 0, lb_len)

    if curdir == localpath
      exe "let g:netrw_uid = SD_".current."_ID"
      exe "let hostname = SD_".current."_HOSTNAME"

      if exists("SD_".current."_PASSWD") 
        exe "let g:netrw_passwd = SD_".current."_PASSWD"
      else
        let g:netrw_passwd = inputsecret("Enter Password: ")
      endif

      if exists("SD_".current."_REMOTEPATH")
        exe "let remotepath = SD_".current."_REMOTEPATH"
      endif

      if exists("SD_".current."_PORT")
        exe "let port = SD_".current."_PORT"
      endif

      let found = 1
      break
    endif

    let current = current + 1
  endwhile

  if found
    let filepath = strpart(expand("%:p"), lb_len)
    let filepath = substitute(filepath, '\', '/', 'g')

    if exists("port")
      let execmd = "w ftp://".g:netrw_uid.":".port."@".hostname."/"
    else
      let execmd = "w ftp://".g:netrw_uid."@".hostname."/"
    endif

    if exists("remotepath")
      if remotepath != ''
        let execmd = execmd.remotepath."/"
      endif
    endif

    let execmd = execmd.filepath
    exe execmd
  else
    echo "Base Directory Not Found"
  endif

endfunction
