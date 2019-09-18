#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize Bash------ ***" 1>&2

mv ~/.bash_custom ~/.bash_custom.$(date +%Y%m%d-%H%M)
mkdir -p ~/.bash_custom

cp  ${DIR}/profile/.bashrc            ~/.bash_custom/.bashrc
cp  ${DIR}/profile/.bashrc_alias      ~/.bash_custom/.bashrc_alias
cp  ${DIR}/profile/.bashrc_natelandau ~/.bash_custom/.bashrc_natelandau
cp  ${DIR}/profile/.bashrc_vars       ~/.bash_custom/.bashrc_vars
cp  ${DIR}/profile/.gitconfig_alias   ~/.bash_custom/.gitconfig_alias

if [[ ! ~/.bashrc ||  $(grep ".bash_custom" ~/.bashrc) == "" ]] ; then
  cat ~/.bashrc    >> ~/.bashrc.$(date +%Y%m%d-%H%M)
  cat ${DIR}/profile/.bashrc_profile  >> ~/.bashrc
fi

if [[ ! ~/.zshrc ||  $(grep ".bash_custom" ~/.zshrc) == "" ]] ; then
  cat ~/.zshrc    >> ~/.zshrc.$(date +%Y%m%d-%H%M)
  cat ${DIR}/profile/.bashrc_profile  >> ~/.zshrc
fi

if [[ ! ~/.gitconfig || $(grep ".gitconfig_alias" ~/.gitconfig) == "" ]] ; then
  cp ~/.gitconfig                     ~/.gitconfig.$(date +%Y%m%d-%H%M)
  cat ${DIR}/profile/.gitconfig       >> ~/.gitconfig
fi 

if [ ! -f ${DIR}/ssh-copy-id.sh ] ; then
  cp ${DIR}/profile/ssh-copy-id.sh            ~/.bash_custom/ssh-copy-id.sh
  sh ~/.bash_custom/ssh-copy-id.sh
fi

if [ ! -f ${DIR}/prepare-workspace.sh ] ; then
  cp ${DIR}/profile/prepare-workspace.sh      ~/.bash_custom/prepare-workspace.sh
  sh ~/.bash_custom/prepare-workspace.sh
fi

if [ ! -f ${DIR}/profile/.ssh-config ] ; then
  echo "copying .ssh/config"
  cp ${DIR}/profile/.ssh-config       ~/.ssh/config
fi
