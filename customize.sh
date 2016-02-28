#!/bin/bash

echo "*** Customize *** Customizing User env" 1>&2

cd .macosx

cp .bashrc  ~/.bashrc
cp .bashrc_natelandau ~/.bashrc_natelandau
cp .bashrc_alias ~/.bashrc_alias
cp .bashrc_ps12 ~/.bashrc_ps12
cp .profile ~/.profile

cat .macosx/.bashrc_profile >> ~/.bashrc_profile
cat .macosx/.gitconfig >> ~/.gitconfig

git config --global user.name "newlight77"
git config --global user.email "newlight77@gmail.com"

git clone https://github.com/google/styleguide.git

cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

ssh-keygen -t rsa
