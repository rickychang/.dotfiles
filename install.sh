#!/bin/bash

source common.sh

FILES_DIR=$(pwd)/files
BACKUPDIR=$(pwd)/.backup
PATH_FILE='file_paths.txt'

IFS=$'\n'; set -f; FILES=($(<$PATH_FILE))

# create backup directory
print_blue "Creating $BACKUPDIR for backup of any existing files"
mkdir -p $BACKUPDIR

# change to home directory
print_blue "Changing working directory to to $HOME"
cd $HOME

# list files to be symlinked
print_blue "Symlinks in $HOME will be created for the following files:"
for file in ${FILES[@]}; do
	echo -e "\t$file"
done
echo ""

for file in ${FILES[@]}; do
	# if a file already exists, back it up
    if [ -e $HOME/$file ] ; then
    	echo -e "Backing up existing $file"
    	rsync -rR $file $BACKUPDIR
    fi
    # if a file or symlink already exists, delete it
    if [ -e $HOME/$file ] || [ -L $HOME/$file ] ; then
    		print_red "Deleting existing $HOME/$file"
    		sudo rm -fr $HOME/$file
    # otherwise, create directories that will contain symlink
	else
		REQ_DIR=$(dirname $file)
		if ! [ -d $REQ_DIR ]; then
			echo -e "Creating required directory $directory"
			mkdir -p $REQ_DIR
		fi
	fi
    print_green "Creating symlink to $file in home directory"
    ln -s $FILES_DIR/$file $HOME/$file
    echo ""
done
