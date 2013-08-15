#!/bin/bash

source common.sh

PACKAGES_FILE='brew_packages.txt'
HOMEBREW_CASK_OPTS="--appdir=/Applications"

# homebrew packages to be installed
IFS=$'\n' read -d '' -r -a HOMEBREW_PACKAGES < $PACKAGES_FILE


# checking for gcc and javac
print_blue "Checking for gcc..."


if command_exists gcc ; then
	print_green "gcc is installed"
else
	print_red "gcc is not installed.  Please install XCode and command line dev tools before running this script."
	print_blue "XCode: https://developer.apple.com/xcode/"
	open https://developer.apple.com/xcode/
	print_blue "Command Line Tools: https://connect.apple.com"
	open https://connect.apple.com
	exit 1
fi

print_blue "Checking for javac..."

if command_exists javac ; then
	print_green "javac is installed"
else
	print_red "javac is not installed.  Please install Oracle JDK before running this script."
	print_blue "http://www.oracle.com/technetwork/java/javase/downloads/index.html"
	open http://www.oracle.com/technetwork/java/javase/downloads/index.html
	exit 1
fi

# homebrew package installation
print_blue "Installing packages via homebrew."

if command_exists brew ; then
	for package in ${HOMEBREW_PACKAGES[@]}; do
		echo "Installing $package"
		brew install $package
	done
else
	print_red "Homebrew is not installed.  Please install before running this script."
	print_blue "http://mxcl.github.io/homebrew/"
	exit 1
fi

print_blue "Installing brew cask."
brew tap phinze/homebrew-cask
brew install brew-cask

# Git config commands
print_blue "Configuring git global settings."

echo -n "Enter your git user.name: "
read -e GIT_USERNAME
git config --global user.name "$GIT_USERNAME"
echo -n "Enter your git user.email: "
read -e GIT_USEREMAIL
git config --global user.email "$GIT_USEREMAIL"
echo "Enabling colors for git terminal output"
git config --global color.ui true

# Change some OS X settings

# Create ~/bin
mkdir ~/bin

# Change default shell
chsh -s /bin/bash

# Disable downloaded application warnings
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Other apps you usually want installed

CASK_APPS="google-chrome
one-password
sizeup
dropbox
caffeine
sublime-text
colloquy"

ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl ~/bin/subl

print_blue "installing brew cask apps:"
for app in $CASK_APPS; do
	print_bold "Installing $app"
	brew cask install $app
done