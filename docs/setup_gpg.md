# GPG (TGNU Privacy Guard)

GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories.

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