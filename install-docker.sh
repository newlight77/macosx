#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_docker() {
	echo '........installing docker and minikube'
	brew install docker
	brew install --cask docker
	brew install minikube kind

}

#############################################
## Run
#############################################

brew_docker
