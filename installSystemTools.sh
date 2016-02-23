installHomeBrew () {
  echo "***installHomeBrew*** Installing HomeBrew" 1>&2
  $(isRoot)

  #installing Homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "***installHomeBrew*** done" 1>&2
}

installOsxFuse () {
  echo "***installOsxFuse*** Installing OSXFuse" 1>&2
  $(isRoot)
  brew cask install osxfuse
  echo "***installOsxFuse*** done" 1>&2
}

installNodejs () {
  echo "***installNodejs*** Installing Nodejs" 1>&2
  $(isRoot)
  #installing Node + npm
  brew install node
  echo "***installNodejs*** done" 1>&2
}
