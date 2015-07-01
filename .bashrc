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

export PS1=$YELLOW"\u"$LIGHT_GRAY"🌀 "$MAGENTA"\h"$CYAN" [📂  \W]"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'" $(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'" $(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$GREEN'" $(__git_ps1 " (%s)")
    fi)'$LIGHT_GRAY': '

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
