#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_vscode() {
	brew install visual-studio-code
}

brew_idea() {
	brew install --cask intellij-idea
}

brew_sqlectron() {
	brew install --cask sqlectron
}

brew_squirrelsql() {
	brew install --cask squirrelsql
}

brew_postman() {
	brew install --cask postman
}

#############################################
## Run
#############################################

brew_vscode
brew_idea
brew_sqlectron
brew_squirrelsql
brew_postman