#compdef chezmoi

__chezmoi_debug() {
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_chezmoi() {
    local shellCompDirectiveError=1
    # ... rest of chezmoi completion function ...
}

if [ "$funcstack[1]" = "_chezmoi" ]; then
    _chezmoi "$@"
else
    compdef _chezmoi chezmoi
fi 