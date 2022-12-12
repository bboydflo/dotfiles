# Getting started with chezmoi

On a new system start by installing `xcode-tools` and `chezmoi`

```sh
xcode-select --install

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
```

## Sync dotfiles using chezmoi on a new system

```sh
~/.local/bin/chezmoi init --apply bboydflo
```

Restart terminal, open Alacritty and continue the process

```sh
# show fisher commands
fisher
# install plugins
fisher update

# configure tide should start imediately
# tide configure

# open tmux using tat
tat
```

## Daily commands

```sh
# adds $FILE from your home directory to the source directory.
chezmoi add $FILE

# opens your editor with the file in the source directory that corresponds to $FILE.
chezmoi edit $FILE

# gives a quick summary of what files would change if you ran `chezmoi apply`
chezmoi status

# shows the changes that `chezmoi apply` would make to your home directory.
chezmoi diff

# updates your dotfiles from the source directory.
chezmoi apply

# opens a subshell in the source directory.
chezmoi cd
```
