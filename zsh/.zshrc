
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

# Ensure devbox binaries are in PATH early
export PATH="$DEVBOX_GLOBAL_PREFIX/bin:$PATH:/usr/local/bin:/usr/local/sbin:${HOME}/.local/bin"

# Git completion path - add before compinit
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

# Custom Git aliases instead of OMZ Git plugin
# Basic commands
alias g='git'
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gca='git commit -v --amend'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'

# Branch operations
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'

# Remote operations
alias gf='git fetch'
alias gfo='git fetch origin'
alias gl='git pull'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpsup='git push --set-upstream origin $(git symbolic-ref --short HEAD)'

# Log operations
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline --decorate'

# Stash operations
alias gsta='git stash push'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Reset operations
alias grh='git reset'
alias grhh='git reset --hard'

# Show information
alias gss='git status -s'
alias gsh='git show'

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

# Add common aliases
alias lah='eza -lah'

# devbox helpers
alias dbr='devbox run'
alias dbgr='devbox global run'
alias dbcd='cd $DEVBOX_GLOBAL_ROOT'
alias dbgs='devbox global services'
alias dbgpull='devbox global pull'
alias dbgpush='devbox global push'

# InShellisense activation using precmd hook
# This ensures it runs after the environment is fully established
function _activate_inshellisense() {
   # Only run once
   if [[ -z $_INSHELLISENSE_INITIALIZED ]]; then
     # Debug what's happening
     echo "Activating InShellisense via precmd hook..."

     # Use the actual command that works when you type it manually
     is

     # Mark as initialized to prevent running again
     export _INSHELLISENSE_INITIALIZED=1
   fi
 }

 # Add our function to the precmd hooks array
 autoload -Uz add-zsh-hook
 add-zsh-hook precmd _activate_inshellisense
