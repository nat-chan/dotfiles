#{{{zplug
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "ssh0/dot", use:"*.sh"
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "modules/prompt", from:prezto
zplug "modules/history", from:prezto
zplug "modules/editor", from:prezto

#zplug "modules/directory", from:prezto
#zplug "modules/environment", from:prezto
#zplug "modules/git", from:prezto
#zplug "modules/spectrum", from:prezto
#zplug "modules/terminal", from:prezto
#zplug "modules/utility", from:prezto

zstyle ':prezto:module:prompt' theme 'N'

if ! zplug check --verbose; then
    zplug install
fi
zplug load
#}}}

export PATH="\
:$HOME/.anyenv/bin\
:$HOME/local/bin\
:$HOME/dotfiles/scripts\
:$PATH"

export DOT_REPO="https://github.com/nat-chan/dotfiles"
export DOT_DIR="$HOME/dotfiles"
export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set colorcolumn=0 ft=man nolist nonu noma' -\""

#{{{substring search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search # Up
bindkey "^N" down-line-or-beginning-search # Down
#}}}

set -o BSD_ECHO #デフォでecho -e <引数> するのをやめる
autoload zmv

alias zmv='noglob zmv -W'
alias vim='nvim'
alias mux=tmuxinator
alias tmux='tmux -2'
alias rm=rm
alias ls='ls --group-directories-first --color=auto'

eval "$(anyenv init - zsh)"
source ~/dotfiles/scripts/agent.sh

#source $HOME/.cargo/env

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/natsuki/.anyenv/envs/pyenv/versions/anaconda3-5.2.0/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/natsuki/.anyenv/envs/pyenv/versions/anaconda3-5.2.0/etc/profile.d/conda.sh" ]; then
#        . "/home/natsuki/.anyenv/envs/pyenv/versions/anaconda3-5.2.0/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/natsuki/.anyenv/envs/pyenv/versions/anaconda3-5.2.0/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#
