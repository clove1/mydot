#!/bin/sh

list_sessions=`tmux list-sessions 2>/dev/null | awk -F: '{print $1}'`

# $list_sessions 가 NULL 이라면
[[ -z "$list_sessions" ]] && ~/sh/tm-start.sh

# $list_sessions 가 NULL 이 아니라면
[[ -n "$list_sessions" ]] && tmux attach

