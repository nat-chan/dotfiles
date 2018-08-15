#!/bin/bash
[ $# -eq 0 ]&&path=`cat`
[ $# -eq 1 ]&&path=$1
echo "$path" | sed -e 's|\\|/|g' -e 's|^\([A-Za-z]\)\:/\(.*\)|/mnt/\L\1\E/\2|'
