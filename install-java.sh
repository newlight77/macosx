#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_java() {
	brew install temurin
	brew install maven \
		gradle
	brew install intellij-idea-ce

	curl -s "https://get.sdkman.io" | bash

	echo 'source ${HOME}/.sdkman/bin/sdkman-init.sh' >> ~/.zprofile

	# sdk install java x.y.z-adpt
	# sdk install java x.y.z-open
	# sdk install java x.y.z-grl

}

#############################################
## Run
#############################################

brew_java
