#!/bin/bash

if [ -z "$DOTFILES" ]; then
	DOTFILES=~/.dotfiles
fi

echo -e "configuring vim...\n"

echo "--> installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f ~/.vimrc ]; then
	echo "--> backup existing ~/.vimrc file to ~/vimrc.orig"
	mv ~/.vimrc ~/.vimrc.orig
fi

echo "--> install custom vimrc"
cat > ~/.vimrc <<EOF
if filereadable(expand("$DOTFILES/vim/vimrc"))
    source $DOTFILES/vim/vimrc
endif
EOF

if [ -f ~/.vim/coc-settings.json ]; then
	echo "--> backing up existing ~/.vim/coc-settings.json file to ~/.vim/coc-settings.json.orig"
	mv ~/.vim/coc-settings.json ~/.vim/coc-settings.json.orig
fi

echo "--> symlinking ~/.vim/coc-settings.json"
ln -s "$DOTFILES/vim/coc-settings.json" ~/.vim/coc-settings.json

echo "--> install vim plugins"
vim +PlugInstall +qall

if ! which node &> /dev/null; then
	echo -n "Node.js is not installed. Do you want me to install it? (y/n) "
	an=$(read a && echo "$a" | tr '[:upper:]' '[:lower:]')
	echo ""

	if [ -z "$an" -o "$an" == "y" -o "$an" == "yes" ]; then
		curl -sL install-node.vercel.app/lts | sudo bash
	fi
fi

echo -n "Do you want to instlal coc-rust-analyzer? (y/n) "
an=$(read a && echo "$a" | tr '[:upper:]' '[:lower:]')
echo ""

if [ -z "$an" -o "$an" == "y" -o "$an" == "yes" ]; then
	vim -c 'CocInstall coc-rust-analyzer' -c 'qa'
fi

echo -e "\ndone...\n"
