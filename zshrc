# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/bassam/.oh-my-zsh"
export FZF_BASE=/usr/bin/fzf


#PROMPT="%B%F{green}%n@%m%F{blue}:%2~%F{white}$%f%b "
if [[ -f /etc/DIR_COLORS ]] ; then
  eval $(dircolors -b /etc/DIR_COLORS)
fi
ZSH_THEME="cypher"

# Do menu-driven completion.
zstyle ':completion:*' menu select

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


export PATH=$PATH:~/anaconda3/bin

plugins=(git fzf zsh-completions)
source $ZSH/oh-my-zsh.sh
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export EDITOR='nvim'
alias n="nvim"
alias nc='nvim ~/.config/nvim/init.vim'

autoload -U compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
