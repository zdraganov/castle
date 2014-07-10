# ~/.bashrc - bash interactive session config


#
# is this an interactive session?
#
[[ -z "${PS1}" ]] && return


#
# prompt string made the nice way
#
prompt_command() {
	## hostname
	local host=${HOSTNAME%.local}

	## colors
	local reset='\[\033[00m\]'
	local grey='\[\033[01;30m\]'
	local red='\[\033[01;31m\]'
	local green='\[\033[01;32m\]'
	local yellow='\[\033[01;33m\]'
	local blue='\[\033[01;34m\]'
	local pink='\[\033[01;35m\]'
	local cyan='\[\033[00;36m\]'

	## nifty current directory
	local pwd=${PWD/$HOME/\~}
	if [[ $pwd = /home/* ]]; then
		pwd=\~${pwd#/home/}
	fi

	## git/svn status, ruby rvm gemset, python virtualenv
	local git=
	local svn=
	local rgs=
	local pve=
	local dir=${PWD}

	if [[ ${dir} != ${HOME} ]]; then
		while [[ ! -d ${dir}/.git && ${dir} != '/' && -n ${dir} ]]; do
			dir=${dir%/*}
		done

		if [[ -n ${dir} && -z ${BASHRC_DISABLE_GIT} ]]; then
			local branch=`git symbolic-ref HEAD 2>/dev/null`
			branch=${branch#refs/heads/}
			if [[ -n ${branch} ]]; then
				local status=`git status --porcelain 2>/dev/null`
				if [[ -n ${status} ]]; then
					git="${reset}(${grey}git:${red}${branch}${reset})"
				else
					git="${reset}(${grey}git:${green}${branch}${reset})"
				fi
			fi
		fi

		if [[ -z ${git} && -z ${BASHRC_DISABLE_SVN} ]]; then
			dir=${PWD}
			while [[ ! -d ${dir}/.svn && ${dir} != '/' && -n ${dir} ]]; do
				dir=${dir%/*}
			done

			if [[ -n ${dir} ]]; then
				local revision=`svn info 2>/dev/null|grep Revision:|cut -d' ' -f2`
				if [[ -n ${revision} ]]; then
					#svn="${reset}(${grey}svn:${blue}r${revision}${reset})"
					local status=`svn status 2>/dev/null|head -1`
					if [[ -n ${status} ]]; then
						svn="${reset}(${grey}svn:${red}r${revision}${reset})"
					else
						svn="${reset}(${grey}svn:${green}r${revision}${reset})"
					fi
				fi
			fi
		fi

		if [[ -z ${BASHRC_DISABLE_RVM_GEMSET} && -n ${GEM_HOME} && ${GEM_HOME} = *${rvm_gemset_separator:-'@'}* ]]; then
			rgs="${reset}{${grey}env:${cyan}${GEM_HOME##*@}${reset}}"
		fi

		if [[ -z ${BASHRC_DISABLE_VIRTUALENV} && -n ${VIRTUAL_ENV} ]]; then
			pve="${reset}{${grey}env:${cyan}${VIRTUAL_ENV##*/}${reset}}"
		fi
	fi

	PS1="${reset}[${green}${USER}${reset}@${blue}${host}${reset}(${yellow}${pwd}${git}${svn}${rgs}${pve}${reset})]\\$ "
}

PS1="\u@\h:\w\\$ "
PROMPT_COMMAND=prompt_command


#
# aliases
#
## ls aliases
if [[ ${OSTYPE} = darwin* && ${OSTYPE} != 'darwin9' ]]; then
	export CLICOLOR=1
	export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
	alias ls='ls -ACF'
else
	alias ls='ls -ACF --color=auto'
fi

alias ll='ls -hAlF'
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

## for the man
alias fs='foreman start'
alias fc='foreman run rails console'

## some administrative ones
alias su='sudo su'
alias chown='sudo chown'


#
# for macosx - remove /usr/local/bin and /usr/local/sbin from path
#
PATH=${PATH/\/usr\/local\/bin:}
PATH=${PATH/:\/usr\/local\/bin}
PATH=${PATH/\/usr\/local\/sbin:}
PATH=${PATH/:\/usr\/local\/sbin}


#
# prepend /usr/local/bin, /usr/local/sbin, ~/bin, ~/.bin and ~/.local/bin to path
#
[[ ! $PATH =~ "/usr/local/bin" ]]	&& PATH="/usr/local/bin:${PATH}"
[[ ! $PATH =~ "/usr/local/sbin" ]]	&& PATH="/usr/local/sbin:${PATH}"
[[ -d "${HOME}/bin" ]]				&& PATH="${HOME}/bin:${PATH}"
[[ -d "${HOME}/.bin" ]]				&& PATH="${HOME}/.bin:${PATH}"
[[ -d "${HOME}/.local/bin" ]]		&& PATH="${HOME}/.local/bin:${PATH}"

# homebrew paths here
[[ -d "/usr/local/share/python" ]]	&& PATH="/usr/local/share/python:${PATH}"
[[ -d "/usr/local/share/python3" ]]	&& PATH="/usr/local/share/python3:${PATH}"

export PATH


#
# disable some common history files (i hate'em)
#
export HISTFILE=/dev/null
export LESSHSTFILE=/dev/null


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
# bash completion
#
if [[ -x /usr/local/bin/brew && -f `brew --prefix`/etc/bash_completion ]]; then
	. `brew --prefix`/etc/bash_completion
elif [[ -f /etc/bash_completion ]]; then
	. /etc/bash_completion
fi

if [[ $('uname') == 'Linux' ]]; then
  runst() { nohup /home/zhivko/Dev/Tools/Sublime\ Text\ 2/sublime_text $1 > /dev/null 2>&1 & }
  alias subl=runst
fi

#
# load rvm stuff
#
[[ -s "${HOME}/.rvm/scripts/rvm" ]]			&& . "${HOME}/.rvm/scripts/rvm"
[[ -r "${HOME}/.rvm/scripts/completion" ]]	&& . "${HOME}/.rvm/scripts/completion"


#
# show message-of-the-day if script is installed
#
[[ ! -z `type -p motd` ]] && motd

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
