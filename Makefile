#!make

include .env
export

UNAME := $(shell uname -m)

$(info env: )
$(info GIT_USER_NAME = $(GIT_USER_NAME))
$(info GIT_USER_EMAIL = $(GIT_USER_EMAIL))
$(info )

define install_brew
	echo 'installing homebrew for $(UNAME)'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

	ifeq ($(UNAME), arm64)
		echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
		eval "$(/usr/local/bin/brew shellenv)"
    endif

	ifeq ($(UNAME), x86_64)
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
		eval "$(/opt/homebrew/bin/brew shellenv)"
    endif
endef

define brew_basic_tools
	echo 'installing basic tools'

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
	echo 'installing python'
	brew install \
		python \
		pipenv \
		pyenv 
	
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	#python get-pip.py --user
	pip3 install --upgrade setuptools
	pip3 install --upgrade pip
endef 

define brew_docker
	echo 'installing docker and minikube'
	brew install docker
	brew install --cask docker
	brew install minikube kind
endef

define brew_dev_tools
	echo 'installing dev tools'
	brew install --cask \
		iterm2 \
		cheatsheet \
		chrome-devtools \
		postman \
		cmake
endef

define brew_node
	brew install \
		node \
		yarn \
		yarn-completion
endef

define brew_nvm
	brew install nvm
	mkdir $HOME/.nvm

	echo 'export NVM_DIR="$HOME/.nvm"
	[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
	[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion' >> ~/.zprofile
endef

define brew_bash_completion
	brew install bash-completion
	echo '[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"' >> ~/.bash_profile
endef

define brew_zsh
	brew install zsh
	chmod -R go-w '$(brew --prefix)/share/zsh'

	curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
	curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

	brew install zsh-completions

	chmod -R go-w '$(brew --prefix)/share/zsh'

	echo '
	if type brew &>/dev/null; then
		FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
		FPATH=$(brew --prefix)/share/zsh-navigation-tools:$FPATH
		FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
		FPATH=$HOME/.oh-my-zsh/plugins/git:$FPATH
		FPATH=$HOME/.oh-my-zsh/lib/functions:$FPATH
		FPATH=$HOME/.oh-my-zsh/lib/completions:$FPATH
		FPATH=$HOME/.oh-my-zsh/cache/completions:$FPATH
		#FPATH=$(brew --prefix)/Cellar/zsh/5.9/share/zsh/functions:$FPATH

		autoload -Uz compinit
		compinit
	fi
	' >> ~/.zprofile

	brew install zsh-autosuggestions
	echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zprofile

	brew install zsh-history-substring-search
	echo 'source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zprofile

	brew install zsh-navigation-tools
	echo 'source $(brew --prefix)/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh' >> ~/.zprofile

	brew install zsh-syntax-highlighting
	echo 'export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$(brew --prefix)/share/zsh-syntax-highlighting/highlighters' >> ~/.zprofile
	
	sed -i -e "/plugins=(git)/plugins=(alias-finder brew common-aliases copypath copyfile docker docker-compose dotenv encode64 extract git jira jsontools node npm urltools vi-mode vscode web-search z)/g" ~/.zshrc

	export echo 'ZSH_ALIAS_FINDER_AUTOMATIC=”true”' >> ~/.zprofile

	brew install romkatv/powerlevel10k/powerlevel10k

	echo 'source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zprofile
endef

define brew_oh_my_zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
endef

define configure_git
	git config --global core.editor $(GIT_EDITOR)
	git config --global user.name '$(GIT_USER_NAME)'
	git config --global user.email '$(GIT_USER_EMAIL)'

	brew tap alajmo/mani
	brew install mani
endef


help: 
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

usage: ## usage : make setup
	@echo 'make sure to customize the .env file'
	@echo 'Usage : make setup'
	@echo ''

setup: ## setup useful tools on this mac (curl, git, python, docker, iterm2...)
	$(call install_brew)
	$(call brew_basic_tools)
	$(call brew_python)
	$(call brew_docker)
	$(call brew_dev_tools)
	$(call brew_node)
	$(call brew_nvm)
	$(call brew_bash_completion)
	$(call brew_zsh)
	$(call brew_oh_my_zsh)
	$(call configure_git)
