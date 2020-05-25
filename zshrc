export ZSH="/home/bassam/.oh-my-zsh"
export FZF_BASE=/usr/bin/fzf


#PROMPT="%B%F{green}%n@%m%F{blue}:%2~%F{white}$%f%b "
#ZSH_THEME=(cypher)
if [[ -f /etc/DIR_COLORS ]] ; then
  eval $(dircolors -b /etc/DIR_COLORS)
fi

export PATH=$PATH:~/anaconda3/bin

plugins=(git fzf zsh-completions)
autoload -U compinit && compinit

#git
#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
#zstyle ':vcs_info:*' enable git

function git_status {
    if [ -z $(current_branch) ]; then
        return
    else
        echo " <$(current_branch)>"
    fi
}

setopt PROMPT_SUBST
PROMPT='%F{240}[%T] %B%F{green}%m%F'
PROMPT+='$([[ $PWD != $HOME ]] && echo "{white}:%F{blue}%1~")' 
PROMPT+='%b%F{136}$(git_status)%B%F{magenta} |%f%b '

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
alias n="nvim"
alias nc='nvim ~/.config/nvim/init.vim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
