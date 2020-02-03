#!/bin/bash

set -ex

git clone https://github.com/neovim/neovim
cd neovim
mkdir -p $HOME/local/bin/
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/local
make install
