#!/bin/bash

# Text color variables
TXTBLD=$(tput bold)             # Bold
BLDRED=${TXTBLD}$(tput setaf 1) #  red
BLDBLU=${TXTBLD}$(tput setaf 4) #  blue
BLDYLW=${TXTBLD}$(tput setaf 3) #  yellow
BLDGRN=${TXTBLD}$(tput setaf 2) #  green
TXTRST=$(tput sgr0)             # Reset

command_exists () {
    type "$1" &> /dev/null ;
}

# checking for gcc and javac
echo -n "$BLDBLU"
echo "Checking for gcc..."
echo -n "$TXTRST"

if command_exists gcc ; then
	echo -n "$BLDGRN"
	echo "gcc is installed"
	echo -n "$TXTRST"
else
	echo -n "$BLDRED"
	echo "gcc is not installed.  Please install XCode and command line dev tools before running this script."
	echo -n "$TXTRST"	
	echo -e "$TXTBLD XCode: https://developer.apple.com/xcode/ $TXTRST"
	echo -e "$TXTBLD Command Line Tools: https://connect.apple.com $TXTRST"
	exit 1
fi

echo -n "$BLDBLU"
echo "Checking for javac..."
echo -n "$TXTRST"

if command_exists javac ; then
	echo -n "$BLDGRN"
	echo "javac is installed"
	echo -n "$TXTRST"
else
	echo -n "$BLDRED"
	echo "javac is not installed.  Please install Oracle JDK before running this script."
	echo -n "$TXTRST"	
	echo -e "$TXTBLD http://www.oracle.com/technetwork/java/javase/downloads/index.html $TXTRST"
	exit 1
fi

# homebrew package installation
echo -n "$BLDBLU"
echo "Installing packages via homebrew."
echo -n "$TXTRST"

HOMEBREW_PACKAGES="git python scala sbt node"

if command_exists brew ; then
	for package in $HOMEBREW_PACKAGES; do
		echo "Installing $package"
		brew install $package
	done
else
	echo -n "$BLDRED"
	echo "Homebrew is not installed.  Please install before running this script."
	echo -n "$TXTRST"
	echo -e "$TXTBLD http://mxcl.github.io/homebrew/ $TXTRST"
	exit 1
fi

# Git config commands
echo -n "$BLDBLU"
echo "Configuring git global settings."
echo -n "$TXTRST"

echo -n "Enter your git user.name: "
read -e GIT_USERNAME
git config --global user.name "$GIT_USERNAME"
echo -n "Enter your git user.email: "
read -e GIT_USEREMAIL
git config --global user.email "$GIT_USEREMAIL"
echo "Enabling colors for git terminal output"
git config --global color.ui true

# Other apps you usually want installed

OTHER_APPS="https://www.google.com/intl/en/chrome/browser/
http://www.irradiatedsoftware.com/sizeup/
https://www.dropbox.com/downloading?src=index
http://lightheadsw.com/caffeine/
http://www.sublimetext.com/2"

echo -n "$BLDBLU"
echo "More apps you probably want to install:"
echo -n "$TXTRST"
for package in $OTHER_APPS; do
	echo -n "$TXTBLD"
	echo " $package "
	echo -n "$TXTRST"
done