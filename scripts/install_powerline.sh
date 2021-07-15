#!/bin/bash
# sudo apt install python3 python3-pip
# /usr/loca/bin/python3 にインストール済み を想定
# 他の場所のインタプリタを使う場合は書き換える
# ref: https://github.com/nat-chan/minimal_tmux_vim/tree/master
set -eux

exe=/usr/bin/python3
[ -e $exe ] || exit 1

git clone https://github.com/powerline/powerline $HOME/powerline

$exe -m pip install --editable=$HOME/powerline
$exe -c "import powerline; print(powerline.__file__)"
ls $HOME/powerline/scripts

echo "Add following settings to .tmux.conf"
echo "run-shell \"$exe \$HOME/powerline/scripts/powerline-config tmux setup\""
