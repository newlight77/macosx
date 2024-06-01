#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_basic_tools() {
	echo '........installing basic tools'

	brew install \
		curl \
		jq \
		htop \
		ncdu \
		tmux \
		HTTPie \
		tree \
		wget

	brew tap alajmo/mani
	brew install mani
}

brew_dev_tools() {
	echo '........installing dev tools'

	brew install cmake

	brew install --cask \
		iterm2 \
		cheatsheet \
		chrome-devtools \
		postman
}


#############################################
## Run
#############################################

brew_basic_tools
brew_dev_tools
