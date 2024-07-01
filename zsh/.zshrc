# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

echo "Initializing devbox global .zshrc"

# Start - add devbox bits to zsh
fpath+=($DEVBOX_GLOBAL_PREFIX/share/zsh/site-functions $DEVBOX_GLOBAL_PREFIX/share/zsh/$ZSH_VERSION/functions $DEVBOX_GLOBAL_PREFIX/share/zsh/vendor-completions)
autoload -U compinit && compinit
# End - add devbox bits to zsh

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
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### Zinit Config
# Powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
# SSH-AGENT
zinit light bobsoppe/zsh-ssh-agent

# zsh-autosuggestions
zinit ice wait'0' lucid atload'!_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# url-quote-magic and bracketed-paste-magic
autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete bracketed-paste accept-line push-line-or-edit)

# enhancd
zinit ice wait'0b' lucid
zinit light b4b4r07/enhancd
export ENHANCD_FILTER=fzf:fzy:peco

# history substring searching
zinit ice wait'0b' lucid atload'!export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=green,fg=black,bold"'
zinit light zsh-users/zsh-history-substring-search
setopt HIST_IGNORE_ALL_DUPS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# tmux plugin manager
zinit ice lucid wait'!0a' as'null' id-as'tpm' \
  atclone' \
    mkdir -p $HOME/.tmux/plugins; \
    ln -s $HOME/.zinit/plugins/tpm $HOME/.tmux/plugins/tpm; \
    setup_my_tmux_plugin tpm;'
zinit light tmux-plugins/tpm

# fzf integration
zinit ice lucid wait'0c' as'command' pick'bin/fzf-tmux'
zinit light junegunn/fzf

# fzf-tab
zinit ice wait'1' lucid
zinit light Aloxaf/fzf-tab

# syntax highlighting
zinit ice wait'0c' lucid atinit'zpcompinit;zpcdreplay'
zinit light zdharma-continuum/fast-syntax-highlighting

# zsh-autopairs
zinit ice wait'0c' lucid atinit'zpcompinit;zpcdreplay'
zinit light hlissner/zsh-autopair

# forgit
zinit ice wait lucid id-as'forgit' atload'alias gr=forgit::checkout::file'
zinit load 'wfxr/forgit'

# cheat.sh
zinit wait'2a' lucid \
  id-as'cht.sh' \
  as'program' \
  for https://cht.sh/:cht.sh
zinit wait'2b' lucid \
  id-as'cht-completion' \
  has'rlwrap' \
  mv'cht* -> _cht' \
  as'completion' \
  for https://cheat.sh/:zsh

# mmv renamer
zinit ice lucid wait'0' as'program' id-as'mmv' from'gh-r' \
  mv'mmv* -> mmv' pick'mmv/mmv'
zinit light 'itchyny/mmv'

# nnn file manager
zinit wait lucid id-as'nnn' from'github' as'program' for \
  sbin'nnn' make='O_NERD=1' src'misc/quitcd/quitcd.bash_zsh' \
  jarun/nnn
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG='j:autojump;p:preview-tui;l:launch;r:renamer;w:wallpaper;o:organize;x:xdgdefault'

# python automatic virtualenv
zinit light MichaelAquilina/zsh-autoswitch-virtualenv

# carapace completion
zinit ice as'program' id-as'carapace' from'gh-r' atload' \
  autoload -Uz compinit; \
  compinit; \
  source <(carapace _carapace);'
zinit light carapace-sh/carapace-bin

### App Config
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
  eval "$(atuin init zsh)"
fi
# devbox completions
eval "$(devbox completion zsh)"
# vi mode 
set -o vi
# nnn
alias nnn="nnn -e"
export NNN_PLUG='f:finder;o:autojump;p:preview-tui'
export NNN_FIFO='/tmp/nnn.fifo'
# export NNN_FCOLORS='00001e310000000000000000'
export NNN_TERMINAL="tmux"
export NNN_BMS="d:~/Downloads;D:~/Documents;t:~/Temporary" # Bookmarks
export NNN_FCOLORS="03040601000205f7d204d9f7" # File colors

# System-related variables
export LC_ALL="C.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export PREVIEW="nvim"

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

# Setopt
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete aliases
setopt always_to_end          # when completing from the middle of
