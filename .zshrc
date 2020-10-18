#!/bin/zsh

bindkey -e
export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"
export MDV_THEME=960.847

#############
## PLUGINS ##
#############
source ~/.zplug/init.zsh

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, as:theme
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "agkozak/zsh-z"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

############
## PROMPT ##
############
autoload -Uz compinit promptinit
compinit
promptinit
#autoload bashcompinit && bashcompinit

################
## KEYBINDING ##
################
bindkey '^[[3~' delete-char
bindkey '^[[Z'  reverse-menu-complete
bindkey '^V'    push-line

#############
## HISTORY ##
#############
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory

#############
## ALIASES ##
#############
alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias vim='nvim'
alias ssh='TERM=xterm-color; ssh'
alias hibernate='slock systemctl hibernate -i'

#############
## SCRIPTS ##
#############
[ -d "$HOME/scripts" ] && PATH=$PATH:$HOME/scripts

#############
## OPTIONS ##
#############
## Unset
unsetopt beep
## Set
setopt autocd
setopt interactivecomments


################
## COMPLETION ##
################
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
setopt COMPLETE_ALIASES

###########
## FINAL ##
###########
#source $HOME/src/dotgit/bin/bash_completion
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export PATH
