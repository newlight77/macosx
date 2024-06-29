# Zsh / Oh-my-Zsh


```sh
brew install bash-completion

echo '[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"' >> ~/.zprofile
```

oh-my-zsh :

```sh
brew install zsh

#chmod -R 755 '$(brew --prefix)/share/zsh'
chmod -R go-w '$(brew --prefix)/share/zsh'
```

```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Then open a new tab/terminal to spawn a new zsh console in order to customize your oh-my-zsh.

Shell Integration:
```sh
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
```

Plugins :

```sh
brew install zsh-completions

chmod -R go-w '$(brew --prefix)/share/zsh'

echo '
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    FPATH=$(brew --prefix)/share/zsh-navigation-tools:$FPATH
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    FPATH=$HOME/.oh-my-zsh/plugins/git:$FPATH
    FPATH=$HOME/.oh-my-zsh/lib/functions:$FPATH
    FPATH=$HOME/.oh-my-zsh/lib/completions:$FPATH
    FPATH=$HOME/.oh-my-zsh/cache/completions:$FPATH
    #FPATH=$(brew --prefix)/Cellar/zsh/5.9/share/zsh/functions:$FPATH

    autoload -Uz compinit
    compinit
fi
' >> ~/.zprofile
```

```sh
brew install zsh-autosuggestions

echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zprofile

```

```sh
brew install zsh-history-substring-search

echo 'source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zprofile
```

```sh
brew install zsh-navigation-tools

echo 'source $(brew --prefix)/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh' >> ~/.zprofile
```

```sh
brew install zsh-syntax-highlighting

echo 'export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$(brew --prefix)/share/zsh-syntax-highlighting/highlighters' >> ~/.zprofile
```

Oh-my-zsh plugins :

```sh
sed -i -e "/plugins=(git)/plugins=(alias-finder brew common-aliases copypath copyfile docker docker-compose dotenv encode64 extract git jira jsontools node npm urltools vi-mode vscode web-search z)/g" ~/.zshrc
```

```sh
echo 'ZSH_ALIAS_FINDER_AUTOMATIC=”true”' >> ~/.zprofile
```

Theme :

```sh
brew install romkatv/powerlevel10k/powerlevel10k

echo 'source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zprofile
```

Restart your machine.

7.1 Reset oh-my-zsh (if needed):

```sh
rm -f ~/.zshrc*
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```
