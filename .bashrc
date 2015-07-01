#!/bin/bash

source ~/.git-completion.bash
source ~/.git-prompt.sh

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
GREY='\[\033[01;35m\]'
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1=$YELLOW"\u"$LIGHT_GRAY"🌀 "$MAGENTA"\h"$CYAN" [ 📂  \W ]"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'" $(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'" $(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$GREEN'" $(__git_ps1 " (%s)")
    fi)'$LIGHT_GRAY': '

# aliases for listing
alias ll='ls -hAlF'
alias gg='git status -s'
alias li='ls -hAlFi'

## dooh!
alias sl='ls'
alias ks='ls'
alias LS='ls'

## other useful/useless aliases
alias rm='rm -rf'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias dirsize='du -csh'

## util-linux-ng's rename is lame, perl's one is way better
alias rename='prename'

## i hate the .viminfo
alias vim='vim -i NONE'

## fix some other typos i make intensively
alias CD='cd'
alias cd..='cd ..'

## rails!
alias r='rails'
alias rc='rails console'
alias c='rails console'
alias rs='rails server'
alias s='rails server'
alias rg='rails generate'
alias g='rails generate'
alias bundel='bundle'
alias rdm='rake db:migrate'

## for the man
alias fs='foreman start'
alias fc='foreman run rails console'

## some administrative ones
alias su='sudo su'
alias chown='sudo chown'

#
# set some other handy stuff
#
export SVN_EDITOR=vim
export EDITOR=vim

#
# A bit nicer python
#
export PYTHONSTARTUP="${HOME}/.pythonrc"

#
# show message-of-the-day if script is installed
#
[[ ! -z `type -p motd` ]] && motd
