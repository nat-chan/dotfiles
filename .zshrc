# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

#{{{pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
#}}}

autoload zmv
set -o BSD_ECHO
setopt CLOBBER

export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/dotfiles/scripts:$PATH"
export DISPLAY=localhost:0
export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set colorcolumn=0 ft=man nolist nonu noma' -\""
export EDITOR=vim
export VISUAL=vim
export GDK_SCALE=2
#export GDK_DPI_SCALE=2

alias mux=tmuxinator
alias tmux="tmux -2"
alias vim=nvim
alias rm=rm
alias zmv='noglob zmv -W'

[ "$PWD" = "/mnt/c/Windows/System32" ] && cd ~
source ~/dotfiles/scripts/agent.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
