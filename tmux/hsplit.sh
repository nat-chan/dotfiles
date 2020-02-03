#!/bin/bash
current_directory=`readlink -f /proc/$1/cwd`
tmux split-window -h -c "$current_directory"
