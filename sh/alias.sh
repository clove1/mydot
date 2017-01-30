

# ls
# export PWDSHOW="echo -en '\033[1;33m' && pwd | sed 's/\/home\/Administrator/~/' && echo -en '\033[0m'"
# alias ls='ls -F --color=auto --show-control-chars'
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -lh'

# text search
alias findtext='find . -name "$2" | xargs grep -Hni "$1"'

# execute files
[[ ! -f "/usr/bin/vi" ]] && alias vi='vim'
[[ -f "$SH/tm.sh" ]] && alias tm='$SH/tm.sh'
[[ -f "/c/a/AutoHotkey/AutoHotkey.exe" ]] && alias autohotkey='/c/a/AutoHotkey/AutoHotkey.exe'
[[ -f "/usr/bin/youtube-dl.exe" ]] && alias ytdl='/usr/bin/youtube-dl.exe -f 22 $1'
[[ -f "/usr/bin/youtube-dl.exe" ]] && alias mp3dl='/usr/bin/youtube-dl.exe --extract-audio --audio-format mp3 --audio-quality 512 $1'
[[ -f "/c/a/mplayer/mplayer.exe" ]] && alias mplayer='/c/a/mplayer/mplayer.exe'
[[ -f "/c/a/s/ahk.exe" ]] && alias ahk='/c/a/s/ahk.exe'
[[ -f "/c/a/locate32/locate.exe" ]] && alias loc='/c/a/locate32/locate.exe'
[[ -f "/c/a/Everything/es.exe" ]] && alias es='/c/a/Everything/es.exe'
[[ -f "/c/a/s/wkill.exe" ]] && alias wkill='/c/a/s/wkill.exe'
[[ -f "/c/a/java/jdk1.7.0_02/bin/java.exe" ]] && alias java='/c/a/java/jdk1.7.0_02/bin/java.exe'
[[ -f "/c/a/java/jdk1.7.0_02/bin/javac.exe" ]] && alias javac='/c/a/java/jdk1.7.0_02/bin/javac.exe'
[[ -f "/usr/bin/whois" ]] && alias whois='whois -h whois.krnic.net %1'
[[ -f "/usr/bin/whereis" ]] && alias where='whereis -b'
# [[ -f "/etc/alternatives/tabbed" ]] && alias vib='tabbed -c vimb -e'

# console
if [[ "$OSTYPE" == "msys" ]]; then
  if [[ -f "/usr/bin/console" ]]; then
    alias node='console node'
    alias python='console python'
    alias serve='console python -mSimpleHTTPServer'
  fi
fi

