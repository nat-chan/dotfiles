#!/bin/bash
ln -s `readlink -f .vimrc` $HOME/.vimrc
ln -s `readlink -f .vim` $HOME/.vim
ln -s `readlink -f .tmux.conf` $HOME/.tmux.conf
