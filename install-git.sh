#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_git() {
	echo '........installing git'

	brew install \
		git \
		tig

}

configure_git() {
	echo '........configuring git for ${GIT_USER_NAME}'

	git config --global user.name ${GIT_USER_NAME}
	git config --global user.email ${GIT_USER_EMAIL}

	git config --global core.editor ${GIT_EDITOR}
	git config --global core.autocrlf input
	git config --global core.pager 'less -iXFR'

	git config --global apply.whitespace fix

	#git config --global credential.helper osxkeychain

	# configure netrc
	mkdir -p $HOME/.config/git/bin/
	echo "retrieve the git-credential-netrc from github"
	curl -o $HOME/.config/git/bin/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl
	chmod +x $HOME/.config/git/bin/git-credential-netrc

	echo '
	export PATH=$HOME/.config/git/bin:$PATH
	' >> $HOME/.zshrc

	git config --global credential.helper 'netrc -f ~/.netrc.gpg -v'

	# configure git to use gpg
	git config --global commit.gpgsign true
	git config --global gpg.program $(which gpg)
	git config --global user.signingkey $(gpg --list-keys --keyid-format=long | grep "pub " | cut -d" " -f4 | cut -d"/" -f2 | cut -d" " -f1)

}

add_git_aliases() {

	echo '........adding git aliases'

	mkdir -p ${HOME}/.config/git/
	curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/git/.gitconfig_alias -o ${HOME}/.config/git/gitconfig_alias

	if [ -f $HOME/.config/git/.gitconfig_alias ]; then
		git config --global include.path $HOME/.config/git/.gitconfig_alias
	fi

	# git config --global alias.co 'checkout'
    # # git config --global alias.- 'checkout -'
    # git config --global alias.add 'add -a'
    # git config --global alias.ca 'commit -a'
    # git config --global alias.cam 'commit -am'
    # git config --global alias.cm 'commit -m'
    # git config --global alias.st 'status -s'
    # git config --global alias.difc 'diff --color-words'
    # # git config --global alias...main 'log main..HEAD'
    # # git config --global alias.main.. 'log HEAD..main'
    # # git config --global alias...master 'log master..HEAD'
    # # git config --global alias.master.. 'log HEAD..master'
}


#############################################
## Run
#############################################
if [ -f .env ]; then
	source .env
fi

brew_git
configure_git
add_git_aliases