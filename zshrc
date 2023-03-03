# antigen
source /opt/homebrew/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen apply

# source $ZSH/oh-my-zsh.sh
PROMPT="%B%F{green}%n@%m%f:%F{blue}%~%f%b$ "

# ls colors
export LSCOLORS=exfxcxdxbxegedabagacad

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
# export PATH=":$PATH"
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH


autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
