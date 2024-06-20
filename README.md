README


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


# none, min, low, high
devbox global pull https://devbox.getfleek.dev/none

devbox global pull https://github.com/wardnath/devbox-config.git
```

### cli devcontainer reset and run 

```bash
devcontainer up --workspace-folder . --remove-existing-container && wait 2 && devcontainer exec --workspace-folder . bash
```


