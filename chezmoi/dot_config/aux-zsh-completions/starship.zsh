#compdef starship

autoload -U is-at-least

_starship() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    # ... rest of starship completion function ...
}

if [ "$funcstack[1]" = "_starship" ]; then
    _starship "$@"
else
    compdef _starship starship
fi 