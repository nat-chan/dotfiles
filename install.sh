#!/bin/zsh
[ -e ~/dotfiles ]|| git clone https://github.com/nat-chan/dotfiles ~/dotfiles

#install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

#install anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
yes|~/.anyenv/bin/anyenv install --init

#enable zplug plugins
source ~/dotfiles/.zshrc

dot set -f

#anyenv
anyenv install pyenv
anyenv install nodenv
eval "$(anyenv init - zsh)"

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
pyenv install 3.6.8
pyenv virtualenv 3.6.8 main
pyenv global main

nodenv install 13.7.0
nodenv global 13.7.0

#neovim
~/dotfiles/scripts/fetch_nvim.sh
nvim +PlugInstall! +qall
