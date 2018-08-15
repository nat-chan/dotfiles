#!/bin/bash
# 既存プロセスの標準出力と標準エラーを奪う http://bit.ly/1neWKth

# ターゲットのPID
pid=$1
[[ -d /proc/$1/fd ]] || exit 1

# 出力先はttyやファイルを指定
out="$2"

# 出力先の指定がない場合は現在のttyを出力先にする
if [[ -z $out ]]; then
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
  out=$(search_tty)
fi

[[ -n $out ]] || exit 1
[[ -e $out ]] || touch "$out"
[[ -e $out ]] || exit 1

# gdbスクリプトを作る
tmpfile="/tmp/$(basename -- "$0").tmp.$$"
( echo "p close(1)"
  echo "p open(\"$out\", 1)"
  echo "p close(2)"
  echo "p open(\"$out\", 1)"
  echo "detach"
  echo "quit"
) > "$tmpfile"

# ターゲットプロセスに対してgdbスクリプト実行
gdb -p "$pid" -x "$tmpfile"

# 後始末
rm -f "$tmpfile"
