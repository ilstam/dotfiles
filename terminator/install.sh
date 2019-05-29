#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring terminator...\n"

if [ -f ~/.config/terminator/config ]; then
	echo "--> backup existing ~/.config/terminator/config file to ~/.config/terminator/config.orig"
	mv ~/.config/terminator/config ~/.config/terminator/config.orig
fi

echo "--> symlink ~/.config/terminator/config to the real config"
mkdir -p ~/.config/terminator
ln -s "$DOTFILES/terminator/config" ~/.config/terminator/config

echo -e "\ndone...\n"
