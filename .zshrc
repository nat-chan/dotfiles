# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

#{{{pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#}}}

autoload zmv
set -o BSD_ECHO
setopt CLOBBER

export PATH="$HOME/local/bin:$PATH"
export DISPLAY=localhost:0
export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set colorcolumn=0 ft=man nolist nonu noma' -\""
export EDITOR=nvim
export VISUAL=nvim
export GDK_SCALE=2
#export GDK_DPI_SCALE=2
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
alias mux=tmuxinator
alias vim=nvim
alias rm=rm
alias zmv='noglob zmv -W'


[ "$PWD" = "/mnt/c/Windows/System32" ] && cd ~
source ~/agent.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
