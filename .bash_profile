# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Load .bashrc if it exists
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
# Brew things a bit
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi
# Path is here
if [ -f ~/.path ]; then . ~/.path; fi

if [ -f ~/.profile ]; then . ~/.profile; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
