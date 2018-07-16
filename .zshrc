# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

set -o BSD_ECHO
export PATH="\
/home/N/bin\
:/usr/local/bin\
:/home/N/.pyenv/shims\
:/home/N/.pyenv/bin\
:/usr/bin\
:/bin\
:/sbin:/usr/sbin\
:/home/N/.opam/system/bin\
"

eval `opam config env`

export PYENV_ROOT="$HOME/.pyenv"
pyenv rehash

export LANG='ja_JP.UTF-8'
export DISPLAY='localhost:0.0'
export GOPATH="$HOME/go"
export MANPAGER="/bin/sh -c \"col -b -x|nvim -R -c 'set colorcolumn=0 ft=man nolist nonu noma' -\""
export EDITOR=nvim
export VISUAL=nvim
#export NVIM_LISTEN_ADDRESS=/tmp/nvim
export NVIM_LISTEN_ADDRESS=127.0.0.1:6666
export KMP_AFFINITY=disabled
export XDG_CONFIG_HOME=/home/N/.config
export TESSDATA=/usr/local/share/tessdata
export SATYSFI_LIB_ROOT=/usr/local/lib-satysfi

autoload zmv
alias zmv='noglob zmv -W'

alias pandoc="pandoc +RTS -V0 -RTS"
alias vim=nvim
alias vi=nvim
alias mux=tmuxinator
alias tmux='~/tmux-SIXEL-24bitColor/tmux -2'

function glcc(){
	g++ $1 -lglut -lGLU -lGL -lm -std=c++11 -o ${1%.cpp}.out
}

[ "$TMUX" != "" ] && tmux select-pane -P "bg=#000000"

setopt CLOBBER
alias rm=rm
#source ~/bin/tmux_select.sh

PATH="/home/N/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/N/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/N/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/N/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/N/perl5"; export PERL_MM_OPT;
