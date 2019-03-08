#!/bin/bash
ln -s `readlink -f nvim` $HOME/.config/nvim
ln -s `readlink -f .tmux.conf` $HOME/.tmux.conf
ln -s `readlink -f .zshrc` $HOME/.zshrc
ln -s `readlink -f .zpreztorc` $HOME/.zpreztorc
