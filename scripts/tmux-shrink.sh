#!/bin/bash
col=$(tmux capture-pane -p|awk '{l=length($0);if(m<l) m=l}END{print m}')
tmux resize-pane -x $col
