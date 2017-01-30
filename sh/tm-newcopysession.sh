#!/bin/sh
# inspired from: https://mutelight.org/practical-tmux
if [[ -n "$TMUX" ]]; then
    echo "where am i"
    exit
fi

base_session=$(hostname | sed 's/\./_/g')
list_sessions=`tmux list-sessions 2>/dev/null | awk -F: '{print $1}'`

if [[ -z "$list_sessions" ]]; then
    tmux new-session -d -s $base_session -n "$"
fi

new_session=${base_session}_`date +%m%d_%H%M`
tmux new-session -d -t $base_session -s $new_session
tmux attach-session -t $new_session \; set-option destroy-unattached
