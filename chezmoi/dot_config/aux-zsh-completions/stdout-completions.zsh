#compdef starship

autoload -U is-at-least

_starship() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_starship_commands" \
"*::: :->starship" \
&& ret=0
    case $state in
    (starship)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:starship-command-$line[1]:"
        case $line[1] in
            (bug-report)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':shell:(bash elvish fish powershell zsh)' \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::name -- Configuration key to edit:' \
'::value -- Value to place into that key:' \
&& ret=0
;;
(explain)
_arguments "${_arguments_options[@]}" : \
'-s+[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE: ' \
'--status=[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE: ' \
'*--pipestatus=[Bash, Fish and Zsh support returning codes for each process in a pipeline]:PIPESTATUS: ' \
'-w+[The width of the current interactive terminal]:TERMINAL_WIDTH: ' \
'--terminal-width=[The width of the current interactive terminal]:TERMINAL_WIDTH: ' \
'-p+[The path that the prompt should render for]:PATH:_files' \
'--path=[The path that the prompt should render for]:PATH:_files' \
'-P+[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'--logical-path=[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'-d+[The execution duration of the last command, in milliseconds]:CMD_DURATION: ' \
'--cmd-duration=[The execution duration of the last command, in milliseconds]:CMD_DURATION: ' \
'-k+[The keymap of fish/zsh/cmd]:KEYMAP: ' \
'--keymap=[The keymap of fish/zsh/cmd]:KEYMAP: ' \
'-j+[The number of currently running jobs]:JOBS: ' \
'--jobs=[The number of currently running jobs]:JOBS: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'--print-full-init[]' \
'-h[Print help]' \
'--help[Print help]' \
':shell:' \
&& ret=0
;;
(module)
_arguments "${_arguments_options[@]}" : \
'-s+[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE: ' \
'--status=[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE: ' \
'*--pipestatus=[Bash, Fish and Zsh support returning codes for each process in a pipeline]:PIPESTATUS: ' \
'-w+[The width of the current interactive terminal]:TERMINAL_WIDTH: ' \
'--terminal-width=[The width of the current interactive terminal]:TERMINAL_WIDTH: ' \
'-p+[The path that the prompt should render for]:PATH:_files' \
'--path=[The path that the prompt should render for]:PATH:_files' \
'-P+[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'--logical-path=[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'-d+[The execution duration of the last command, in milliseconds]:CMD_DURATION: ' \
'--cmd-duration=[The execution duration of the last command, in milliseconds]:CMD_DURATION: ' \
'-k+[The keymap of fish/zsh/cmd]:KEYMAP: ' \
'--keymap=[The keymap of fish/zsh/cmd]:KEYMAP: ' \
'-j+[The number of currently running jobs]:JOBS: ' \
'--jobs=[The number of currently running jobs]:JOBS: ' \
'-l[List out all supported modules]' \
'--list[List out all supported modules]' \
'-h[Print help]' \
'--help[Print help]' \
'::name -- The name of the module to be printed:' \
&& ret=0
;;
(preset)
_arguments "${_arguments_options[@]}" : \
'(-l --list)-o+[Output the preset to a file instead of stdout]:OUTPUT:_files' \
'(-l --list)--output=[Output the preset to a file instead of stdout]:OUTPUT:_files' \
'-l[List out all preset names]' \
'--list[List out all preset names]' \
'-h[Print help]' \
'--help[Print help]' \
'::name -- The name of preset to be printed:(bracketed-segments gruvbox-rainbow jetpack nerd-font-symbols no-empty-icons no-nerd-font no-runtime-versions pastel-powerline plain-text-symbols pure-preset tokyo-night)' \
&& ret=0
;;
(print-config)
_arguments "${_arguments_options[@]}" : \
'-d[Print the default instead of the computed config]' \
'--default[Print the default instead of the computed config]' \
'-h[Print help]' \
'--help[Print help]' \
'*::name -- Configuration keys to print:' \
&& ret=0
;;
(prompt)
_arguments "${_arguments_options[@]}" : \
'(--right)--profile=[Print the prompt with the specified profile name (instead of the standard left prompt)]:PROFILE: ' \
'-s+[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE: ' \
'--status=[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE: ' \
'*--pipestatus=[Bash, Fish and Zsh support returning codes for each process in a pipeline]:PIPESTATUS: ' \
'-w+[The width of the current interactive terminal]:TERMINAL_WIDTH: ' \
'--terminal-width=[The width of the current interactive terminal]:TERMINAL_WIDTH: ' \
'-p+[The path that the prompt should render for]:PATH:_files' \
'--path=[The path that the prompt should render for]:PATH:_files' \
'-P+[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'--logical-path=[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'-d+[The execution duration of the last command, in milliseconds]:CMD_DURATION: ' \
'--cmd-duration=[The execution duration of the last command, in milliseconds]:CMD_DURATION: ' \
'-k+[The keymap of fish/zsh/cmd]:KEYMAP: ' \
'--keymap=[The keymap of fish/zsh/cmd]:KEYMAP: ' \
'-j+[The number of currently running jobs]:JOBS: ' \
'--jobs=[The number of currently running jobs]:JOBS: ' \
'--right[Print the right prompt (instead of the standard left prompt)]' \
'(--right --profile)--continuation[Print the continuation prompt (instead of the standard left prompt)]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(session)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(time)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(timings)
_arguments "${_arguments_options[@]}" : \
'-s+[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE: ' \
'--status=[The status code of the previously run command as an unsigned or signed 32bit integer]:STATUS_CODE: ' \
'*--pipestatus=[Bash, Fish and Zsh support returning codes for each process in a pipeline]:PIPESTATUS: ' \
'-w+[The width of the current interactive terminal]:TERMINAL_WIDTH: ' \
'--terminal-width=[The width of the current interactive terminal]:TERMINAL_WIDTH: ' \
'-p+[The path that the prompt should render for]:PATH:_files' \
'--path=[The path that the prompt should render for]:PATH:_files' \
'-P+[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'--logical-path=[The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument]:LOGICAL_PATH:_files' \
'-d+[The execution duration of the last command, in milliseconds]:CMD_DURATION: ' \
'--cmd-duration=[The execution duration of the last command, in milliseconds]:CMD_DURATION: ' \
'-k+[The keymap of fish/zsh/cmd]:KEYMAP: ' \
'--keymap=[The keymap of fish/zsh/cmd]:KEYMAP: ' \
'-j+[The number of currently running jobs]:JOBS: ' \
'--jobs=[The number of currently running jobs]:JOBS: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(toggle)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':name -- The name of the module to be toggled:' \
'::value -- The key of the config to be toggled:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_starship__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:starship-help-command-$line[1]:"
        case $line[1] in
            (bug-report)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(explain)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(module)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(preset)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(print-config)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(prompt)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(session)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(time)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(timings)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(toggle)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_starship_commands] )) ||
_starship_commands() {
    local commands; commands=(
'bug-report:Create a pre-populated GitHub issue with information about your configuration' \
'completions:Generate starship shell completions for your shell to stdout' \
'config:Edit the starship configuration' \
'explain:Explains the currently showing modules' \
'init:Prints the shell function used to execute starship' \
'module:Prints a specific prompt module' \
'preset:Prints a preset config' \
'print-config:Prints the computed starship configuration' \
'prompt:Prints the full starship prompt' \
'session:Generate random session key' \
'time:Prints time in milliseconds' \
'timings:Prints timings of all active modules' \
'toggle:Toggle a given starship module' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'starship commands' commands "$@"
}
(( $+functions[_starship__bug-report_commands] )) ||
_starship__bug-report_commands() {
    local commands; commands=()
    _describe -t commands 'starship bug-report commands' commands "$@"
}
(( $+functions[_starship__completions_commands] )) ||
_starship__completions_commands() {
    local commands; commands=()
    _describe -t commands 'starship completions commands' commands "$@"
}
(( $+functions[_starship__config_commands] )) ||
_starship__config_commands() {
    local commands; commands=()
    _describe -t commands 'starship config commands' commands "$@"
}
(( $+functions[_starship__explain_commands] )) ||
_starship__explain_commands() {
    local commands; commands=()
    _describe -t commands 'starship explain commands' commands "$@"
}
(( $+functions[_starship__help_commands] )) ||
_starship__help_commands() {
    local commands; commands=(
'bug-report:Create a pre-populated GitHub issue with information about your configuration' \
'completions:Generate starship shell completions for your shell to stdout' \
'config:Edit the starship configuration' \
'explain:Explains the currently showing modules' \
'init:Prints the shell function used to execute starship' \
'module:Prints a specific prompt module' \
'preset:Prints a preset config' \
'print-config:Prints the computed starship configuration' \
'prompt:Prints the full starship prompt' \
'session:Generate random session key' \
'time:Prints time in milliseconds' \
'timings:Prints timings of all active modules' \
'toggle:Toggle a given starship module' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'starship help commands' commands "$@"
}
(( $+functions[_starship__help__bug-report_commands] )) ||
_starship__help__bug-report_commands() {
    local commands; commands=()
    _describe -t commands 'starship help bug-report commands' commands "$@"
}
(( $+functions[_starship__help__completions_commands] )) ||
_starship__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'starship help completions commands' commands "$@"
}
(( $+functions[_starship__help__config_commands] )) ||
_starship__help__config_commands() {
    local commands; commands=()
    _describe -t commands 'starship help config commands' commands "$@"
}
(( $+functions[_starship__help__explain_commands] )) ||
_starship__help__explain_commands() {
    local commands; commands=()
    _describe -t commands 'starship help explain commands' commands "$@"
}
(( $+functions[_starship__help__help_commands] )) ||
_starship__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'starship help help commands' commands "$@"
}
(( $+functions[_starship__help__init_commands] )) ||
_starship__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'starship help init commands' commands "$@"
}
(( $+functions[_starship__help__module_commands] )) ||
_starship__help__module_commands() {
    local commands; commands=()
    _describe -t commands 'starship help module commands' commands "$@"
}
(( $+functions[_starship__help__preset_commands] )) ||
_starship__help__preset_commands() {
    local commands; commands=()
    _describe -t commands 'starship help preset commands' commands "$@"
}
(( $+functions[_starship__help__print-config_commands] )) ||
_starship__help__print-config_commands() {
    local commands; commands=()
    _describe -t commands 'starship help print-config commands' commands "$@"
}
(( $+functions[_starship__help__prompt_commands] )) ||
_starship__help__prompt_commands() {
    local commands; commands=()
    _describe -t commands 'starship help prompt commands' commands "$@"
}
(( $+functions[_starship__help__session_commands] )) ||
_starship__help__session_commands() {
    local commands; commands=()
    _describe -t commands 'starship help session commands' commands "$@"
}
(( $+functions[_starship__help__time_commands] )) ||
_starship__help__time_commands() {
    local commands; commands=()
    _describe -t commands 'starship help time commands' commands "$@"
}
(( $+functions[_starship__help__timings_commands] )) ||
_starship__help__timings_commands() {
    local commands; commands=()
    _describe -t commands 'starship help timings commands' commands "$@"
}
(( $+functions[_starship__help__toggle_commands] )) ||
_starship__help__toggle_commands() {
    local commands; commands=()
    _describe -t commands 'starship help toggle commands' commands "$@"
}
(( $+functions[_starship__init_commands] )) ||
_starship__init_commands() {
    local commands; commands=()
    _describe -t commands 'starship init commands' commands "$@"
}
(( $+functions[_starship__module_commands] )) ||
_starship__module_commands() {
    local commands; commands=()
    _describe -t commands 'starship module commands' commands "$@"
}
(( $+functions[_starship__preset_commands] )) ||
_starship__preset_commands() {
    local commands; commands=()
    _describe -t commands 'starship preset commands' commands "$@"
}
(( $+functions[_starship__print-config_commands] )) ||
_starship__print-config_commands() {
    local commands; commands=()
    _describe -t commands 'starship print-config commands' commands "$@"
}
(( $+functions[_starship__prompt_commands] )) ||
_starship__prompt_commands() {
    local commands; commands=()
    _describe -t commands 'starship prompt commands' commands "$@"
}
(( $+functions[_starship__session_commands] )) ||
_starship__session_commands() {
    local commands; commands=()
    _describe -t commands 'starship session commands' commands "$@"
}
(( $+functions[_starship__time_commands] )) ||
_starship__time_commands() {
    local commands; commands=()
    _describe -t commands 'starship time commands' commands "$@"
}
(( $+functions[_starship__timings_commands] )) ||
_starship__timings_commands() {
    local commands; commands=()
    _describe -t commands 'starship timings commands' commands "$@"
}
(( $+functions[_starship__toggle_commands] )) ||
_starship__toggle_commands() {
    local commands; commands=()
    _describe -t commands 'starship toggle commands' commands "$@"
}

if [ "$funcstack[1]" = "_starship" ]; then
    _starship "$@"
else
    compdef _starship starship
fi
#compdef chezmoi
compdef _chezmoi chezmoi

# zsh completion for chezmoi                              -*- shell-script -*-

__chezmoi_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_chezmoi()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16
    local shellCompDirectiveKeepOrder=32

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
    local -a completions

    __chezmoi_debug "\n========= starting completion logic =========="
    __chezmoi_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __chezmoi_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __chezmoi_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., chezmoi -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __chezmoi_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __chezmoi_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __chezmoi_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __chezmoi_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __chezmoi_debug "No directive found.  Setting do default"
        directive=0
    fi

    __chezmoi_debug "directive: ${directive}"
    __chezmoi_debug "completions: ${out}"
    __chezmoi_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __chezmoi_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __chezmoi_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __chezmoi_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __chezmoi_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __chezmoi_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __chezmoi_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
        __chezmoi_debug "Activating keep order."
        keepOrder="-V"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __chezmoi_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __chezmoi_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __chezmoi_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __chezmoi_debug "Calling _describe"
        if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
            __chezmoi_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __chezmoi_debug "_describe did not find completions."
            __chezmoi_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __chezmoi_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __chezmoi_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_chezmoi" ]; then
    _chezmoi
fi
#compdef op
compdef _op op

# zsh completion for op                                   -*- shell-script -*-

__op_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_op()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16
    local shellCompDirectiveKeepOrder=32

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
    local -a completions

    __op_debug "\n========= starting completion logic =========="
    __op_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __op_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __op_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., op -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __op_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __op_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __op_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __op_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __op_debug "No directive found.  Setting do default"
        directive=0
    fi

    __op_debug "directive: ${directive}"
    __op_debug "completions: ${out}"
    __op_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __op_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __op_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __op_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __op_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __op_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __op_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
        __op_debug "Activating keep order."
        keepOrder="-V"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __op_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __op_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __op_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __op_debug "Calling _describe"
        if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
            __op_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __op_debug "_describe did not find completions."
            __op_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __op_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __op_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_op" ]; then
    _op
fi
#compdef atuin

autoload -U is-at-least

_atuin() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_atuin_commands" \
"*::: :->atuin" \
&& ret=0
    case $state in
    (atuin)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-command-$line[1]:"
        case $line[1] in
            (history)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
":: :_atuin__history_commands" \
"*::: :->history" \
&& ret=0

    case $state in
    (history)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-history-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
'*::command:' \
&& ret=0
;;
(end)
_arguments "${_arguments_options[@]}" \
'-e+[]:EXIT: ' \
'--exit=[]:EXIT: ' \
'-d+[]:DURATION: ' \
'--duration=[]:DURATION: ' \
'-h[Print help]' \
'--help[Print help]' \
':id:' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
'-r+[]' \
'--reverse=[]' \
'-f+[Available variables\: {command}, {directory}, {duration}, {user}, {host}, {exit} and {time}. Example\: --format "{time} - \[{duration}\] - {directory}\$\\t{command}"]:FORMAT: ' \
'--format=[Available variables\: {command}, {directory}, {duration}, {user}, {host}, {exit} and {time}. Example\: --format "{time} - \[{duration}\] - {directory}\$\\t{command}"]:FORMAT: ' \
'-c[]' \
'--cwd[]' \
'-s[]' \
'--session[]' \
'--human[]' \
'--cmd-only[Show only the text of the command]' \
'--print0[Terminate the output with a null, for better multiline support]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(last)
_arguments "${_arguments_options[@]}" \
'-f+[Available variables\: {command}, {directory}, {duration}, {user}, {host} and {time}. Example\: --format "{time} - \[{duration}\] - {directory}\$\\t{command}"]:FORMAT: ' \
'--format=[Available variables\: {command}, {directory}, {duration}, {user}, {host} and {time}. Example\: --format "{time} - \[{duration}\] - {directory}\$\\t{command}"]:FORMAT: ' \
'--human[]' \
'--cmd-only[Show only the text of the command]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_atuin__history__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-history-help-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(end)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(last)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(import)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
":: :_atuin__import_commands" \
"*::: :->import" \
&& ret=0

    case $state in
    (import)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-import-command-$line[1]:"
        case $line[1] in
            (auto)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(zsh)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(zsh-hist-db)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(bash)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(resh)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(fish)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(nu)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(nu-hist-db)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_atuin__import__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-import-help-command-$line[1]:"
        case $line[1] in
            (auto)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(zsh)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(zsh-hist-db)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(bash)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(resh)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(fish)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(nu)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(nu-hist-db)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(stats)
_arguments "${_arguments_options[@]}" \
'-c+[How many top commands to list]:COUNT: ' \
'--count=[How many top commands to list]:COUNT: ' \
'-h[Print help]' \
'--help[Print help]' \
'*::period -- compute statistics for the specified period, leave blank for statistics since the beginning:' \
&& ret=0
;;
(search)
_arguments "${_arguments_options[@]}" \
'-c+[Filter search result by directory]:CWD: ' \
'--cwd=[Filter search result by directory]:CWD: ' \
'--exclude-cwd=[Exclude directory from results]:EXCLUDE_CWD: ' \
'-e+[Filter search result by exit code]:EXIT: ' \
'--exit=[Filter search result by exit code]:EXIT: ' \
'--exclude-exit=[Exclude results with this exit code]:EXCLUDE_EXIT: ' \
'-b+[Only include results added before this date]:BEFORE: ' \
'--before=[Only include results added before this date]:BEFORE: ' \
'--after=[Only include results after this date]:AFTER: ' \
'--limit=[How many entries to return at most]:LIMIT: ' \
'--offset=[Offset from the start of the results]:OFFSET: ' \
'--filter-mode=[Allow overriding filter mode over config]:FILTER_MODE:(global host session directory workspace)' \
'--search-mode=[Allow overriding search mode over config]:SEARCH_MODE:(prefix full-text fuzzy skim)' \
'-f+[Available variables\: {command}, {directory}, {duration}, {user}, {host}, {time}, {exit} and {relativetime}. Example\: --format "{time} - \[{duration}\] - {directory}\$\\t{command}"]:FORMAT: ' \
'--format=[Available variables\: {command}, {directory}, {duration}, {user}, {host}, {time}, {exit} and {relativetime}. Example\: --format "{time} - \[{duration}\] - {directory}\$\\t{command}"]:FORMAT: ' \
'--inline-height=[Set the maximum number of lines Atuin'\''s interface should take up]:INLINE_HEIGHT: ' \
'-i[Open interactive search UI]' \
'--interactive[Open interactive search UI]' \
'--shell-up-key-binding[Marker argument used to inform atuin that it was invoked from a shell up-key binding (hidden from help to avoid confusion)]' \
'--human[Use human-readable formatting for time]' \
'--cmd-only[Show only the text of the command]' \
'--delete[Delete anything matching this query. Will not print out the match]' \
'--delete-it-all[Delete EVERYTHING!]' \
'-r[Reverse the order of results, oldest first]' \
'--reverse[Reverse the order of results, oldest first]' \
'-h[Print help]' \
'--help[Print help]' \
'*::query:' \
&& ret=0
;;
(sync)
_arguments "${_arguments_options[@]}" \
'-f[Force re-download everything]' \
'--force[Force re-download everything]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(login)
_arguments "${_arguments_options[@]}" \
'-u+[]:USERNAME: ' \
'--username=[]:USERNAME: ' \
'-p+[]:PASSWORD: ' \
'--password=[]:PASSWORD: ' \
'-k+[The encryption key for your account]:KEY: ' \
'--key=[The encryption key for your account]:KEY: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(logout)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(register)
_arguments "${_arguments_options[@]}" \
'-u+[]:USERNAME: ' \
'--username=[]:USERNAME: ' \
'-p+[]:PASSWORD: ' \
'--password=[]:PASSWORD: ' \
'-e+[]:EMAIL: ' \
'--email=[]:EMAIL: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(key)
_arguments "${_arguments_options[@]}" \
'--base64[Switch to base64 output of the key]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(status)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(account)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
":: :_atuin__account_commands" \
"*::: :->account" \
&& ret=0

    case $state in
    (account)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-account-command-$line[1]:"
        case $line[1] in
            (login)
_arguments "${_arguments_options[@]}" \
'-u+[]:USERNAME: ' \
'--username=[]:USERNAME: ' \
'-p+[]:PASSWORD: ' \
'--password=[]:PASSWORD: ' \
'-k+[The encryption key for your account]:KEY: ' \
'--key=[The encryption key for your account]:KEY: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(register)
_arguments "${_arguments_options[@]}" \
'-u+[]:USERNAME: ' \
'--username=[]:USERNAME: ' \
'-p+[]:PASSWORD: ' \
'--password=[]:PASSWORD: ' \
'-e+[]:EMAIL: ' \
'--email=[]:EMAIL: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(logout)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_atuin__account__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-account-help-command-$line[1]:"
        case $line[1] in
            (login)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(register)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(logout)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(kv)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
":: :_atuin__kv_commands" \
"*::: :->kv" \
&& ret=0

    case $state in
    (kv)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-kv-command-$line[1]:"
        case $line[1] in
            (set)
_arguments "${_arguments_options[@]}" \
'-k+[]:KEY: ' \
'--key=[]:KEY: ' \
'-n+[]:NAMESPACE: ' \
'--namespace=[]:NAMESPACE: ' \
'-h[Print help]' \
'--help[Print help]' \
':value:' \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" \
'-n+[]:NAMESPACE: ' \
'--namespace=[]:NAMESPACE: ' \
'-h[Print help]' \
'--help[Print help]' \
':key:' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
'-n+[]:NAMESPACE: ' \
'--namespace=[]:NAMESPACE: ' \
'-a[]' \
'--all-namespaces[]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_atuin__kv__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-kv-help-command-$line[1]:"
        case $line[1] in
            (set)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(default-config)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(server)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
":: :_atuin__server_commands" \
"*::: :->server" \
&& ret=0

    case $state in
    (server)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-server-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" \
'--host=[The host address to bind]:HOST: ' \
'-p+[The port to bind]:PORT: ' \
'--port=[The port to bind]:PORT: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(default-config)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_atuin__server__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-server-help-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(default-config)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(init)
_arguments "${_arguments_options[@]}" \
'--disable-ctrl-r[Disable the binding of CTRL-R to atuin]' \
'--disable-up-arrow[Disable the binding of the Up Arrow key to atuin]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':shell:((zsh\:"Zsh setup"
bash\:"Bash setup"
fish\:"Fish setup"
nu\:"Nu setup"))' \
&& ret=0
;;
(uuid)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(contributors)
_arguments "${_arguments_options[@]}" \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(gen-completions)
_arguments "${_arguments_options[@]}" \
'-s+[Set the shell for generating completions]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[Set the shell for generating completions]:SHELL:(bash elvish fish powershell zsh)' \
'-o+[Set the output directory]:OUT_DIR: ' \
'--out-dir=[Set the output directory]:OUT_DIR: ' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_atuin__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-help-command-$line[1]:"
        case $line[1] in
            (history)
_arguments "${_arguments_options[@]}" \
":: :_atuin__help__history_commands" \
"*::: :->history" \
&& ret=0

    case $state in
    (history)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-help-history-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(end)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(last)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(import)
_arguments "${_arguments_options[@]}" \
":: :_atuin__help__import_commands" \
"*::: :->import" \
&& ret=0

    case $state in
    (import)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-help-import-command-$line[1]:"
        case $line[1] in
            (auto)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(zsh)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(zsh-hist-db)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(bash)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(resh)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(fish)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(nu)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(nu-hist-db)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(stats)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(search)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(sync)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(login)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(logout)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(register)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(key)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(status)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(account)
_arguments "${_arguments_options[@]}" \
":: :_atuin__help__account_commands" \
"*::: :->account" \
&& ret=0

    case $state in
    (account)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-help-account-command-$line[1]:"
        case $line[1] in
            (login)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(register)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(logout)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(kv)
_arguments "${_arguments_options[@]}" \
":: :_atuin__help__kv_commands" \
"*::: :->kv" \
&& ret=0

    case $state in
    (kv)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-help-kv-command-$line[1]:"
        case $line[1] in
            (set)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(default-config)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(server)
_arguments "${_arguments_options[@]}" \
":: :_atuin__help__server_commands" \
"*::: :->server" \
&& ret=0

    case $state in
    (server)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:atuin-help-server-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(default-config)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(init)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(uuid)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(contributors)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(gen-completions)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_atuin_commands] )) ||
_atuin_commands() {
    local commands; commands=(
'history:Manipulate shell history' \
'import:Import shell history from file' \
'stats:Calculate statistics for your history' \
'search:Interactive history search' \
'sync:Sync with the configured server' \
'login:Login to the configured server' \
'logout:Log out' \
'register:Register with the configured server' \
'key:Print the encryption key for transfer to another machine' \
'status:' \
'account:' \
'kv:' \
'default-config:Print example configuration' \
'server:Start an atuin server' \
'init:Output shell setup' \
'uuid:Generate a UUID' \
'contributors:' \
'gen-completions:Generate shell completions' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin commands' commands "$@"
}
(( $+functions[_atuin__account_commands] )) ||
_atuin__account_commands() {
    local commands; commands=(
'login:Login to the configured server' \
'register:' \
'logout:Log out' \
'delete:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin account commands' commands "$@"
}
(( $+functions[_atuin__help__account_commands] )) ||
_atuin__help__account_commands() {
    local commands; commands=(
'login:Login to the configured server' \
'register:' \
'logout:Log out' \
'delete:' \
    )
    _describe -t commands 'atuin help account commands' commands "$@"
}
(( $+functions[_atuin__help__import__auto_commands] )) ||
_atuin__help__import__auto_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help import auto commands' commands "$@"
}
(( $+functions[_atuin__import__auto_commands] )) ||
_atuin__import__auto_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import auto commands' commands "$@"
}
(( $+functions[_atuin__import__help__auto_commands] )) ||
_atuin__import__help__auto_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help auto commands' commands "$@"
}
(( $+functions[_atuin__help__import__bash_commands] )) ||
_atuin__help__import__bash_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help import bash commands' commands "$@"
}
(( $+functions[_atuin__import__bash_commands] )) ||
_atuin__import__bash_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import bash commands' commands "$@"
}
(( $+functions[_atuin__import__help__bash_commands] )) ||
_atuin__import__help__bash_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help bash commands' commands "$@"
}
(( $+functions[_atuin__contributors_commands] )) ||
_atuin__contributors_commands() {
    local commands; commands=()
    _describe -t commands 'atuin contributors commands' commands "$@"
}
(( $+functions[_atuin__help__contributors_commands] )) ||
_atuin__help__contributors_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help contributors commands' commands "$@"
}
(( $+functions[_atuin__default-config_commands] )) ||
_atuin__default-config_commands() {
    local commands; commands=()
    _describe -t commands 'atuin default-config commands' commands "$@"
}
(( $+functions[_atuin__help__default-config_commands] )) ||
_atuin__help__default-config_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help default-config commands' commands "$@"
}
(( $+functions[_atuin__help__server__default-config_commands] )) ||
_atuin__help__server__default-config_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help server default-config commands' commands "$@"
}
(( $+functions[_atuin__server__default-config_commands] )) ||
_atuin__server__default-config_commands() {
    local commands; commands=()
    _describe -t commands 'atuin server default-config commands' commands "$@"
}
(( $+functions[_atuin__server__help__default-config_commands] )) ||
_atuin__server__help__default-config_commands() {
    local commands; commands=()
    _describe -t commands 'atuin server help default-config commands' commands "$@"
}
(( $+functions[_atuin__account__delete_commands] )) ||
_atuin__account__delete_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account delete commands' commands "$@"
}
(( $+functions[_atuin__account__help__delete_commands] )) ||
_atuin__account__help__delete_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account help delete commands' commands "$@"
}
(( $+functions[_atuin__help__account__delete_commands] )) ||
_atuin__help__account__delete_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help account delete commands' commands "$@"
}
(( $+functions[_atuin__help__history__end_commands] )) ||
_atuin__help__history__end_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help history end commands' commands "$@"
}
(( $+functions[_atuin__history__end_commands] )) ||
_atuin__history__end_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history end commands' commands "$@"
}
(( $+functions[_atuin__history__help__end_commands] )) ||
_atuin__history__help__end_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history help end commands' commands "$@"
}
(( $+functions[_atuin__help__import__fish_commands] )) ||
_atuin__help__import__fish_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help import fish commands' commands "$@"
}
(( $+functions[_atuin__import__fish_commands] )) ||
_atuin__import__fish_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import fish commands' commands "$@"
}
(( $+functions[_atuin__import__help__fish_commands] )) ||
_atuin__import__help__fish_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help fish commands' commands "$@"
}
(( $+functions[_atuin__gen-completions_commands] )) ||
_atuin__gen-completions_commands() {
    local commands; commands=()
    _describe -t commands 'atuin gen-completions commands' commands "$@"
}
(( $+functions[_atuin__help__gen-completions_commands] )) ||
_atuin__help__gen-completions_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help gen-completions commands' commands "$@"
}
(( $+functions[_atuin__help__kv__get_commands] )) ||
_atuin__help__kv__get_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help kv get commands' commands "$@"
}
(( $+functions[_atuin__kv__get_commands] )) ||
_atuin__kv__get_commands() {
    local commands; commands=()
    _describe -t commands 'atuin kv get commands' commands "$@"
}
(( $+functions[_atuin__kv__help__get_commands] )) ||
_atuin__kv__help__get_commands() {
    local commands; commands=()
    _describe -t commands 'atuin kv help get commands' commands "$@"
}
(( $+functions[_atuin__account__help_commands] )) ||
_atuin__account__help_commands() {
    local commands; commands=(
'login:Login to the configured server' \
'register:' \
'logout:Log out' \
'delete:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin account help commands' commands "$@"
}
(( $+functions[_atuin__account__help__help_commands] )) ||
_atuin__account__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account help help commands' commands "$@"
}
(( $+functions[_atuin__help_commands] )) ||
_atuin__help_commands() {
    local commands; commands=(
'history:Manipulate shell history' \
'import:Import shell history from file' \
'stats:Calculate statistics for your history' \
'search:Interactive history search' \
'sync:Sync with the configured server' \
'login:Login to the configured server' \
'logout:Log out' \
'register:Register with the configured server' \
'key:Print the encryption key for transfer to another machine' \
'status:' \
'account:' \
'kv:' \
'default-config:Print example configuration' \
'server:Start an atuin server' \
'init:Output shell setup' \
'uuid:Generate a UUID' \
'contributors:' \
'gen-completions:Generate shell completions' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin help commands' commands "$@"
}
(( $+functions[_atuin__help__help_commands] )) ||
_atuin__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help help commands' commands "$@"
}
(( $+functions[_atuin__history__help_commands] )) ||
_atuin__history__help_commands() {
    local commands; commands=(
'start:Begins a new command in the history' \
'end:Finishes a new command in the history (adds time, exit code)' \
'list:List all items in history' \
'last:Get the last command ran' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin history help commands' commands "$@"
}
(( $+functions[_atuin__history__help__help_commands] )) ||
_atuin__history__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history help help commands' commands "$@"
}
(( $+functions[_atuin__import__help_commands] )) ||
_atuin__import__help_commands() {
    local commands; commands=(
'auto:Import history for the current shell' \
'zsh:Import history from the zsh history file' \
'zsh-hist-db:Import history from the zsh history file' \
'bash:Import history from the bash history file' \
'resh:Import history from the resh history file' \
'fish:Import history from the fish history file' \
'nu:Import history from the nu history file' \
'nu-hist-db:Import history from the nu history file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin import help commands' commands "$@"
}
(( $+functions[_atuin__import__help__help_commands] )) ||
_atuin__import__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help help commands' commands "$@"
}
(( $+functions[_atuin__kv__help_commands] )) ||
_atuin__kv__help_commands() {
    local commands; commands=(
'set:' \
'get:' \
'list:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin kv help commands' commands "$@"
}
(( $+functions[_atuin__kv__help__help_commands] )) ||
_atuin__kv__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'atuin kv help help commands' commands "$@"
}
(( $+functions[_atuin__server__help_commands] )) ||
_atuin__server__help_commands() {
    local commands; commands=(
'start:Start the server' \
'default-config:Print server example configuration' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin server help commands' commands "$@"
}
(( $+functions[_atuin__server__help__help_commands] )) ||
_atuin__server__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'atuin server help help commands' commands "$@"
}
(( $+functions[_atuin__help__history_commands] )) ||
_atuin__help__history_commands() {
    local commands; commands=(
'start:Begins a new command in the history' \
'end:Finishes a new command in the history (adds time, exit code)' \
'list:List all items in history' \
'last:Get the last command ran' \
    )
    _describe -t commands 'atuin help history commands' commands "$@"
}
(( $+functions[_atuin__history_commands] )) ||
_atuin__history_commands() {
    local commands; commands=(
'start:Begins a new command in the history' \
'end:Finishes a new command in the history (adds time, exit code)' \
'list:List all items in history' \
'last:Get the last command ran' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin history commands' commands "$@"
}
(( $+functions[_atuin__help__import_commands] )) ||
_atuin__help__import_commands() {
    local commands; commands=(
'auto:Import history for the current shell' \
'zsh:Import history from the zsh history file' \
'zsh-hist-db:Import history from the zsh history file' \
'bash:Import history from the bash history file' \
'resh:Import history from the resh history file' \
'fish:Import history from the fish history file' \
'nu:Import history from the nu history file' \
'nu-hist-db:Import history from the nu history file' \
    )
    _describe -t commands 'atuin help import commands' commands "$@"
}
(( $+functions[_atuin__import_commands] )) ||
_atuin__import_commands() {
    local commands; commands=(
'auto:Import history for the current shell' \
'zsh:Import history from the zsh history file' \
'zsh-hist-db:Import history from the zsh history file' \
'bash:Import history from the bash history file' \
'resh:Import history from the resh history file' \
'fish:Import history from the fish history file' \
'nu:Import history from the nu history file' \
'nu-hist-db:Import history from the nu history file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin import commands' commands "$@"
}
(( $+functions[_atuin__help__init_commands] )) ||
_atuin__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help init commands' commands "$@"
}
(( $+functions[_atuin__init_commands] )) ||
_atuin__init_commands() {
    local commands; commands=()
    _describe -t commands 'atuin init commands' commands "$@"
}
(( $+functions[_atuin__help__key_commands] )) ||
_atuin__help__key_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help key commands' commands "$@"
}
(( $+functions[_atuin__key_commands] )) ||
_atuin__key_commands() {
    local commands; commands=()
    _describe -t commands 'atuin key commands' commands "$@"
}
(( $+functions[_atuin__help__kv_commands] )) ||
_atuin__help__kv_commands() {
    local commands; commands=(
'set:' \
'get:' \
'list:' \
    )
    _describe -t commands 'atuin help kv commands' commands "$@"
}
(( $+functions[_atuin__kv_commands] )) ||
_atuin__kv_commands() {
    local commands; commands=(
'set:' \
'get:' \
'list:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin kv commands' commands "$@"
}
(( $+functions[_atuin__help__history__last_commands] )) ||
_atuin__help__history__last_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help history last commands' commands "$@"
}
(( $+functions[_atuin__history__help__last_commands] )) ||
_atuin__history__help__last_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history help last commands' commands "$@"
}
(( $+functions[_atuin__history__last_commands] )) ||
_atuin__history__last_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history last commands' commands "$@"
}
(( $+functions[_atuin__help__history__list_commands] )) ||
_atuin__help__history__list_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help history list commands' commands "$@"
}
(( $+functions[_atuin__help__kv__list_commands] )) ||
_atuin__help__kv__list_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help kv list commands' commands "$@"
}
(( $+functions[_atuin__history__help__list_commands] )) ||
_atuin__history__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history help list commands' commands "$@"
}
(( $+functions[_atuin__history__list_commands] )) ||
_atuin__history__list_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history list commands' commands "$@"
}
(( $+functions[_atuin__kv__help__list_commands] )) ||
_atuin__kv__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'atuin kv help list commands' commands "$@"
}
(( $+functions[_atuin__kv__list_commands] )) ||
_atuin__kv__list_commands() {
    local commands; commands=()
    _describe -t commands 'atuin kv list commands' commands "$@"
}
(( $+functions[_atuin__account__help__login_commands] )) ||
_atuin__account__help__login_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account help login commands' commands "$@"
}
(( $+functions[_atuin__account__login_commands] )) ||
_atuin__account__login_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account login commands' commands "$@"
}
(( $+functions[_atuin__help__account__login_commands] )) ||
_atuin__help__account__login_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help account login commands' commands "$@"
}
(( $+functions[_atuin__help__login_commands] )) ||
_atuin__help__login_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help login commands' commands "$@"
}
(( $+functions[_atuin__login_commands] )) ||
_atuin__login_commands() {
    local commands; commands=()
    _describe -t commands 'atuin login commands' commands "$@"
}
(( $+functions[_atuin__account__help__logout_commands] )) ||
_atuin__account__help__logout_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account help logout commands' commands "$@"
}
(( $+functions[_atuin__account__logout_commands] )) ||
_atuin__account__logout_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account logout commands' commands "$@"
}
(( $+functions[_atuin__help__account__logout_commands] )) ||
_atuin__help__account__logout_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help account logout commands' commands "$@"
}
(( $+functions[_atuin__help__logout_commands] )) ||
_atuin__help__logout_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help logout commands' commands "$@"
}
(( $+functions[_atuin__logout_commands] )) ||
_atuin__logout_commands() {
    local commands; commands=()
    _describe -t commands 'atuin logout commands' commands "$@"
}
(( $+functions[_atuin__help__import__nu_commands] )) ||
_atuin__help__import__nu_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help import nu commands' commands "$@"
}
(( $+functions[_atuin__import__help__nu_commands] )) ||
_atuin__import__help__nu_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help nu commands' commands "$@"
}
(( $+functions[_atuin__import__nu_commands] )) ||
_atuin__import__nu_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import nu commands' commands "$@"
}
(( $+functions[_atuin__help__import__nu-hist-db_commands] )) ||
_atuin__help__import__nu-hist-db_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help import nu-hist-db commands' commands "$@"
}
(( $+functions[_atuin__import__help__nu-hist-db_commands] )) ||
_atuin__import__help__nu-hist-db_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help nu-hist-db commands' commands "$@"
}
(( $+functions[_atuin__import__nu-hist-db_commands] )) ||
_atuin__import__nu-hist-db_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import nu-hist-db commands' commands "$@"
}
(( $+functions[_atuin__account__help__register_commands] )) ||
_atuin__account__help__register_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account help register commands' commands "$@"
}
(( $+functions[_atuin__account__register_commands] )) ||
_atuin__account__register_commands() {
    local commands; commands=()
    _describe -t commands 'atuin account register commands' commands "$@"
}
(( $+functions[_atuin__help__account__register_commands] )) ||
_atuin__help__account__register_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help account register commands' commands "$@"
}
(( $+functions[_atuin__help__register_commands] )) ||
_atuin__help__register_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help register commands' commands "$@"
}
(( $+functions[_atuin__register_commands] )) ||
_atuin__register_commands() {
    local commands; commands=()
    _describe -t commands 'atuin register commands' commands "$@"
}
(( $+functions[_atuin__help__import__resh_commands] )) ||
_atuin__help__import__resh_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help import resh commands' commands "$@"
}
(( $+functions[_atuin__import__help__resh_commands] )) ||
_atuin__import__help__resh_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help resh commands' commands "$@"
}
(( $+functions[_atuin__import__resh_commands] )) ||
_atuin__import__resh_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import resh commands' commands "$@"
}
(( $+functions[_atuin__help__search_commands] )) ||
_atuin__help__search_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help search commands' commands "$@"
}
(( $+functions[_atuin__search_commands] )) ||
_atuin__search_commands() {
    local commands; commands=()
    _describe -t commands 'atuin search commands' commands "$@"
}
(( $+functions[_atuin__help__server_commands] )) ||
_atuin__help__server_commands() {
    local commands; commands=(
'start:Start the server' \
'default-config:Print server example configuration' \
    )
    _describe -t commands 'atuin help server commands' commands "$@"
}
(( $+functions[_atuin__server_commands] )) ||
_atuin__server_commands() {
    local commands; commands=(
'start:Start the server' \
'default-config:Print server example configuration' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'atuin server commands' commands "$@"
}
(( $+functions[_atuin__help__kv__set_commands] )) ||
_atuin__help__kv__set_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help kv set commands' commands "$@"
}
(( $+functions[_atuin__kv__help__set_commands] )) ||
_atuin__kv__help__set_commands() {
    local commands; commands=()
    _describe -t commands 'atuin kv help set commands' commands "$@"
}
(( $+functions[_atuin__kv__set_commands] )) ||
_atuin__kv__set_commands() {
    local commands; commands=()
    _describe -t commands 'atuin kv set commands' commands "$@"
}
(( $+functions[_atuin__help__history__start_commands] )) ||
_atuin__help__history__start_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help history start commands' commands "$@"
}
(( $+functions[_atuin__help__server__start_commands] )) ||
_atuin__help__server__start_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help server start commands' commands "$@"
}
(( $+functions[_atuin__history__help__start_commands] )) ||
_atuin__history__help__start_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history help start commands' commands "$@"
}
(( $+functions[_atuin__history__start_commands] )) ||
_atuin__history__start_commands() {
    local commands; commands=()
    _describe -t commands 'atuin history start commands' commands "$@"
}
(( $+functions[_atuin__server__help__start_commands] )) ||
_atuin__server__help__start_commands() {
    local commands; commands=()
    _describe -t commands 'atuin server help start commands' commands "$@"
}
(( $+functions[_atuin__server__start_commands] )) ||
_atuin__server__start_commands() {
    local commands; commands=()
    _describe -t commands 'atuin server start commands' commands "$@"
}
(( $+functions[_atuin__help__stats_commands] )) ||
_atuin__help__stats_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help stats commands' commands "$@"
}
(( $+functions[_atuin__stats_commands] )) ||
_atuin__stats_commands() {
    local commands; commands=()
    _describe -t commands 'atuin stats commands' commands "$@"
}
(( $+functions[_atuin__help__status_commands] )) ||
_atuin__help__status_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help status commands' commands "$@"
}
(( $+functions[_atuin__status_commands] )) ||
_atuin__status_commands() {
    local commands; commands=()
    _describe -t commands 'atuin status commands' commands "$@"
}
(( $+functions[_atuin__help__sync_commands] )) ||
_atuin__help__sync_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help sync commands' commands "$@"
}
(( $+functions[_atuin__sync_commands] )) ||
_atuin__sync_commands() {
    local commands; commands=()
    _describe -t commands 'atuin sync commands' commands "$@"
}
(( $+functions[_atuin__help__uuid_commands] )) ||
_atuin__help__uuid_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help uuid commands' commands "$@"
}
(( $+functions[_atuin__uuid_commands] )) ||
_atuin__uuid_commands() {
    local commands; commands=()
    _describe -t commands 'atuin uuid commands' commands "$@"
}
(( $+functions[_atuin__help__import__zsh_commands] )) ||
_atuin__help__import__zsh_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help import zsh commands' commands "$@"
}
(( $+functions[_atuin__import__help__zsh_commands] )) ||
_atuin__import__help__zsh_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help zsh commands' commands "$@"
}
(( $+functions[_atuin__import__zsh_commands] )) ||
_atuin__import__zsh_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import zsh commands' commands "$@"
}
(( $+functions[_atuin__help__import__zsh-hist-db_commands] )) ||
_atuin__help__import__zsh-hist-db_commands() {
    local commands; commands=()
    _describe -t commands 'atuin help import zsh-hist-db commands' commands "$@"
}
(( $+functions[_atuin__import__help__zsh-hist-db_commands] )) ||
_atuin__import__help__zsh-hist-db_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import help zsh-hist-db commands' commands "$@"
}
(( $+functions[_atuin__import__zsh-hist-db_commands] )) ||
_atuin__import__zsh-hist-db_commands() {
    local commands; commands=()
    _describe -t commands 'atuin import zsh-hist-db commands' commands "$@"
}

if [ "$funcstack[1]" = "_atuin" ]; then
    _atuin "$@"
else
    compdef _atuin atuin
fi
#compdef headscale
compdef _headscale headscale

# zsh completion for headscale                            -*- shell-script -*-

__headscale_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_headscale()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16
    local shellCompDirectiveKeepOrder=32

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
    local -a completions

    __headscale_debug "\n========= starting completion logic =========="
    __headscale_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __headscale_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __headscale_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., headscale -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __headscale_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __headscale_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __headscale_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __headscale_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __headscale_debug "No directive found.  Setting do default"
        directive=0
    fi

    __headscale_debug "directive: ${directive}"
    __headscale_debug "completions: ${out}"
    __headscale_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __headscale_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __headscale_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __headscale_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __headscale_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __headscale_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __headscale_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
        __headscale_debug "Activating keep order."
        keepOrder="-V"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __headscale_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __headscale_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __headscale_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __headscale_debug "Calling _describe"
        if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
            __headscale_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __headscale_debug "_describe did not find completions."
            __headscale_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __headscale_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __headscale_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_headscale" ]; then
    _headscale
fi
