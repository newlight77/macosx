#!/usr/bin/env bash

#############################################
## Functions
#############################################

ssh_keygen() {
	echo '........generating ssh key for ${GIT_USER_EMAIL} at ~/.ssh/id_rsa'
	# ssh-keygen -t rsa -b 4096 -C "${GIT_USER_EMAIL}" -P "${PASSPHRASE}" -f ~/.ssh/id_rsa
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
}

configure_gpg() {
	echo '........configuring gpg for ${GIT_USER_NAME}'
	brew install gpg2 gnupg pinentry-mac
	#brew tap jorgelbg/tap
	#brew install gpg2 gnupg pinentry-touchid # not working... :(

	export GPG_TTY=$(tty)
	echo 'export GPG_TTY="$$(tty)"' >> ~/.zshrc

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
}


#############################################
## Run
#############################################
if [ -f .env ]; then
	source .env
fi

ssh_keygen
configure_gpg
