# Mac OS setup guide

This serves as a guideline to setup tools on your mac, you may follow them step by step, or use the `make setup` as a Makefile is also present :

-  [setup macos](docs/setup_macos.md)
-  [setup git](docs/setup_git.md)
-  [setup ssh](docs/setup_ssh.md)
-  [setup gpg](docs/setup_gpg.md)
-  [setup github](docs/setup_github.md)
-  [setup node](docs/setup_node.md)
-  [setup zsh](docs/setup_zsh.md)

> Note that even running `make setup`, you still have a few manual tasks as suggested below.

A bit more customization (optionally):

-  [customize dotfiles](docs/setup_dotfiles.md)
-  [additional tools](docs/additional_tools.md)

Going further :

- [dotfiles](https://github.com/newlight77/dotfiles) to customize dotfiles (bash, zsh, fish, git, nvim)
- [nvchad](https://github.com/newlight77/nvchad) as a preconfigured neovim setup
- [neovim-preconfigured](https://github.com/newlight77/neovim-preconfigured) another preconfigured neovim setup
- [workspace](https://github.com/newlight77/workspace) a all-in-one workspace hosting repositories, managed by mani CLI

## Setup automatically

```sh
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# Intel chips
eval "$(/usr/local/bin/brew shellenv)"
# M chips
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew install cmake
```

```sh
make setup
```

## Necessary Manual Tasks

### 1. Oh-my-zsh customization

You will have to open a new tab/terminal to spawn a new zsh console in order to customize your oh-my-zsh.

### 2. Ssh-keygen passphrase

Here you will be prompt for a passphrase (if you wish to use one).

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

### 3. GPG personal information

You will be prompt for many personal information such as name and email.

```sh
brew install gpg2 gnupg pinentry-mac  

export GPG_TTY=$(tty)
echo 'export GPG_TTY=$(tty)' >> ~/.zprofile

# This tells gpg to use the gpg-agent
mkdir  ~/.gnupg
chmod 700 ~/.gnupg


gpg --full-generate-key
# then follow instructions in command line


# remove key
# gpg --delete-key key-ID


echo 'use-agent' > ~/.gnupg/gpg.conf
echo 'pinentry-program $(brew --prefix)/bin/pinentry-mac' > ~/.gnupg/gpg-agent.conf


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
