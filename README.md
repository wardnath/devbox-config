# README


```bash


curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix > nix-installer.sh

chmod +x nix-installer.sh

./nix-installer.sh install --no-confirm 


echo "experimental-features = nix-command flakes configurable-impure-env auto-allocate-uids" |  tee -a /etc/nix/nix.conf

. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

curl -fsSL https://get.jetpack.io/devbox | bash

# non-interactive curl -fsSL https://get.jetpack.io/devbox | bash -s -- -f

# assuming you want to install in z shell
 echo 'eval "$(devbox global shellenv --init-hook)"' >> ~/.zshrc
 echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc


# none, min, low, high
devbox global pull https://devbox.getfleek.dev/none

devbox global pull https://github.com/wardnath/devbox-config.git
```

## cli devcontainer reset and run 

```bash
git pull && devcontainer up --workspace-folder . --remove-existing-container && sleep 2 && devcontainer exec --workspace-folder . zsh
```

## Secrets etc

Most of the config here aims to be generally applicable. The secrets in the dotconfig are managed by chezmoi ejson https://www.chezmoi.io/user-guide/password-managers/ejson/

# Notable nixpkgs and flakes not currently used

## CLI

* sherlock
* openapi-tui
* wallabag

### AI

* whisper-ctranslate2
* github:wardnath/code2prompt
* openai-whisper
* openai-whispercpp
* github:nixified-ai/flake#textgen-nvidia

#### bookmarked

* k8sgpt
* pentestgpt
* 

## Notable
* github:flox/flox
* github:astro/microvm.nix
* github:nix-community/nix-direnv
* MikaelFangel/nixvim-config

## Flake templates

* nix flake init --template github:tweag/jupyenv
* github:fluidattacks/make

## WIP

* litellm
* 

# Older config patterns

## Inshellisense
append to end of the ./zsh/.zshrc
```bash
# InShellisense activation using precmd hook
# This ensures it runs after the environment is fully established
function _activate_inshellisense() {
   # Only run once
   if [[ -z $_INSHELLISENSE_INITIALIZED ]]; then
     # Debug what's happening
     echo "Activating InShellisense via precmd hook..."

     # Use the actual command that works when you type it manually
     is

     # Mark as initialized to prevent running again
     export _INSHELLISENSE_INITIALIZED=1
   fi
 }

 # Add our function to the precmd hooks array
 autoload -Uz add-zsh-hook
 add-zsh-hook precmd _activate_inshellisense
```

