# MacOS install

## Useful links

- [:rocket: MacOS setup](https://github.com/sb2nov/mac-setup)
- [MacOS machine config](https://github.com/bkuhlmann/mac_os-config)
- [MacOS machine setup](https://github.com/bkuhlmann/mac_os)

## Install

Set root user account / password :

`System prefs > Users & Groups > Login options > Join ... > Open Directory Utility ... > (Menu) Edit > Enable Root User`

Homebrew :

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
brew update
```

NTFS :

```sh
brew cask install osxfuse
brew install ntfs-3g
```

Install [XCode from AppStore](https://developer.apple.com/xcode/) then :

```sh
xcode-select --install
```

Install your cli tools ([available tools](https://formulae.brew.sh/formula/)) :

```sh
brew install \
    curl \
    git \
    tig \
    lsd \
    tree \
    wget \
    bash-completion \
```

```sh
brew install 
    zsh \
    zsh-autosuggestions \
    zsh-completions \
    zsh-syntax-highlighting \
    zsh-navigation-tools

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

```sh
brew install \
    python \
    pipenv \
    pyenv 
```

Install pip :

```sh
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
pip3 install --upgrade setuptools
pip3 install --upgrade pip
```


```sh
brew install \
    node \
    yarn \
    yarn-completion
```

NVM :

```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
```


```sh
brew install \
    docker \
    docker-compose \
    docker-completion
```

```sh
brew install \
    heroku/brew/heroku \
```

```sh
brew cask install adoptopenjdk \
    java \
brew install \
    maven \
    scala \
    sbt
```

Install your gui tools ([available tools](https://formulae.brew.sh/cask/)) :

```sh
brew cask install \
    appcleaner \
    atom \
    bartender \
    ccleaner \
    cheatsheet \
    chrome-devtools \
    cmake \
    docker \
    docker-toolbox \
    evernote \
    flux \
    gfxcardstatus \
    gimp \
    github \
    gitkraken \
    google-chrome \
    iterm2 \
    kafka-tool \
    kodi \
    mailspring \
    postman \
    spectacle \
    spotify \
    station \
    transmission \
    tunnelblick \
    virtualbox \
    vlc
```



Transmission blocking list :

`Transmission > Preferences > Peers > Check Prevent peers in blocklist ...`

`Transmission > Preferences > Peers > URL : http://john.bitsurge.net/public/biglist.p2p.gz`
