# Path to your oh-my-zsh installation.
export ZSH="/Users/bassam/.oh-my-zsh"

ZSH_THEME="cypher"

plugins=(git zsh-completions)

source $ZSH/oh-my-zsh.sh

# ls colors
export LSCOLORS=ExFxCxDxBxegedabagacad

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH


autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
