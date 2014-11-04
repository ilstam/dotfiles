#!/bin/sh

if [ -z "$DOTFILES" ]; then
	DOTFILES=$HOME/.dotfiles
fi

echo -e "vim configuraton...\n"

# install vundle
if [ ! -d ~/.vim/bundle/Vundle.vim/ ]; then
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
fi

# backup existing ~/.vimrc file
if [ -f ~/vimrc ]; then
	cp ~/.vimrc ~/.vimrc.orig
fi

# overwrite vimrc
cat > ~/.vimrc << EOF
if filereadable(expand("$DOTFILES/vim/vimrc"))
    source $DOTFILES/vim/vimrc
endif
EOF

# install vim plugins
vim +PluginInstall +qall

# run snipmate_remap.py
python $(dirname $0)/snipmate_remap.py

echo -e "\ndone...\n"
