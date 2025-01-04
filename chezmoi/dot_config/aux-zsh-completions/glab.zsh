#compdef glab

__glab_debug() {
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_glab() {
    local shellCompDirectiveError=1
    # ... rest of glab completion function ...
}

if [ "$funcstack[1]" = "_glab" ]; then
    _glab "$@"
else
    compdef _glab glab
fi 