
#!/usr/bin/env zsh
### Start - zinit Installer Chunk
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"
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
    # zdharma-continuum/zinit-annex-man

autoload -Uz compinit; compinit

# End of Zinit's installer chunk
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

### fzf config, must be after fast-syntax-highlighting, zsh-autusuggestions, compinit
zinit load junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zinit load Aloxaf/fzf-tab

### Atuin
zinit ice wait lucid
zinit load ellie/atuin

### Start - zinit Config
# Prompt : https://github.com/starship/starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# Load OMZ Git library
zinit snippet OMZ::lib/git.zsh

# Install OMZ git aliases
zinit snippet OMZ::plugins/git/git.plugin.zsh

# reminders for aliases if whole command is typed
zinit light djui/alias-tips

# vim mode in zsh
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# cht.sh cheat sheet
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

# Completions
zinit ice as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# zsh-bash-completions-fallback
zinit ice depth=1 # optional, but avoids downloading the full history
zinit load 3v1n0/zsh-bash-completions-fallback

zinit load nix-community/nix-zsh-completions
# zinit load sigoden/argc-completions
zinit load zsh-users/zsh-completions
zinit load clarketm/zsh-completions

# lib from Oy My Zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::spectrum.zsh
zinit snippet OMZL::history.zsh

# plugins from Oy My Zsh
zinit wait lucid for \
    OMZP::colorize \
    OMZP::command-not-found \
    OMZP::dotenv \
    OMZP::extract
    # OMZP::fzf

# plugins from Prezto: relative order is important
# TODO: move necessary parts to zshrc
zinit snippet PZT::modules/helper
zinit snippet PZT::modules/gnu-utility
zinit snippet PZT::modules/utility
zinit snippet PZT::modules/completion

# Python
zinit snippet OMZP::python
zinit snippet OMZP::pip

# asdf
zinit ice as'program' src'asdf.sh'
zinit light asdf-vm/asdf
zinit snippet 'OMZP::asdf'

# Reload completions
autoload -Uz compinit && compinit

# Style

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

### End - zinit Config

### Start - App Config
export PATH="$PATH:/root/.local/bin"
# starship
# eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"
# atuin
#eval "$(atuin init zsh)"
#eval "$(atuin gen-completions --shell=zsh)"
# devbox completions
eval "$(devbox completion zsh)"

# vi mode - already set above
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

