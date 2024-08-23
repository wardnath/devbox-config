echo "initializing devbox global init.sh"
shell=`ps -p $$ | awk 'NR>1  {print $4}' | sed 's/-//g'`
SCRIPT_PATH="$HOME/.local/share/devbox/global/current"

case $(basename $shell) in
     "zsh" )
            . $DEVBOX_GLOBAL_ROOT/zsh/.zshrc
           ;;
     "bash" )
            . $DEVBOX_GLOBAL_ROOT/bash/.bashrc
           ;;
     * )
           ;;
esac

# Common Aliases and ENV_VARS - shared across ZSH and BASH

export PATH="$PATH:$HOME/.local/bin"

alias lah='eza -lah'

# devbox helpers
alias dbr='devbox run'
alias dbgr='devbox global run'
alias dbcd='cd $DEVBOX_GLOBAL_ROOT'
alias dbgs='devbox global services'

echo "init.sh complete"
