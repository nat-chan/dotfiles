#!/bin/bash
[ $# -eq 0 ]&&path=`cat`
[ $# -eq 1 ]&&path=$1
echo "$path" | sed -e 's|^/mnt/\([A-Za-z]\)/\(.*\)|\U\1\E\:/\2|' -e 's|/|\\|g' 
