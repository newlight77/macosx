#!/usr/bin/env bash

#############################################
## Functions
#############################################

installUtil() {
    curl -L https://raw.githubusercontent.com/newlight77/macosx/main/util/ssh-agent.sh       -o ${HOME}/.config/util/ssh-agent.sh
    curl -L https://raw.githubusercontent.com/newlight77/macosx/main/util/docker_cleanup.sh  -o ${HOME}/.config/util/docker_cleanup.sh

    chmod u+x ${HOME}/.config/util/ssh-agent.sh
    chmod u+x ${HOME}/.config/util/docker_cleanup.sh

    echo '
    export PATH=$HOME/.config/util/:$PATH
    ' >> ~/.zshrc

    # run ssh-agent
    ${HOME}/.config/util/ssh-agent.sh
}


#############################################
## Run
#############################################

installUtil