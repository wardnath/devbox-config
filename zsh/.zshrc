#!/usr/bin/env zsh
# Start - zinit Installer Chunk
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz compinit && compinit
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
    # zdharma-continuum/zinit-annex-man

fpath=($DEVBOX_GLOBAL_PREFIX/share/zsh/site-functions $fpath)
autoload -Uz compinit; compinit

# End of Zinit's installer chunk

# zsh vi mode clipboard
# https://github.com/kutsan/zsh-system-clipboard
zinit ice wait lucid
zinit light "kutsan/zsh-system-clipboard"

### Atuin
zinit ice wait lucid
zinit load ellie/atuin

### Start - zinit Config
# Prompt : https://github.com/starship/starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# interactive jq initiate with alt-j
# https://github.com/reegnz/jq-zsh-plugin
# Causing problems with Warp - disabled for now
#zinit ice wait lucid \
#  atload"bindkey '^j' jq-complete"
#zinit light "reegnz/jq-zsh-plugin"


## Load OMZ Git library
zinit snippet OMZL::git.zsh
## Install OMZ git aliases
# zinit snippet OMZ::plugins/git/git.plugin.zsh


## reminders for aliases if whole command is typed
zinit light djui/alias-tips

## vim mode in zsh
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

## PRETTYPING
zinit ice lucid wait="" as="program" pick="prettyping" atload="alias pping=prettyping"
zinit load denilsonsa/prettyping

# FZF 
#zinit ice wait lucid
#zinit light Aloxaf/fzf-tab
#zinit ice blockf
#zinit snippet OMZ::plugins/fzf

# libs from Oh My Zsh
# A script to make using 256 colors in zsh less painful
# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/spectrum.zsh
zinit snippet OMZL::spectrum.zsh 

# Completions
# Docker completion
zinit ice as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# misc completions
zinit ice wait lucid
zinit load zsh-users/zsh-completions
zinit load clarketm/zsh-completions


# Python
zinit snippet OMZP::python
# Dotenv
zinit snippet OMZP::dotenv
# K8s
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
# Brew
zinit snippet OMZP::brew

# ollama
#zinit light Katrovsky/zsh-ollama-completion
zinit ice wait lucid as"completion" 
zinit snippet https://github.com/wardnath/zsh-ollama-completion/blob/main/_ollama

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
#zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
#zstyle ':fzf-tab:*' switch-group '<' '>'
# show completion menu on successive tab press (menu_complete overrides)
setopt auto_menu

### End - zinit Config

### Start - App Config

export PATH="$PATH:/root/.local/bin"
# starship
# eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"

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
export PREVIEW="bat"


