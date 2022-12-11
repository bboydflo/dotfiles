#!/bin/sh

function installHomebrew() {

    echo "==================================="
    echo "Installing homebrew"
    echo "==================================="
    echo "                                   "

    cd ~/

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
    brew bundle install

    brew update
}

installHomebrew
