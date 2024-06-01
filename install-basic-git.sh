#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_git() {
	echo '........installing git'

	brew install \
		git \
		tig

	mkdir $HOME/.config/git/
	echo "retrieve the git-credential-netrc from github"
	curl -o $HOME/.config/git/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl
	chmod +x $HOME/.config/git/bin/git-credential-netrc

	echo '
	export PATH=$HOME/.config/git/bin:$PATH
	' >> $HOME/.zshrc

	git config --global credential.helper = netrc -f ~/.netrc.gpg -v
}

configure_git() {
	echo '........configuring git for ${GIT_USER_NAME}'

	git config --global core.editor ${GIT_EDITOR}
	git config --global user.name ${GIT_USER_NAME}
	git config --global user.email ${GIT_USER_EMAIL}

	git config --global credential.helper osxkeychain
}


#############################################
## Run
#############################################
if [ -f .env ]; then
	source .env
fi

brew_git
configure_git
