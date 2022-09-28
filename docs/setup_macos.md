# MacOS Setup

This guide covers the basics of setting up a development environment on a new Mac. Whether you are a beginner or an experienced developer, this could be helpful for anyone to use as a reference for setting up a complete environment and/or installing tools.

To start with, you need to understand what is a `root` user. Then, step-by-step, you will be guided to install tools per category. Of course, it you read through a step and you don't know what the tools is about, you may just skip it. It's not recommanded to installing something you don't know what it is. Or you do something searching to get to know about that tool then ask yourself if you'll use it or not, thus install it or not.

## Root user

The most advanced tasks demand the most powerful user account of them all: the root user. When you log in as root, you have read and write privileges to every file on your Mac. This awesome power lets you override any account or permission restriction, but be careful! You could really mess things up if you don’t know what you’re doing.

> __Warning__: The root account is disabled by default. To prevent accidents, you should only enable and utilize the root account when you absolutely need it.

### Acting as Root with Sudo

Before you enable the root user account on your Mac, you should know about an alternative called sudo. As in other Unix-based operating systems, this command allows administrators to temporarily act as the root user in Mac OS X

If you still need it, you can proceed the following step.

### Enabling the Root User Account

`System prefs > Users & Groups > Login options > Network Account Server : Join ... > Open Directory Utility ... > (Menu) Edit > Enable Root User`

However, this 'Enable Root User' option may have been removed from late macos version, and an admin user can use sudo.

## First Steps

1. Install [XCode from AppStore](https://developer.apple.com/xcode/)

If you are about to install a development environment, this is the first must have.

```sh
xcode-select --install
```

2. Homebrew

[Homebrew](https://brew.sh) complements MacOS, and installs the stuff you need in a simple way. It is a package manager for which makes installing lots of different software like Git, Ruby, and Node simpler. Homebrew lets you avoid possible security problems associated with using the sudo command to install software like Node. 

Installing Homebrew is straightforward as long as you understand the Mac Terminal.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Intel chips
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

# M chips
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
```

## Install CLI tools

You may refer to all available tools at [Homebrew formula](https://formulae.brew.sh/formula/). For the following steps, you will be install programming languages, and CLI tools for development purpose, so you won't have any details about each package to be installed.

```sh
brew install \
    git \
    tig
```

```sh
brew install \
    curl \
    jq \
    htop \
    ncdu \
    tmux \
    HTTPie \
    tree \
    wget
```

Python utility :

```sh
brew install \
    python \
    pipenv \
    pyenv 

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python get-pip.py --user
pip3 install --upgrade setuptools
pip3 install --upgrade pip
```


Docker utility :

```sh
brew install docker
```

Docker with UI :

```sh
brew install --cask docker
# brew install --cask docker-toolbox
```

```sh
brew install minikube kind
```


Complementary Dev Tools

```sh
brew install --cask \
    iterm2 \
    cheatsheet \
    chrome-devtools \
    postman \
    cmake \
```

## Useful links

You may refer to the following links to see how tools installation can be fully automated.

- [:rocket: MacOS setup](https://github.com/sb2nov/mac-setup)
- [MacOS machine config](https://github.com/bkuhlmann/mac_os-config)
- [MacOS machine setup](https://github.com/bkuhlmann/mac_os)
- [Set Up Your MacBook for Web Development](https://medium.com/better-programming/setting-up-your-mac-for-web-development-in-2020-659f5588b883#a175)
- [dotfiles setup](https://github.com/newlight77/dotfiles)

