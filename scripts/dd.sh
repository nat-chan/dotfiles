#!/bin/bash
clear
tmux split-window -v -p 80 -b -d 'perl -MPOSIX -e pause'
export PUDB_TTY=`tmux display-message -t "{up-of}" -p "#{pane_tty}"`
pudb3 $@
