#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

PS1="\[$(tput bold)\]\[$(tput setaf 5)\][\[$(tput setaf 2)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 5)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
TERM=xterm-termite
export TERM

# enable bash_aliases by uncom the next 3 lines GU 12/1/2008
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
