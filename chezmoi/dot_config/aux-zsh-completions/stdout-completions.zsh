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
