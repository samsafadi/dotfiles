export ZSH="/home/bassam/.oh-my-zsh"
export FZF_BASE=/usr/bin/fzf

setopt PROMPT_SUBST
PROMPT='%F{240}[%T] %B%F{blue}%m%F'
PROMPT+='$([[ $PWD != $HOME ]] && echo "{white}:%F{yellow}%1~")' 
PROMPT+='%F{magenta} |%f%b '
#PROMPT="%B%F{green}%n@%m%F{blue}:%2~%F{white}$%f%b "
plugins=(git fzf) 

export PATH=$PATH:~/anaconda3/bin

# git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
alias n="nvim"
alias nc='nvim ~/.config/nvim/init.vim'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
