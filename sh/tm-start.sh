#!/bin/sh

SNAME="기본"
WNAME1="HOME"
WNAME2="vim"
WNAME3="기타"
WNAME4="기타"
WNAME5="HOME"
WNAME6="HOME"

tmux new-session       -s $SNAME   -n $WNAME1 -d
tmux new-window        -t $SNAME:2 -n $WNAME2
# tmux new-window        -t $SNAME:3 -n $WNAME3
# tmux new-window        -t $SNAME:4 -n $WNAME3

tmux select-window     -t $SNAME:2
tmux send-keys         "vim" Enter

# tmux select-window     -t $SNAME:3
# tmux send-keys         "cd /" Enter

tmux select-window     -t $SNAME:2
tmux attach-session    -t $SNAME
# PROJECT_YOUR_PATH="~/Projects"
# PROJECT_NAME=${1:-node-project}
# EXPRESS="express"
# EDITOR="vim"
# TMUX="tmux"

# $TMUX new \\; \\
#   split-window -h \\; \\
#   split-window -v \\; \\
#   split-window -v \\; \\
#   split-window -v \\; \\
#   select-pane -t 1 \\; \\
#     send-keys "cd $PROJECT_YOUR_PATH && $EXPRESS -f $PROJECT_NAME" Enter \\; \\
#     send-keys "cd $PROJECT_NAME && npm install" Enter \\; \\
#   select-pane -t 2 \\; \\
#     send-keys "sudo npm install nodemon -g" Enter \\; \\
#   select-pane -t 3 \\; \\
#     send-keys "sudo npm install nodeman -g" Enter \\; \\
#   select-pane -t 4 \\; \\
#     send-keys "sudo npm install forever -g" Enter \\; \\
#   select-pane -t 0 \\; \\
#     send-keys "cd $PROJECT_NAME && sleep 5 && vi app.js" Enter \; \
