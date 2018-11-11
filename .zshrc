# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

set -o BSD_ECHO
export PATH="\
$HOME/bin\
:/usr/local/bin\
:/usr/bin\
:/bin\
:/sbin:/usr/sbin\
"

#:$HOME/.pyenv/shims\
#:$HOME/.pyenv/bin\
#export PYENV_ROOT="$HOME/.pyenv"
#pyenv rehash

export LANG='ja_JP.UTF-8'
export DISPLAY='localhost:0.0'
export GOPATH="$HOME/go"
export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set colorcolumn=0 ft=man nolist nonu noma' -\""
export EDITOR='nvim -u ~/.vimrc'
export VISUAL='nvim -u ~/.vimrc'
#export NVIM_LISTEN_ADDRESS=/tmp/nvim
export NVIM_LISTEN_ADDRESS=127.0.0.1:6666
export KMP_AFFINITY=disabled
export XDG_CONFIG_HOME=$HOME/.config
export TESSDATA=/usr/local/share/tessdata
export SATYSFI_LIB_ROOT=/usr/local/lib-satysfi

autoload zmv
alias zmv='noglob zmv -W'

alias pandoc="pandoc +RTS -V0 -RTS"
alias vim='nvim -u ~/.vimrc'
alias vi='nvim -u ~/.vimrc'
alias mux=tmuxinator
alias tmux='tmux -2'

function glcc(){
	g++ $1 -lglut -lGLU -lGL -lm -std=c++11 -o ${1%.cpp}.out
}

[ "$TMUX" != "" ] && tmux select-pane -P "bg=#000000"

setopt CLOBBER
alias rm=rm
#source ~/bin/tmux_select.sh
