## dotfiles customisation

Customize Bash :

```sh
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-bash.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-util.sh | bash
```

NeoVim Customization :

```sh
brew install neovim
pip3 install pynvim

# I think these 3 are not required
#pip3 install 'python-lsp-server[all]'
#brew install ripgrep
#brew install fd

curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-nvim.sh | bash
```

Examples of language server to be installed (support for LSP on Vim) :

```sh
npm install -g bash-language-server
npm install -g typescript-language-server typescript
npm install -g graphql-language-service-server

npm install -g pyright
pip3 install "python-language-server[all]"

npm install -g dockerfile-language-server-nodejs

#go get golang.org/x/tools/gopls@latest
#composer require felixfbecker/language-server
#dotnet tool install --global csharp-ls
```

Git Customization :
```sh
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-git.sh | bash

git config --global core.editor nano
git config --global user.name 'fullname'
git config --global user.email 'example@mail.com'
```

Undo it:

```sh
m -fr /tmp/dotfiles
rm -rf $HOME/.config/bash
rm -rf $HOME/.config/git
rm -rf $HOME/.config/nvim
rm -rf $HOME/.onfig/util
```