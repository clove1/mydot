
" 자주 사용하는 레지스터, 매크로 정의
let @l='^v$h'                                         " 라인 선택
let @h=':so $VIMRUNTIME/syntax/2html.vim'             " 소스 html로 변환

let @a=''                                             " 임시 클립보드
let @y='"ay'                                          " a에 복사
let @p='"aP'                                          " a내용 붙여넣기
let @q='^\(\s*\)\(\w*\)\>\(.*\)'                      " 쿼리만 선택
