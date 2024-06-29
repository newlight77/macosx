#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_docker() {
	echo '........installing docker and minikube'
	# brew install docker
	# docker desktop
	brew install --bask docker
	brew install minikube kind
	brew install kind
	brew install --cask vagrant
}

brew_customize_docker() {
	echo '
# Kubernetes completion
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# Helm completion
[[ $commands[helm] ]] && source <(helm completion zsh)

# Podman completion
[[ $commands[podman] ]] && source <(podman completion zsh)
' >> $HOME/.zshrc

}

#############################################
## Run
#############################################

brew_docker
brew_customize_docker
