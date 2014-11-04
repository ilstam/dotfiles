#!/bin/sh

if [ -z "$DOTFILES" ]; then
	DOTFILES=$HOME/.dotfiles
fi

echo -e "git configuration...\n"

# backup existing ~/.gitconfig file
if [ -f ~/.gitconfig ]; then
	mv ~/.gitconfig ~/.gitconfig.orig
fi

# create symbolic link to the gitconfig
ln -s $DOTFILES/git/gitconfig ~/.gitconfig

echo -e "\ndone...\n"
