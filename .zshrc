# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
PATH="$HOME/local/bin:$PATH"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias vim=nvim
alias tmux='tmux -2'
alias ls='ls -v --group-directories-first --color=auto'

function paste64() {
        echo -ne '\e]52;0;'
        base64 | tr -d '\012'
        echo -ne '\e\\'
}

