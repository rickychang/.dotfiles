#!/bin/bash

# Text color variables
TXTBLD=$(tput bold)             # Bold
BLDRED=${TXTBLD}$(tput setaf 1) #  red
BLDBLU=${TXTBLD}$(tput setaf 4) #  blue
BLDYLW=${TXTBLD}$(tput setaf 3) #  yellow
BLDGRN=${TXTBLD}$(tput setaf 2) #  green
TXTRST=$(tput sgr0)             # Reset


DIR=$(pwd)
BACKUPDIR=$DIR"_backup"

# Files that will be symlinked, currently files in this
# directory starting with "." or "Library"
FILES=`find -E . -type f -regex '\./(\..*|Library.*)' | sed -e 's/^.\///'`

# create backup directory
echo -e "$BLDBLU Creating $BACKUPDIR for backup of any existing files$TXTRST"
mkdir -p $BACKUPDIR

# change to home directory
echo -e "$BLDBLU Changing working directory to to $HOME$TXTRST"
cd $HOME

# list files to be symlinked
echo -e "$BLDBLU Symlinks in $HOME will be created for the following files:$TXTRST"
for file in $FILES; do
	echo -e "\t$file"
done
echo -e ""

for file in $FILES; do
    echo -e " Backing up existing $file"
    rsync -R --copy-links $file $BACKUPDIR
    echo -e "$BLDRED Deleting existing $HOME/$file $TXTRST"
    rm $HOME/$file
    echo -e "$BLDGRN Creating symlink to $file in home directory $TXTRST\n"
    ln -s $DIR/$file $HOME/$file
done
