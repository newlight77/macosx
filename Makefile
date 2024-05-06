#!make

include .env
export

SHELL = bash
#.SHELLFLAGS := -c
# .ONESHELL:

UNAME := $(shell uname -m)
BREW_HOME := $(shell brew --prefix)

$(info env: )
$(info BREW_HOME = ${BREW_HOME})
$(info UNAME = ${UNAME})
$(info MACHINE = $(shell uname -n))
$(info GIT_USER_NAME = ${GIT_USER_NAME})
$(info GIT_USER_EMAIL = ${GIT_USER_EMAIL})
$(info GIT_EDITOR = ${GIT_EDITOR})
$(info PASSPHRASE = ${PASSPHRASE})
$(info )

define install_brew
	echo '........installing homebrew for ${UNAME}'

	echo "pre-reqiuisite : homebrew installed"
	#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	#eval "$$(${BREW_HOME}/bin/brew shellenv)"

	echo 'eval "$$(${BREW_HOME}/bin/brew shellenv)"' >> ~/.zprofile

	brew update
endef

define brew_basic_tools
	echo '........installing basic tools'

	brew install \
		git \
		tig

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

endef

define brew_python 
	echo '........installing python'
	brew install \
		python \
		pipenv \
		pyenv 
	
	# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	# python get-pip.py --user
	# pip3 install --upgrade setuptools
	# pip3 install --upgrade pip
	# python3 -m pip install --upgrade setuptools
	# python3 -m pip install --upgrade pip
endef 

define brew_docker
	echo '........installing docker and minikube'
	brew install docker
	brew install --cask docker
	brew install minikube kind
endef

define brew_dev_tools
	echo '........installing dev tools'
	brew install --cask \
		iterm2 \
		cheatsheet \
		chrome-devtools \
		postman
endef

define brew_node
	echo '........installing node'
	brew install \
		node \
		yarn \
		yarn-completion
endef

define brew_nvm
	echo '........installing nvm'
	brew install nvm
	mkdir ${HOME}/.nvm

	echo 'export NVM_DIR="${HOME}/.nvm"' >> ~/.zprofile
	echo '[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm ' >> ~/.zprofile
	echo '[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion ' >> ~/.zprofile
 
endef

define brew_bash_completion
	echo '........installing bash-completion'
	brew install bash-completion
	echo '[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"' >> ~/.zprofile
endef

define brew_zsh
	echo '........installing zsh'
	brew install zsh
	chmod -R go-w ${BREW_HOME}/share/zsh

	curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
	curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

	brew install zsh-completions

	chmod -R go-w ${BREW_HOME}/share/zsh

	echo 'if type brew &>/dev/null; then ' >> ~/.zprofile 
	echo '	FPATH=$(brew --prefix)/share/zsh-completions:${FPATH} ' >> ~/.zprofile 
	echo '	FPATH=$(brew --prefix)/share/zsh-navigation-tools:${FPATH}  ' >> ~/.zprofile 
	echo '	FPATH=$(brew --prefix)/share/zsh/site-functions:${FPATH}  ' >> ~/.zprofile 
	echo '	FPATH=${HOME}/.oh-my-zsh/plugins/git:${FPATH}  ' >> ~/.zprofile 
	echo '	FPATH=${HOME}/.oh-my-zsh/lib/functions:${FPATH}  ' >> ~/.zprofile 
	echo '	FPATH=${HOME}/.oh-my-zsh/lib/completions:${FPATH}  ' >> ~/.zprofile 
	echo '	FPATH=${HOME}/.oh-my-zsh/cache/completions:${FPATH}  ' >> ~/.zprofile 
	echo '	FPATH=$(brew --prefix)/Cellar/zsh/5.9/share/zsh/functions:${FPATH}  ' >> ~/.zprofile 
	echo '	' >> ~/.zprofile 
	echo '	autoload -Uz compinit' >> ~/.zprofile 
	echo '	compinit' >> ~/.zprofile 
	echo 'fi' >> ~/.zprofile 

	brew install powerlevel10k
	echo 'source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zprofile

	brew install zsh-autosuggestions
	echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zprofile

	brew install zsh-history-substring-search
	echo 'source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zprofile

	brew install zsh-navigation-tools
	echo 'source $(brew --prefix)/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh' >> ~/.zprofile

	brew install zsh-syntax-highlighting
	echo 'export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$(brew --prefix)/share/zsh-syntax-highlighting/highlighters' >> ~/.zprofile

	echo 'export ZSH_ALIAS_FINDER_AUTOMATIC="true"' >> ~/.zprofile
	
	sed -i -e "s/plugins=(git)/plugins=(alias-finder brew common-aliases copypath copyfile docker docker-compose dotenv encode64 extract git jsontools node npm urltools vi-mode vscode web-search z)/g" ~/.zshrc
endef

define brew_oh_my_zsh
	echo '........installing oh-my-zsh'
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
endef

define configure_git
	echo '........configuring git for ${GIT_USER_NAME}'
	git config --global core.editor ${GIT_EDITOR}
	git config --global user.name ${GIT_USER_NAME}
	git config --global user.email ${GIT_USER_EMAIL}

	git config --global credential.helper osxkeychain
endef

define ssh_keygen
	# echo '........generating ssh key for ${GIT_USER_EMAIL} at ~/.ssh/id_rsa'
	# ssh-keygen -t rsa -b 4096 -C "${GIT_USER_EMAIL}" -P "${PASSPHRASE}" -f ~/.ssh/id_rsa 
	echo '........generating ssh key for ${GIT_USER_EMAIL} at ~/.ssh/id_rsa'
	ssh-keygen -t ed25519 -b 4096 -C "${GIT_USER_EMAIL}" -P "${PASSPHRASE}" -f ~/.ssh/id_ed25519 

	eval "$$(ssh-agent -k)"
	eval "$$(ssh-agent -s)"

	# ssh-add -K ~/.ssh/id_rsa
	# ssh-add -K ~/.ssh/id_ed25519

	echo '#!/bin/sh ' >> ./askpass.sh 
	echo 'echo "${PASSPHRASE}"'   >> ./askpass.sh 

	chmod 700 ./askpass.sh
	SSH_ASKPASS_REQUIRE=force SSH_ASKPASS="./askpass.sh" ssh-add ~/.ssh/id_ed25519
	rm -f ./askpass.sh
	
	# pbcopy < ~/.ssh/id_rsa.pub
	pbcopy < ~/.ssh/id_ed25519.pub

	echo ''
	echo '......... ACTION REQUIRED ...........'
	echo 'id_ed25519.pub is copied to your clipboard'
	echo 'Load your GitHub Settings page for adding an SSH key and paste the key from your clipboard'
endef

define configure_gpg
	echo '........configuring gpg for ${GIT_USER_NAME}'
	brew install gpg2 gnupg pinentry-mac 
	#brew tap jorgelbg/tap
	#brew install gpg2 gnupg pinentry-touchid # not working... :(

	export GPG_TTY=$(tty)
	echo 'export GPG_TTY="$$(tty)"' >> ~/.zprofile

	# This tells gpg to use the gpg-agent
	mkdir -p ~/.gnupg
	chmod 700 ~/.gnupg
	
    echo ' %echo Generating a basic OpenPGP key ' > gpg_options 
    echo ' Key-Type: DSA ' >> gpg_options 
    echo ' Key-Length: 4096 ' >> gpg_options 
    echo ' Subkey-Type: ELG-E ' >> gpg_options 
    echo ' Subkey-Length: 4096 ' >> gpg_options 
    echo ' Name-Real: ${GIT_USER_NAME} ' >> gpg_options 
    echo ' Name-Comment: without passphrase, use default Pinentry to ask for a passphrase. ' >> gpg_options 
    echo ' Name-Email: ${GIT_USER_EMAIL} ' >> gpg_options 
    echo ' Expire-Date: 0 ' >> gpg_options 
    echo ' Passphrase: ${PASSPHRASE} ' >> gpg_options 
    echo ' # Do a commit here, so that we can later print "done" :-) ' >> gpg_options 
    echo ' %commit ' >> gpg_options 
    echo ' %echo done' >> gpg_options  

	# generate the gpg key pair
	# gpg --full-generate-key
	gpg --batch --generate-key gpg_options
	rm -f gpg_options

	echo 'use-agent' > ~/.gnupg/gpg.conf
	echo 'default-cache-ttl 600' >> ~/.gnupg/gpg-agent.conf
    echo 'max-cache-ttl 7200' >> ~/.gnupg/gpg-agent.conf
	echo 'pinentry-program ${BREW_HOME}/bin/pinentry-mac' >> ~/.gnupg/gpg-agent.conf
	# echo 'pinentry-program ${BREW_HOME}/bin/pinentry-touchid' >> ~/.gnupg/gpg-agent.conf

	# We recommend disabling the option to store the password in the macOS Keychain for the default pinentry-mac program with the following option:
	# defaults write org.gpgtools.common DisableKeychain -bool yes

	# get your key id
	# gpg -k
	# sec rsa4096/######## YYYY-MM-DD [SC] [expires: YYYY-MM-DD]
	# gpg --list-keys --keyid-format=long
	# gpg --list-secret-keys --with-colons --fingerprint
	# list all existing keys
	# gpg --list-keys --keyid-format=long | grep "pub " | cut -d" " -f4 | cut -d"/" -f2
	# gpg --delete-secret-key 2374A1D37D4B2691

	# configure git to use gpg
	git config --global commit.gpgsign true
	git config --global gpg.program $(shell which gpg)
	git config --global user.signingkey $(shell gpg --list-keys --keyid-format=long | grep "pub " | cut -d" " -f4 | cut -d"/" -f2 | cut -d" " -f1)

	# The export command below gives you the key you add to GitHub
	gpg --armor --export $(shell gpg --list-keys --keyid-format=long | grep "pub " | cut -d" " -f4 | cut -d"/" -f2 | cut -d" " -f1) | pbcopy
	# GPG key copied to clipboard, beginning with -----BEGIN PGP PUBLIC KEY BLOCK----- and ending with -----END PGP PUBLIC KEY BLOCK-----
	# Add a new PGP key to your GitHub keys page

	# If you have any errors when generating a key regarding gpg-agent, try the following command to see what error it generates:
	gpgconf --kill gpg-agent # restart the GPG Agent
	# killall gpg-agent # kill the agent
	gpg-agent --daemon
	gpg-connect-agent reloadagent /bye # reload your gpg-agent

	which gpg
	gpg --version
	echo 'This will open a dialog to enter the passphrase'
	echo "test" | gpg --clearsign
endef


help: 
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

usage: ## usage : make setup
	@echo 'make sure to customize the .env file'
	@echo 'Usage : make setup'
	@echo ''

setup: ## setup useful tools on this mac (curl, git, python, docker, iterm2...)
	$(call install_brew) # use call
	$(value brew_basic_tools)
	$(value brew_python)
	$(value brew_docker)
	$(value brew_dev_tools)
	$(value brew_node)
	$(value brew_nvm)
	$(value brew_bash_completion)
	$(value brew_zsh)
	$(value brew_oh_my_zsh)
	$(call configure_git) # use call
	$(call ssh_keygen) # use call
	$(call configure_gpg) # use call

