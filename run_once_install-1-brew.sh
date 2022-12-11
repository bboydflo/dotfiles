#!/bin/bash

function installHomebrew() {

    echo "==================================="
    echo "Installing homebrew"
    echo "==================================="
    echo "                                   "

    which -s brew > /dev/null
    if [[ $? -eq 1 ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        brew upgrade
    fi
}

function installHomebrewPackages() {

    echo "=================================="
    echo "Installing homebrew packages:"
    echo "=================================="
    brew bundle install ~/Brewfile

    brew update
}

function setupFishShell() {

    echo "==================================="
    echo "Setup Fish Shell"
    echo "==================================="
    echo "                                   "

    goHome

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
