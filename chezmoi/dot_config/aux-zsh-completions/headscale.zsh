#compdef headscale

__headscale_debug() {
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_headscale() {
    local shellCompDirectiveError=1
    # ... rest of headscale completion function ...
}

if [ "$funcstack[1]" = "_headscale" ]; then
    _headscale "$@"
else
    compdef _headscale headscale
fi 