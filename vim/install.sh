#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring vim...\n"

if [ ! -d ~/.vim/bundle/Vundle.vim/ ]; then
	echo "--> install vundle"
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
fi

if [ -f ~/.vimrc ]; then
	echo "--> backup existing ~/.vimrc file to ~/vimrc.orig"
	mv ~/.vimrc ~/.vimrc.orig
fi

echo "--> install (symlink) custom vimrc"
ln -s "$DOTFILES/vim/vimrc" ~/.vimrc

echo "--> install vim plugins"
vim +PluginInstall +qall

echo -ne "\nDo you want to compile YCM library now (for vim 7.4+)? (y/n) "
an=$(read a && echo "$a" | tr '[:upper:]' '[:lower:]')

if [ -z "$an" -o "$an" == "y" -o "$an" == "yes" ]; then
	if [ -f ~/.vim/bundle/YouCompleteMe/install.py ]; then
		echo -e "\n--> compiling YCM library"
		python2 ~/.vim/bundle/YouCompleteMe/install.py
	else
		echo -e "Error: couldn't find YCM folder\n"
	fi
fi

echo -e "\ndone...\n"
