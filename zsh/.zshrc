#!/usr/bin/env zsh
# disrupted zshrc
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions

autoload -Uz compinit; compinit

### End of Zinit's installer chunk
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# fzf config, must be after fast-syntax-highlighting, zsh-autusuggestions, compinit
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zinit light Aloxaf/fzf-tab
zinit load ellie/atuin


### Start - zinit Config
# Prompt : https://github.com/starship/starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# autosuggest and syntax lighlight
# zinit light zsh-users/zsh-autosuggestions
# zinit light zdharma-continuum/fast-syntax-highlighting
# zinit light zsh-users/zsh-completions

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

