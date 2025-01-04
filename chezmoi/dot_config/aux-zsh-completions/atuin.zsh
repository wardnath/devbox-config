#compdef atuin

autoload -U is-at-least

_atuin() {
    typeset -A opt_args
    # ... rest of atuin completion function ...
}

if [ "$funcstack[1]" = "_atuin" ]; then
    _atuin "$@"
else
    compdef _atuin atuin
fi 