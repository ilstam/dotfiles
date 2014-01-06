#!/bin/sh

# backup existing ~/.gitconfig file
mv ~/.gitconfig ~/.gitconfig.orig

# create symbolic link to the gitconfig
ln -s $DOTFILES/git/gitconfig ~/.gitconfig
