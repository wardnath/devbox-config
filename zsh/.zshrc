#!/usr/bin/env zsh

# Clear existing compdump file to force reloading completions
[[ -f ~/.zcompdump ]] && rm -f ~/.zcompdump

# Set up fpath for completions EARLY - before any plugins load
# Custom completions directories are placed FIRST to override system completions
fpath=(${HOME}/.config/aux_completions ${0:h}/aux_completions $DEVBOX_GLOBAL_PREFIX/share/zsh/site-functions $fpath)

# Unload any existing completions to ensure a clean slate
unfunction compdef 2>/dev/null
#unfunction _* 2>/dev/null  # Unload all completion functions

# Run compinit with the -u flag to avoid security checks on custom completions
autoload -Uz compinit && compinit -u

# Start - zinit Installer Chunk
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# We don't need another compinit call - we already did one above
# autoload -Uz compinit && compinit  # This line is removed/commented

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

# fzf-tab
zinit ice wait lucid
zinit light Aloxaf/fzf-tab

# Custom Git aliases instead of OMZ Git plugin
# Basic commands
alias gst='git status'
alias gd='git diff'

fzfb() {
   fzf --bind "change:reload:rg --color=always --line-number --no-heading --smart-case {q} || true" \
    --ansi --phony \
    --preview '
      FILE=$(echo {1} | cut -d: -f1)
      LINE=$(echo {1} | cut -d: -f2)
      START=$(( LINE > 50 ? LINE - 50 : 1 ))
      END=$(( LINE + 50 ))
      bat --style=numbers --color=always --highlight-line $LINE --line-range $START:$END $FILE
    '
}

# ollama
#zinit light Katrovsky/zsh-ollama-completion
zinit ice wait lucid as"completion"
zinit snippet https://github.com/wardnath/zsh-ollama-completion/blob/main/_ollama

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# show completion menu on successive tab press (menu_complete overrides)
setopt auto_menu

### End - zinit Config

### Start - App Config

export PATH="$PATH:/root/.local/bin"
# starship
# eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"

# nnn configuration
# Basic settings

export NNN_TERMINAL="tmux"

# Extended plugin selection
export NNN_PLUG='o:autojump;p:preview-tui;g:gitroot;c:fzcd;'

# Preview configuration
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_PREVIEW_TABWIDTH=2
export NNN_PREVIEWDIR="$HOME/.cache/nnn/previews"
export NNN_PREVIEW=1

# File selection and operations
export NNN_SEL='/tmp/.sel'  # Selection file location
export NNN_TRASH=1          # Use trash instead of permanent delete
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"

# Enhanced navigation
export NNN_RESTRICT_NAV_OPEN=0  # Don't restrict file opening
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"  # Enhanced opener script
export NNN_IDLE_TIMEOUT=300     # For auto preview refresh
export NNN_OPS_PROG=1           # Enable progress bars for operations

# Extended bookmarks
export NNN_BMS="d:~/Downloads;D:~/Documents;t:~/Temporary;p:~/Projects;g:~/gitrepos;c:~/.config;n:~/.config/nvim"

# Colors and appearance
export NNN_FCOLORS="03040601000205f7d204d9f7"  # File colors
export NNN_COLORS="2136"  # Different directory colors

# User preferences
export NNN_USE_EDITOR=1
export NNN_SHOW_HIDDEN=1  # Always show hidden files
export NNN_OPTS="aAcdeEHoruU"  # Various usability options

# CD on quit functionality
n() {
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Run nnn
    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
alias nnn="n"


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

# Optional: Force specific completions for critical commands if needed
# For example:
# compdef _my_custom_git git
