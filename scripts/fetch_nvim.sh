#!/bin/bash

DST=~/local/bin/nvim

mkdir -p `dirname $DST`
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O $DST
chmod +x $DST
$DST --appimage-extract
