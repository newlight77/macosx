#!/bin/bash

echo "*** Customize *** Customizing User env" 1>&2

cd ~

git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
git clone https://github.com/google/styleguide.git
git clone https://github.com/newlight77/macosx.git .macosx

cat .macosx/.bashrc_profile >> ~/.bashrc_profile
cat .macosx/.gitconfig >> ~/.gitconfig

git config --global user.name "newlight77"
git config --global user.email "newlight77@gmail.com"

ssh-keygen -t rsa
