#autoload zmv set -o BSD_ECHO
#setopt CLOBBER
#
#export PATH="$HOME/local/bin:$PATH"
#export PATH="$HOME/dotfiles/scripts:$PATH"
#export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set colorcolumn=0 ft=man nolist nonu noma' -\""
#export EDITOR=vim
#export VISUAL=vim
#
#alias mux=tmuxinator
#alias tmux="tmux -2"
#alias vim=nvim
#alias rm=rm
#alias zmv='noglob zmv -W'
#
#source ~/dotfiles/scripts/agent.sh

export DOT_REPO="https://github.com/nat-chan/dotfiles"
export DOT_DIR="$HOME/dotfiles"

# load zplug
source ~/.zplug/init.zsh
#zplug "zsh-users/zsh-history-substring-search"
zplug "modules/zsh-history-substring-search", from:prezto
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "ssh0/dot", use:"*.sh"
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
zplug "modules/prompt", from:prezto
zplug "modules/autosuggestions", from:prezto
zplug "modules/editor", from:prezto

#zplug "modules/command-not-found", from:prezto
#zplug "modules/completion", from:prezto
#zplug "modules/directory", from:prezto
#zplug "modules/environment", from:prezto
#zplug "modules/git", from:prezto
#zplug "modules/history", from:prezto
#zplug "modules/spectrum", from:prezto
#zplug "modules/terminal", from:prezto
#zplug "modules/utility", from:prezto

zstyle ':prezto:module:prompt' theme 'N'
zstyle ':prezto:module:autosuggestions' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'emacs'

if ! zplug check --verbose; then
    zplug install
fi
zplug load

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - zsh)"
