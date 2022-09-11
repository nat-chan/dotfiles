#!/bin/bash
git clone https://github.com/ssh0/dot $HOME/.zsh/dot

export DOT_REPO="https://github.com/nat-chan/dotfiles"
export DOT_DIR="$HOME/dotfiles"
if [ -d ~/.zsh/dot ]; then
    fpath=($HOME/.zsh/dot $fpath)
    source $HOME/.zsh/dot/dot.sh
fi

dot set -f
