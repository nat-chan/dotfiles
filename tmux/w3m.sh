#!/bin/bash
encoded=`echo $1|nkf -WwMQ|tr = %`
tmux split-window -h "w3m \"https://www.google.co.jp/search?q=$encoded\""
