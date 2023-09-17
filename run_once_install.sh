#!/bin/bash

function installHomebrew() {

    echo "==================================="
    echo "Installing homebrew"
    echo "==================================="
    echo "                                   "

    # Check for Homebrew and install if we don't have it
    if test ! "$(which brew)"; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        echo "eval $(/opt/homebrew/bin/brew shellenv)" >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        brew upgrade
    fi
}

function installHomebrewPackages() {

    echo "=================================="
    echo "Installing homebrew packages:"
    echo "=================================="
    brew bundle install "$HOME/.config/dotfiles/Brewfile"

    brew update
}

function setupFishShell() {

    echo "==================================="
    echo "Setup Fish Shell"
    echo "==================================="
    echo "                                   "

    # add fish to the list of installed shells
    echo $(which fish) | sudo tee -a /etc/shells

    # make fish the default shell
    chsh -s $(which fish)
}

function setBetterMacDefaults() {

    echo "==================================="
    echo "Set better MacOS defaults"
    echo "==================================="
    echo "                                   "

    source ~/.config/dotfiles/scripts/config-macos.sh
}

installHomebrew
installHomebrewPackages
setupFishShell
setBetterMacDefaults
