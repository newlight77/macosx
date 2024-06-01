#!/usr/bin/env bash


#############################################
## Functions
#############################################

brew_python() {
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
}

#############################################
## Run
#############################################

brew_python
