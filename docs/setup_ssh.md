## SSH

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