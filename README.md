# Mac OS setup guide

This serves as a guideline to setup tools on your mac, you may follow them step by step, or use the `make setup` as a Makefile is also present :

-  [setup macos](docs/setup_macos.md) or [macos ultimate](docs/macos_ultimate_guide.md)
-  [setup git](docs/setup_git.md)
-  [setup ssh](docs/setup_ssh.md)
-  [setup gpg](docs/setup_gpg.md)
-  [setup github](docs/setup_github.md)
-  [setup node](docs/setup_node.md)
-  [setup zsh](docs/setup_zsh.md)
-  [setup vscode](docs/setup_vscode.md) (upcoming)

> Note that even running `make setup`, you still have a few manual tasks as suggested below.

More setup (optionally):

-  [with neovim setup](docs/setup_neovim.md)
-  [with mani setup](docs/setup_mani.md)
-  [with python setup](docs/setup_python.md)

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

### Configure git

```bash
echo '
GIT_USER_NAME=<your name>
GIT_USER_EMAIL=<you email>
GIT_EDITOR=nano or vi
' > .env
```

### Set a passphrase

```bash
echo '
PASSPHRASE=your passphrase for ssh key and gpg
'
```

### Run the setup

```sh
make setup
```

## Necessary Manual Tasks

### 1. Oh-my-zsh customization

You will have to open a new tab/terminal to spawn a new zsh console in order to customize your oh-my-zsh.

### 2. Ssh-keygen

The ssh key generation is covered by `make setup`. For more detail, refer to [setup ssh](docs/setup_ssh.md).

Once the ssh key is generated, you will have to copy/paste (pbcopy to clipboard) and declare it on your github asetting.

### 3. GPG personal information

The gpg key generation is covered by `make setup`. For more detail, refer to [setup gpg](docs/setup_gpg.md).

Once the gpg key is generated, you will have to copy/paste (pbcopy to clipboard) and declare it on your github asetting.

## TODO

- VS Code
- 