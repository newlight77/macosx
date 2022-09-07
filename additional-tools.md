## Install tools with UI

You may refer to all available tools at [Homebrew cask formula](https://formulae.brew.sh/cask/). 

1. General Purpose Tools

```sh
brew install --cask \
    dropbox \
    evernote \
    firefox \
    google-chrome \
    mailspring \
    slack
```

2. System Status

```sh
brew install --cask \
    flux \
    gfxcardstatus
```

3. System Cleaning

```sh
brew install --cask \
    appcleaner
```

4. VPN

```sh
brew install --cask \
    tunnelblick
```

5. Peer-2-Peer :

```sh
brew install --cask \
    transmission
```

Configure Transmission blocking list :

`Transmission > Preferences > Peers > Check Prevent peers in blocklist ...`

`Transmission > Preferences > Peers > URL : http://john.bitsurge.net/public/biglist.p2p.gz`

6. Photos

```sh
brew install --cask \
    gimp
```

7. Multimedia

```sh
brew install --cask \
    kodi \
    spectacle \
    spotify \
    station \
    vlc
```

8. NTFS :

If you think one day you will need to connect a Windows formated Storage Drive (e.g. USB key), then this may be useful.

```sh
# not compatible with M1
brew install --cask osxfuse
brew install ntfs-3g
```

9. Paying software

```sh
brew install --cask \
    bartender\ 
    ccleaner
```
