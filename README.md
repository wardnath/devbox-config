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

* aider-chat
* chatblade
* whisper-ctranslate2
* github:wardnath/code2prompt
* open-interpreter
* openai-whisper
* openai-whispercpp
* github:nixified-ai/flake#textgen-nvidia

#### bookmarked

* k8sgpt
* pentestgpt
* private-gpt
* tgpt
* shell-gpt
* 

## Notable
* github:flox/flox
* github:astro/microvm.nix
* github:nix-community/nix-direnv

## Flake templates

* nix flake init --template github:tweag/jupyenv
* github:fluidattacks/make

## WIP

* litellm
* gpt-engineer


