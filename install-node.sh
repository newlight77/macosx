#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_node() {
	echo '........installing node'
	brew install \
		node \
		yarn \
		yarn-completion
}

brew_nvm() {
    echo '........installing nvm'
	brew install nvm
	mkdir ${HOME}/.nvm

	echo 'export NVM_DIR="${HOME}/.nvm"' >> ~/.zshrc

	echo '
# This loads nvm
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
	' >> ~/.zshrc

	echo '
# This loads nvm bash_completion
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
	' >> ~/.zshrc

}

#############################################
## Run
#############################################

brew_node
brew_nvm
