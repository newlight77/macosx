#!/bin/bash

if [ $(which brew) != 'brew not found'];then
    return
fi

echo '........ installing brew ........'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> ~/.zshrc
eval "$($(brew --prefix)/bin/brew shellenv)"

brew update
