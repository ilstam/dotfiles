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

echo "--> run snipmate_remap.py script"
python "$DOTFILES/scripts/snipmate_remap.py"

echo -e "\ndone...\n"
