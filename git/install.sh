#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring git...\n"

if [ -f ~/.gitconfig ]; then
	echo "--> backup existing ~/.gitconfig file to ~/.gitconfig.orig"
	mv ~/.gitconfig ~/.gitconfig.orig
fi

echo "--> symlink ~/.gitconfig to the real gitconfig"
ln -s "$DOTFILES/git/gitconfig" ~/.gitconfig

# Is this a work machine?
if [ -e /apollo ]; then
	if [ -f ~/.gitconfig.local ]; then
		echo "--> backup existing ~/.gitconfig.local file to ~/.gitconfig.local.orig"
		mv ~/.gitconfig.local ~/.gitconfig.local.orig
	fi

	echo "--> copying gitconfig.work to ~/.gitconfig.local"
	cp "$DOTFILES/git/gitconfig.work" ~/.gitconfig.local
fi

echo -e "\ndone...\n"
