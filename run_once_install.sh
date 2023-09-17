#!/bin/bash

function installHomebrew() {

    echo "==================================="
    echo "Installing homebrew"
    echo "==================================="
    echo "                                   "

    # Check for Homebrew and install if we don't have it
    if test ! "$(which brew)"; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        eval "$(/opt/homebrew/bin/brew shellenv)"
        brew upgrade
    fi
}

function installHomebrewPackages() {

    echo "=================================="
    echo "Installing homebrew packages:"
    echo "=================================="
    brew bundle install --file "$HOME/.config/dotfiles/Brewfile"

    brew update
}

function setupFishShell() {

    echo "==================================="
    echo "Setup Fish Shell"
    echo "==================================="
    echo "                                   "

    fish_path=$(which fish)

    # checks if fish is already added to the list of installed shells
    if test ! "grep -R $fish_path /etc/shells"; then
        # add fish to the list of installed shells
        echo "$fish_path" | sudo tee -a /etc/shells
    fi

    # make fish the default shell
    chsh -s "$fish_path"
}

function setBetterMacDefaults() {

    echo "==================================="
    echo "Set better MacOS defaults"
    echo "==================================="
    echo "                                   "

    source ~/.config/dotfiles/scripts/config-macos.sh
}

function prepareForDevelopment() {

    echo "==================================="
    echo "Prepare for development"
    echo "==================================="
    echo "                                   "

    echo "create ~/development folder"
    mkdir "$HOME"/development
}

installHomebrew
installHomebrewPackages
setupFishShell
setBetterMacDefaults
prepareForDevelopment
