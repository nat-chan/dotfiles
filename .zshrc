# load zgen
[ -f "${HOME}/.zgen/zgen.zsh" ] || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    # plugins
    zgen load ssh0/dot
    zgen load mattberther/zsh-pyenv

    # prezto and modules
    zgen prezto
    zgen prezto autosuggestions
    zgen prezto command-not-found
    zgen prezto completion
    zgen prezto directory
    zgen prezto editor
    zgen prezto environment
    zgen prezto git
    zgen prezto history
    zgen prezto history-substring-search
    zgen prezto prompt
    zgen prezto spectrum
    zgen prezto syntax-highlighting
    zgen prezto terminal
    zgen prezto utility

    # prezto options
    zgen prezto color yes
    zgen prezto editor key-bindings emacs
    zgen prezto prompt theme N

    zgen save
fi

export DOT_REPO="https://github.com/nat-chan/dotfiles"
export DOT_DIR="$HOME/dotfiles"
[ -d $DOT_DIR ] || dot clone && dot set -v

autoload zmv
set -o BSD_ECHO
setopt CLOBBER

#^P, ^N で前方一致検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end


export ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

export PATH="$HOME/local/bin:$PATH"
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
