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

# install tmp pluginx using CMD + b + SHIFT + i
```

## Brew daily commands

- Install the latest stable version of a formula or cask (use `--devel` for development versions):

```sh
brew install formula
```

- List all installed formulae and casks:

```sh
brew list
```

- Upgrade an installed formula or cask (if none is given, all installed formulae/casks are upgraded):

```sh
brew upgrade formula
```

- Fetch the newest version of Homebrew and of all formulae and casks from the Homebrew source repository:

```sh
brew update
```

- Show formulae and casks that have a more recent version available:

```sh
brew outdated
```

- Search for available formulae (i.e. packages) and casks (i.e. native packages):

```sh
brew search text
```

- Display information about a formula or a cask (version, installation path, dependencies, etc.):

```sh
brew info formula
```

- Check the local Homebrew installation for potential problems:

```sh
brew doctor
```

- Dump all currently installed packages into a `BrewFile`

```sh
cd && brew bundle dump
```

- Add/remove a tap

```sh
# install package from a specific tap
brew tap nvie/tap
brew install nvie/tap/git-toolbelt

# remove tap
brew untap nvie/tap
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
# then do git commits as usual to update local config with remote
chezmoi cd

# go back to previous folder (before `chezmoi cd`)
exit

# on a new system sync config files with github repo
chezmoi update
```
