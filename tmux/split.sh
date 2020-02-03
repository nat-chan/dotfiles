#!/bin/bash
current_directory=`readlink -f /proc/$1/cwd`
tmux split-window -c "$current_directory"
