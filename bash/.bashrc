export PATH="$PATH:/opt/homebrew/bin:/root/local/bin:/usr/bin:/usr/sbin:/usr/local/bin"
eval "$(/usr/local/bin/brew shellenv)"



# Machine-local overrides (survives devbox global pull)
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

echo "Running .bashrc Scripts... Complete"
