
#installing Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#installing Node + npm
brew install node

brew install typesafe-activator

#custominze NPM to never use sudo for 'npm install -g'
mkdir "${HOME}/.npm-packages"
echo NPM_PACKAGES="${HOME}/.npm-packages" >> ${HOME}/.bashrc
echo prefix=${HOME}/.npm-packages >> ${HOME}/.npmrc
curl -L https://www.npmjs.org/install.sh | sh
echo NODE_PATH=\"\$NPM_PACKAGES/lib/node_modules:\$NODE_PATH\" >> ${HOME}/.bashrc
echo PATH=\"\$NPM_PACKAGES/bin:\$PATH\" >> ${HOME}/.bashrc
echo source "~/.bashrc" >> ${HOME}/.bash_profile
source ~/.bashrc

npm install -g bower
npm install -g grunt-cli
npm install -g gulp
npm install -g nodemon
npm install -g yo
npm install -g generator-meanjs
npm install -g generator-karma
npm install -g generator-angular
npm install -g mean-cli
gem install sass
