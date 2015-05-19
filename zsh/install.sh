#!/bin/sh

if [ -z "$DOTFILES" ]; then
	DOTFILES=$HOME/.dotfiles
fi

echo -e "configuring zsh...\n"

if [ ! -d ~/.oh-my-zsh/ ]; then
	echo "--> install oh-my-zsh"
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ -f ~/.zshrc ]; then
	echo "--> backup existing ~/.zshrc file to ~/zshrc.orig"
	cp ~/.zshrc ~/.zshrc.orig
fi

echo "--> overwrite ~/.zshrc"
cat > ~/.zshrc << EOF
source $DOTFILES/zsh/zshrc
EOF

echo "--> install custom theme"
cp $(dirname $0)/mytheme.zsh-theme ~/.oh-my-zsh/themes

echo -e "\ndone...\n"
