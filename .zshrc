start=$(date "+%s.%N")
zmodload zsh/zprof
#{{{zplug
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "ssh0/dot", use:"*.sh"
#zplug "Aloxaf/fzf-tab", use:"*.plugin.zsh"
#zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
#zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "modules/prompt", from:prezto
zplug "modules/history", from:prezto
zplug "modules/editor", from:prezto
zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh"

#zplug "modules/directory", from:prezto
#zplug "modules/environment", from:prezto
#zplug "modules/git", from:prezto
#zplug "modules/spectrum", from:prezto
#zplug "modules/terminal", from:prezto
#zplug "modules/utility", from:prezto

zplug romkatv/powerlevel10k, as:theme, depth:1

if [ ! ~/.zcheck -nt ~/.zshrc ]; then
    touch ~/.zcheck
    echo .zcheck
    if ! zplug check --verbose; then
        zplug install
    fi
fi
zplug load
#}}}

export PATH="\
:$HOME/go/bin\
:$HOME/local/bin\
:$HOME/dotfiles/scripts\
:$PATH"

if [ -d /usr/local/cuda-10.2 ]; then
    source ~/dotfiles/scripts/CUDA9.2_ENV.sh
fi

if [ -d /usr/local/cuda-12.1 ]; then
    export PATH="/usr/local/cuda-12.1/bin:${PATH}"
    export LD_LIBRARY_PATH="/usr/local/cuda-12.1/lib64:${LD_LIBRARY_PATH}"
fi

export DOT_REPO="https://github.com/nat-chan/dotfiles"
export DOT_DIR="$HOME/dotfiles"
if [ -d ~/.zsh/dot ]; then
    fpath=($HOME/.zsh/dot $fpath)
    source $HOME/.zsh/dot/dot.sh
fi

export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set colorcolumn=0 ft=man nolist nonu' -\""
export EDITOR="vi"

#{{{substring search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search # Up
bindkey "^N" down-line-or-beginning-search # Down
bindkey -e
#}}}

#{{{auto_pushd
# https://qiita.com/yoshikaw/items/e12e239afdbaaec78ec7
# https://qiita.com/sho-t/items/8e78d374512703cc2f38
DIRSTACKSIZE=100
setopt auto_pushd
setopt pushd_silent
setopt pushd_minus
# cd -<TAB>でセレクト時にハイライトされるが
# 起動時間が1sec遅くなる
#autoload -Uz compinit && compinit
#
#zstyle ':completion:*' menu select
#zstyle ':completion:*:cd:*' ignore-parents parent pwd
#zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
#}}}

set -o BSD_ECHO #デフォでecho -e <引数> するのをやめる
autoload zmv

win() {
    windows_title=$(grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
    sudo grub-reboot "$windows_title" && sudo reboot
}

alias zmv='noglob zmv -W'
alias mux=tmuxinator
alias p="/usr/local/bin/proxychains4 -q"

if [ -e ~/miniconda3/bin/tmux ] ; then
    alias tmux='~/miniconda3/bin/tmux -2'
else
    alias tmux='tmux -2'
fi

alias rm=rm
if [ -e ~/.cargo/bin/exa ]; then
    alias ls='exa --group-directories-first --color=auto --icons'
else
    alias ls='ls --color'
fi
alias gi='vim +Gstatus'
alias concrete="conda env create --force --file"
source ~/dotfiles/scripts/vivid.sh

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

if [[ "$(hostname)" =~ DESKTOP.* ]]; then
    source ~/dotfiles/scripts/agent_client.sh
else
    source ~/dotfiles/scripts/agent.sh
fi

source $HOME/.cargo/env
eval "$($HOME/miniconda3/bin/conda shell.zsh hook)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


if [ -d $HOME/.vscode-server ]; then
    for p in $HOME/.vscode-server/bin/*/bin; do
        export PATH="$p:$PATH"
    done
fi
export BETTER_EXCEPTIONS=1

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt extended_history

winboot () {
    windows_title=$(grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
    sudo grub-reboot "$windows_title" && sudo reboot
}

hname=$(hostname -I|grep -oP '(?<=192.168.0.1)\d*')
[ -z "$hname" ]&&hname=$HOST
echo -ne "\033]0;${hname}\007"

end=$(date "+%s.%N")
echo $((end-start))