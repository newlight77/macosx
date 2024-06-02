# NodeJs

```sh
brew install \
    node \
    yarn \
    yarn-completion
```

NVM :

```sh
brew intsall nvm
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

mkdir ~/.nvm

echo 'export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion' >> ~/.zshrc
```