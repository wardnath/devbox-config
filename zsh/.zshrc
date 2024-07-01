echo "Initializing devbox global .zshrc"
# Start - add devbox bits to zsh
fpath+=($DEVBOX_GLOBAL_PREFIX/share/zsh/site-functions $DEVBOX_GLOBAL_PREFIX/share/zsh/$ZSH_VERSION/functions $DEVBOX_GLOBAL_PREFIX/share/zsh/vendor-completions)
autoload -U compinit && compinit
# End - add devbox bits to zsh

### Start - zinit Installer Chunk
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# If you source zinit.zsh after compinit, add the following snippet after sourcing zinit.zsh:
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


### Start - zinit Config
# Zinit Plugins

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

zinit ice wait'0' lucid atload'!_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait'1' lucid atinit'zicompinit'
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait'2' from'gh-r'
zinit light zdharma/fast-syntax-highlighting

zinit ice wait'2' atinit'fzf-compinit' atload'!_fzf_complete'
zinit light junegunn/fzf

zinit ice wait'1' lucid atload'!_history_search'
zinit light zdharma-continuum/history-search-multi-word

### End - zinit Config

### Start - App Config
export PATH="$PATH:/root/local/bin"
# starship
eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"
# direnv
eval "$(direnv hook zsh)"
# thefuck
eval "$(thefuck --alias)"
alias duck="fuck" # it's like you are ducking the bad command
# atuin
if [[ $options[zle] = on ]]; then
  eval "$(atuin init zsh )"
fi
# devbox completions
eval "$(devbox completion zsh)"
# vi mode 
# set -o vi
# nnn
alias nnn="nnn -e"
export NNN_PLUG='f:finder;o:autojump;p:preview-tui'
export NNN_FIFO='/tmp/nnn.fifo'
# export NNN_FCOLORS='00001e310000000000000000'
export NNN_TERMINAL="tmux"
export NNN_BMS="d:~/Downloads;D:~/Documents;t:~/Temporary" # Bookmarks
export NNN_FCOLORS="03040601000205f7d204d9f7" # File colors
### End - App Config

# System-related variables
export LC_ALL="C.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export PREVIEW="nvim"
