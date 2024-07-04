#!/usr/bin/env zsh
# disrupted zshrc


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
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
    # zdharma-continuum/zinit-annex-man
### End - zinit's installer chunk

### Start - zinit Config
# Prompt : https://github.com/starship/starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# autosuggest and syntax lighlight
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

# Load OMZ Git library
zinit snippet OMZ::lib/git.zsh

# Install OMZ git aliases
zinit snippet OMZ::plugins/git/git.plugin.zsh

# Replace zsh's default completion selection menu with fzf!
zinit light Aloxaf/fzf-tab

# reminders for aliases if whole command is typed
zinit light djui/alias-tips

# vim mode in zsh
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# cht.sh
zinit wait"2a" lucid \
  id-as"cht.sh" \
  as"program" \
  for https://cht.sh/:cht.sh
  # has'rlwrap' \

zinit wait"2b" lucid \
  id-as"cht-completion" \
  has'rlwrap' \
  mv"cht* -> _cht" \
  as"completion" \
  for https://cheat.sh/:zsh


# PRETTYPING
zinit ice lucid wait="" as="program" pick="prettyping" atload="alias pping=prettyping"
zinit load denilsonsa/prettyping

### End - zinit Config

### Start - App Config
export PATH="$PATH:/root/local/bin"
# starship
eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"
# atuin
eval "$(atuin init zsh)"
eval "$(atuin gen-completions --shell=zsh)"
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
alias python3="python"

