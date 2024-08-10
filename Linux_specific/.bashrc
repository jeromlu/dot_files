if [ ! -z "$MSVSCODE" ]; then
	unset MSVCODE
	source /etc/profile
	cd $PLDPWD
fi
#setting up the bash look

PS1='[\[\033[32m\]'      #change color
PS1="$PS1"'\u@\h '		#user@host<space>
PS1="$PS1"'\[\033[33m\]'      #change color 
PS1="$PS1"'\W'		#current working directory
PS1="$PS1"'\[\033[0m\]' #change color to defalut
PS1="$PS1"']$ '		#bracket and new line

#Luke Smith bash look
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

alias ls='ls -hN --color=auto --group-directories-first'
alias lsdot='ls -ladh .?*'
alias grep="grep --color=auto"

#Project aliases
alias my_projects='cd ~/04_Programiranje/01_Python/02_MyProjects'

#Use vi mode in bash
set -o vi
