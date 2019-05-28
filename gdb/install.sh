#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring gdb...\n"

if [ -f ~/.gdbinit ]; then
	echo "--> backup existing ~/.gdbinit file to ~/.gdbinit.orig"
	mv ~/.gdbinit ~/.gdbinit.orig
fi

echo "--> symlink ~/.gdbinit to the real gdbinit"
ln -s "$DOTFILES/gdb/gdbinit" ~/.gdbinit

echo -e "\ndone...\n"
