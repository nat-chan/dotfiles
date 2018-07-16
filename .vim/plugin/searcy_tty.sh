#!/bin/bash

# プロセスに紐付いたttyを取得する http://bit.ly/1eDpRpu
function search_tty() {
  local pid=${1:-$$} tty=""
  while [[ 1 -lt $pid ]]; do
    [[ -d /proc/$pid/fd ]] || break
    tty=$(readlink /proc/$pid/fd/1 2>/dev/null | awk '{print $1}')
    [[ -c $tty ]] && { echo "$tty"; return 0; }
    pid=$(perl -pe 's/\(.*\)/()/' /proc/$pid/stat | awk '{print $4}')
  done
  return 1
}

search_tty $1
