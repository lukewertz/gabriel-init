#!/usr/bin/env bash

# This is heavily inspired by the amazing Michelle
# https://github.com/craychee/loki-init
# (I hold no malice that we have chosen different patron saints for our work.)

function pause() {
  read -p "$*"
}

CWD=($PWD)

cd ~

pause 'Press [Enter] once you have installed XCode and XCode Command Line Tools.'

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installing software...
brew install ruby
brew install git
brew install wget

brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/binary
brew tap caskroom/versions

brew install brew-cask

brew cask install google-chrome
brew cask install alfred
brew cask install skype
brew cask install vagrant
brew cask install virtualbox
brew cask install sequel-pro
brew cask install lastpass

# Install and set up ST3
echo "Setting up Sublime Text"
brew cask install sublime-text3
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
git clone https://github.com/kkga/spacegray.git spacegray
git clone https://github.com/sirkitree/DrupalCodingStandard.git
git clone git://github.com/benmatselby/sublime-phpcs.git Phpcs
git clone https://github.com/kemayo/sublime-text-git.git
git clone https://github.com/spadgos/sublime-jsdocs.git
cd ~

# Set up PHP tools
# https://philsturgeon.uk/php/2013/08/20/php-static-analysis-in-sublime-text/
# http://benmatselby.github.io/sublime-phpcs/
echo "Setting up PHP Tools"
sudo chown -R `whoami` /usr/local
brew tap homebrew/homebrew-php
brew install phpmd
brew install php-code-sniffer
brew install php-cs-fixer

# Hold my own hand to make sure I finish configuring.
echo "Add your ssh keys (you put them in your secret hiding place)."
pause 'Press [Enter] when you have added your ssh key.'
chmod 400 ~/.ssh/*

# Move preference files
echo "Setting up your preference files."
cp .gitconfig ~/.gitconfig
cp phpcs.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
cp Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
# @todo: export terminal configuration and move it here.

# Set up Viscosity
cd $CWD
echo "Downloading Viscosity. You'll need to install it manually."
wget https://www.sparklabs.com/downloads/Viscosity.dmg
open Viscosity.dmg
pause "Press [Enter] once Viscsoity is installed & configured."

echo "NICE WORK! Time to make some noise..."
