#!/bin/bash
tail -f /dev/null --pid $(ps a|fzf|awk '{print $1}')
printf '\e[9;1t'
