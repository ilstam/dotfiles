#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring zsh...\n"

if [ ! -d ~/.oh-my-zsh/ ]; then
	echo "--> install oh-my-zsh"
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

if [ -f ~/.zshrc ]; then
	echo "--> backup existing ~/.zshrc file to ~/.zshrc.orig"
	mv ~/.zshrc ~/.zshrc.orig
fi

if [ -f ~/.zshenv ]; then
	echo "--> backup existing ~/.zshenv file to ~/.zshenv.orig"
	mv ~/.zshenv ~/.zshenv.orig
fi

if [ -f ~/.zprofile ]; then
	echo "--> backup existing ~/.zprofile file to ~/.zprofile.orig"
	mv ~/.zprofile ~/.zprofile.orig
fi

echo "--> install custom zshrc"
cat > ~/.zshrc <<EOF
source "$DOTFILES/zsh/zshrc"
EOF

echo "--> install custom zshenv"
ln -s "$DOTFILES/zsh/zshenv" ~/.zshenv

echo "--> install custom zprofile"
ln -s "$DOTFILES/zsh/zprofile" ~/.zprofile

if [ ! -f ~/.oh-my-zsh/themes/mytheme.zsh-theme -a ! -h ~/.oh-my-zsh/themes/mytheme.zsh-theme ]; then
	echo "--> install custom theme"
	ln -s "$DOTFILES/zsh/mytheme.zsh-theme" ~/.oh-my-zsh/themes/mytheme.zsh-theme
fi

if [[ ! $SHELL =~ "zsh" ]] ; then
	echo "--> make zsh the default shell for $(whoami)"
	chsh -s /bin/zsh
fi

echo -e "\ndone...\n"
