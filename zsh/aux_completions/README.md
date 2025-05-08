# ZSH Completions

This directory contains completion files for zsh that will be automatically loaded on startup.

## Directory Structure

The zsh configuration loads completions from two locations:
1. `/workspaces/devbox-config/zsh/aux_completions/` - For workspace-specific completions
2. `~/.config/aux_completions/` - For user-specific completions 

## Usage

1. Place completion files in either directory
2. Files should follow the zsh completion naming convention: `_commandname`
3. Restart your shell or run `compinit` to load new completions

## Example

To add completions for a tool called `mytool`:

```bash
# Generate completion file for workspace
mytool completion zsh > /workspaces/devbox-config/zsh/aux_completions/_mytool

# Or for user configuration
mytool completion zsh > ~/.config/aux_completions/_mytool
```

## Nix Integration

For Nix-managed tools, you can directly copy the generated completions from their Nix store path:

```bash
# Example for a Nix-installed tool
cp $(nix-build --no-link -A mytool)/share/zsh/site-functions/_mytool ~/.config/aux_completions/
```
