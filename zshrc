# antigen
source /opt/homebrew/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle conda-incubator/conda-zsh-completion
antigen apply

autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload -U colors && colors
precmd() { vcs_info }

PROMPT='%B%F{blue}%~ %f%b%# '
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats 'on %b'
RPROMPT="%B%{$fg[blue]%}\$vcs_info_msg_0_%{$reset_color%}%b"

# ls colors
export LSCOLORS=exfxcxdxbxegedabagacad

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
export CLICOLOR=1
# export PATH=":$PATH"
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

autoload -Uz compinit && compinit
alias vi="nvim"

setopt sharehistory
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
