# Mac OS setup guide

This repository provides scripts to setup tools on your mac, you may follow them step by step, as described below :

- Install homebrew
- Install basics tools, using homebrew
- Generate SSH key and GPG
- Install & configure git
- Install Development Stack (python, java, node, vs code, idea, sqlectron, squirrelsql)

> Note that `bash`, `zsh` and `oh-my-zsh` are covered by the [dotfiles repository](https://github.com/newlight77/dotfiles) to customize dotfiles (bash, zsh, fish, git, nvim).

## Install Steps

1. Install homebrew

```bash
curl -L https://raw.githubusercontent.com/newlight77/macosx/main/install-homebrew.sh | bash
```

2. Install basic tools

```bash
curl -L https://raw.githubusercontent.com/newlight77/macosx/main/install-basic-tools.sh | bash
```

3. Install and Configure SSH & PGP

```bash
echo '
PASSPHRASE=your passphrase for ssh key and gpg
' >> .env
```

```bash
curl -L https://raw.githubusercontent.com/newlight77/macosx/main/install-ssh-pgp.sh | bash
```

4. Install git

```bash
echo '
GIT_USER_NAME='Your name'
GIT_USER_EMAIL='Your email'
GIT_EDITOR=vi
#GIT_EDITOR=nano
' > .env

curl -L https://raw.githubusercontent.com/newlight77/macosx/main/install-git.sh | bash

git config --global credential.helper osxkeychain
```

5. Development stacks and IDEs

- Install Python Stack

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-python.sh | bash
```

- Install Java stack

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-java.sh | bash
```

- Install Node Stack

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-node.sh | bash
```

- Install IDEs
```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-ides.sh | bash
```

### All-in-one step

> You may run the all-in-one script below :

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/install-all.sh | bash
```

## Bash & Zsh customization

The is customization is covered by the [dotfiles repository](https://github.com/newlight77/dotfiles).

```bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-bash.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-util.sh | bash
curl -L https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-zsh.sh | bash
```

You will have to open a new tab/terminal to spawn a new zsh console in order to customize your oh-my-zsh.

## Manual task

### 1. Ssh-keygen

The ssh key generation is covered by `install-ssh-pgp.sh`. For more detail, refer to [setup ssh](docs/setup_ssh.md).

Once the ssh key is generated, you will have to copy/paste (pbcopy to clipboard) and declare it on your github asetting.

### 2. GPG personal information

The gpg key generation is covered by `install-ssh-pgp.sh`. For more detail, refer to [setup gpg](docs/setup_gpg.md).

Once the gpg key is generated, you will have to copy/paste (pbcopy to clipboard) and declare it on your github asetting.

## More

Going further :

- [nvchad](https://github.com/newlight77/nvchad) as a preconfigured neovim setup
- [neovim-preconfigured](https://github.com/newlight77/neovim-preconfigured) another preconfigured neovim setup
- [workspace](https://github.com/newlight77/workspace) a all-in-one workspace hosting repositories, managed by mani CLI
- [setup mani](docs/setup_mani.md)

### How-To

You may refer to the documentation below to walk you through all the steps covered by scripts above :

- [setup macos](docs/setup_macos.md) or [macos ultimate](docs/macos_ultimate_guide.md)
- [setup git](docs/setup_git.md)
- [setup ssh](docs/setup_ssh.md)
- [setup gpg](docs/setup_gpg.md)
- [setup github](docs/setup_github.md)
- [setup python](docs/setup_python.md)
- [setup node](docs/setup_node.md)
- [setup java](docs/setup_java.md)
- [setup docker](docs/setup_docker.md)
- [setup vscode](docs/setup_vscode.md) (upcoming)
- [with neovim setup](docs/setup_neovim.md)
- [additional tools](docs/additional_tools.md)

## TODO
