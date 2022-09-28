## Github

```sh
brew install gh
```

```sh
echo '
machine api.github.com
login <user>
password <token>
' >> ~/.netrc
```

Github requires a personal access token, a gpg key, and a ssh key.

Here we gonna need the generated GPG Key.

```bash
# get your key id
# gpg -k
# sec rsa4096/######## YYYY-MM-DD [SC] [expires: YYYY-MM-DD]
```

Now encrypt you email address using the gpg key, where <EMAIL> is the address you used when creating the key:

```bash
gpg -e -r <EMAIL> ~/.netrc
```

## Github enterprise

If you want to access github entreprise on premiss, set this in vimrc :

```bash
let g:github_enterprise_urls = ['https://example.com']
```

### git credentials using git-credential-netrc (optional)

Note : This step is already covered by [customize-git.sh](https://raw.githubusercontent.com/newlight77/dotfiles/main/customize-git.sh).

You gonna need a credential helper to decrypt the .netrc file automatically by git:

```bash
echo "creating folder $HOME/.config/util" 1>&2
mkdir $HOME/.config/util/

echo "retrieve the git-credential-netrc from github"
curl -o $HOME/.config/util/git-credential-netrc https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl
chmod +x $HOME/.config/util/git-credential-netrc

echo "adding export GPG_TTY and add git-credential-netrc to PATH in $HOME/.zshrc" 1>&2
echo '
# ===================================================================
# added by https://github.com/newlight77/dotfiles
export PATH=$HOME/.config/util/:$PATH
export GPG_TTY=$(tty)
# ===================================================================
' >> $HOME/.zshrc
```

At last, configure git to use credential helper

```bash
git config --global credential.helper "netrc -f ~/.netrc.gpg -v"
# automatically sign commits
git config --global commit.gpgsign true
```