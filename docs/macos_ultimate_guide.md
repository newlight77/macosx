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
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/usr/local/bin/brew shellenv)"

# M chips
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
```


3. Git

```sh
brew install \
    git \
    tig

git config --global core.editor nano
git config --global user.name 'fullname'
git config --global user.email 'example@mail.com'
```


4. SSH

Many of us are familiar with Secure Shell (SSH), which allows us to connect to other systems using a key instead of a password. This guide will explain how to eliminate SSH keys and use a GNU Privacy Guard (GPG) subkey instead.

Using GPG does not make your SSH connections more secure. SSH is a secure protocol, and SSH keys are secure. Instead, it makes certain forms of key distribution and backup management easier. It also will not change your workflow for using SSH. All commands will continue to work as you expect, except that you will no longer have SSH private keys and you will unlock your GPG key instead.

By having SSH authenticated by your GPG key, you will reduce the number of key files you need to secure and back up. This means that your key management hygiene still has to be good, which means choosing good passphrases and using appropriate key preservation strategies. Remember, you shouldn't back your private key up to the cloud!

Additionally, today SSH keys are distributed by hand and oftentimes directly. If you want to grant me access to a machine, you have to ask me for my SSH key. You may get lucky and find one posted on my website. However, you still have to decide if you trust my website. If I use a GPG key for SSH, you can select a known, good key for me using the GPG web of trust from a public keyserver. This is what The Monkeysphere Project is working on. Otherwise, nothing you do here affects the web of trust used for GPG encryption and signing.

- Ssh-keygen

The SSH protocol uses public key cryptography for authenticating hosts and users. The authentication keys, called SSH keys, are created using the keygen program.

Ssh-keygen is a tool for creating new authentication key pairs for SSH. Such key pairs are used for automating logins, single sign-on, and for authenticating hosts.

```sh
#ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

ssh-keygen -t ed25519
# then follow instructions in command line

# kill ssh-agent
eval "$(ssh-agent -k)"

# start ssh-agent
eval "$(ssh-agent -s)"

#ssh-add -K ~/.ssh/id_rsa
ssh-add -K ~/.ssh/id_ed25519
# Enter passphrase for /Users/user/.ssh/id_ed25519:
# Identity added: /Users/user/.ssh/id_ed25519

# Copy the contents of the id_ed25519.pub file to your clipboard
pbcopy < ~/.ssh/id_ed25519.pub
# Load your GitHub Settings page for adding an SSH key and paste the contents of your clipboard
```

- The GNU Privacy Guard

GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories.

```sh
brew install gpg2 gnupg pinentry-mac

export GPG_TTY=$(tty)
echo 'export GPG_TTY=$(tty)' >> ~/.zshrc

# This tells gpg to use the gpg-agent
mkdir  ~/.gnupg
chmod 700 ~/.gnupg


gpg --full-generate-key
# then follow instructions in command line


# remove key
# gpg --delete-key key-ID


echo 'use-agent' > ~/.gnupg/gpg.conf
echo 'pinentry-program /usr/local/bin/pinentry-mac' > ~/.gnupg/gpg-agent.conf


# get your key id
# gpg -k
# sec rsa4096/######## YYYY-MM-DD [SC] [expires: YYYY-MM-DD]
gpg --list-keys --keyid-format=long

# The export command below gives you the key you add to GitHub
gpg --armor --export <your key id> | pbcopy
# GPG key copied to clipboard, beginning with -----BEGIN PGP PUBLIC KEY BLOCK----- and ending with -----END PGP PUBLIC KEY BLOCK-----
# Add a new PGP key to your GitHub keys page

# Configure Git to use gpg
git config --global gpg.program $(which gpg)
git config --global user.signingkey ########
git config --global commit.gpgsign true

# If you have any errors when generating a key regarding gpg-agent, try the following command to see what error it generates:
gpgconf --kill gpg-agent
killall gpg-agent
gpg-agent --daemon
gpg-connect-agent reloadagent /bye
```

Check if the gpg is properly installed:

```
which gpg
gpg --version
echo "test" | gpg --clearsign
```

## Install CLI tools

You may refer to all available tools at [Homebrew formula](https://formulae.brew.sh/formula/). For the following steps, you will be install programming languages, and CLI tools for development purpose, so you won't have any details about each package to be installed.

5. Http utility :

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

6. Shell Utility :

```sh
brew install \
    bash-completion \
    zsh

echo "export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters" >> ~/.zshrc
```

oh-my-zsh :
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Shell Integration:
```sh
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
```

Theme :

```sh
brew install romkatv/powerlevel10k/powerlevel10k

echo 'source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
```

Plugins :

```sh
brew install zsh-completions

echo "
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi
" >> ~/.zprofile
```

```sh
brew install zsh-syntax-highlighting

echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zprofile
```

```sh
brew install zsh-autosuggestions

echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

```

```sh
brew install zsh-history-substring-search

echo 'source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zprofile
```

```sh
brew install zsh-navigation-tools

echo 'source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh' >> ~/.zprofile
```

Oh-my-zsh plugins :

```sh
sed -i -e "/plugins=(git)/plugins=(alias-finder brew common-aliases copydir copyfile docker docker-compose dotenv encode64 extract git jira jsontools node npm npx osx urltools vi-mode vscode web-search z)/g" ~/.zshrc
```

```sh
echo 'ZSH_ALIAS_FINDER_AUTOMATIC=”true”' >> ~/.zshrc
```

Restart your machine.

1. Python utility :

```sh
brew install \
    python \
    pipenv \
    pyenv
```

Install pip :

```sh
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python get-pip.py --user
pip3 install --upgrade setuptools
pip3 install --upgrade pip
```

8. Node utility :

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

9. Docker utility :

```sh
brew install docker
```

```sh
brew install \
    minikube \
    kind
```

10. Java utility :

```sh
brew install --cask adoptopenjdk

brew install \
    maven \
    gradle \
    scala \
    sbt
```

SDKMAN (optional) :
```sh
curl -s "https://get.sdkman.io" | bash

echo 'source $HOME/.sdkman/bin/sdkman-init.sh' >> ./.zshrc

# sdk install java x.y.z-adpt
# sdk install java x.y.z-open
# sdk install java x.y.z-grl

```

11. Paas

```sh
brew install \
    ansible
    heroku/brew/heroku
```

## Install tools with UI

You may refer to all available tools at [Homebrew cask formula](https://formulae.brew.sh/cask/).

12. General Purpose Tools

```sh
brew install --cask \
    dropbox \
    evernote \
    firefox \
    google-chrome \
    mailspring \
    slack
```

13. Docker with UI :

```sh
brew install --cask docker
# brew install --cask docker-toolbox
brew install minikube kind
```

14. Virtual Machine

* virtualbox not yet compatible with M1 arm machine
```sh
brew install --cask \
    virtualbox \
    vagrant
```

15. IDE

```sh
brew install --cask \
    atom \
    visual-studio-code \
    intellij-idea-ce
```

16. Complementary Dev Tools

```sh
brew install --cask \
    # cmake \
    cheatsheet \
    chrome-devtools \
    # github \
    # gitkraken \
    iterm2 \
    # kafka-tool \
    postman
```

17. System Status

```sh
brew install --cask \
    flux \
    gfxcardstatus
```

18. System Cleaning

```sh
brew install --cask \
    appcleaner
```

19. VPN

```sh
brew install --cask \
    tunnelblick
```

20. Peer-2-Peer :

```sh
brew install --cask \
    transmission
```

Configure Transmission blocking list :

`Transmission > Preferences > Peers > Check Prevent peers in blocklist ...`

`Transmission > Preferences > Peers > URL : http://john.bitsurge.net/public/biglist.p2p.gz`

21. Photos

```sh
brew install --cask \
    gimp
```

22. Multimedia

```sh
brew install --cask \
    kodi \
    spectacle \
    spotify \
    station \
    vlc
```

23. NTFS :

If you think one day you will need to connect a Windows formated Storage Drive (e.g. USB key), then this may be useful.

```sh
# not compatible with M1
brew install --cask osxfuse
brew install ntfs-3g
```

24. Paying software

```sh
brew install --cask \
    bartender\
    ccleaner
```

## Bash Customization

25. Customize Bash

```sh
curl https://raw.githubusercontent.com/newlight77/bash_custom/master/customize.sh | bash
```

## Useful links

You may refer to the following links to see how tools installation can be fully automated.

- [:rocket: MacOS setup](https://github.com/sb2nov/mac-setup)
- [MacOS machine config](https://github.com/bkuhlmann/mac_os-config)
- [MacOS machine setup](https://github.com/bkuhlmann/mac_os)
- [Set Up Your MacBook for Web Development](https://medium.com/better-programming/setting-up-your-mac-for-web-development-in-2020-659f5588b883#a175)
- [dotfiles setup](https://github.com/newlight77/dotfiles)
