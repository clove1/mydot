
export SH=~/sh
[[ -f "$SH/export.sh" ]] && source $SH/export.sh

# fuzzy finder bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Check that we haven't already been sourced.
([[ -z ${CYG_SYS_BASHRC} ]] && CYG_SYS_BASHRC="1") || return

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Set a default prompt of: user@host, MSYSTEM variable, and current_directory
if [ "$OSTYPE" == "msys" ]; then
    TITLEPREFIX=$MSYSTEM

    PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]' # set window title
    # PS1="$PS1"'\n'                 # new line
    # PS1="$PS1"'\[\033[32m\]'       # change to green
    # PS1="$PS1"'\u@\h '             # user@host<space>
    # PS1="$PS1"'\[\033[35m\]'       # change to purple
    # PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
    # PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
    # PS1="$PS1"'\w'                 # current working directory
    if test -z "$WINELOADERNOEXEC"
    then
        GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
        COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
        COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
        COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
        if test -f "$COMPLETION_PATH/git-prompt.sh"
        then
            . "$COMPLETION_PATH/git-completion.bash"
            . "$COMPLETION_PATH/git-prompt.sh"
            PS1="$PS1"'\[\033[36m\]'  # change color to cyan
            PS1="$PS1"'`__git_ps1`'   # bash function
        fi
    fi
    PS1="$PS1"'\[\033[0m\]'        # change color
    #PS1="$PS1"'\n'                 # new line
    PS1="$PS1"' ✗ '                 # prompt: always $
fi

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

# my export
[[ -f "$SH/autostart.sh" ]] && source $SH/autostart.sh
[[ -f "$SH/alias.sh" ]] && source $SH/alias.sh
[[ -f "$SH/encode.sh" ]] && source $SH/encode.sh
[[ -f "$SH/$TERM.ti" ]] && tic $SH/$TERM.ti

# ls color load
# eval `dircolors -b`
eval "$(dircolors ~/.dir_colors)"


