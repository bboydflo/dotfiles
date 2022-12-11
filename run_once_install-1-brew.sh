#!/bin/bash

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

function installAptPackages() {

    echo "==================================="
    echo "apt update - update list of available packages"
    echo "==================================="
    echo "                                   "
    apt update

    echo "==================================="
    echo "apt install - install packages"
    echo "==================================="
    echo "                                   "
    apt install tmux fzf # fish
    # install fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
}

# installHomebrew
