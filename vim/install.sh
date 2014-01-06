#!/bin/sh

# install vundle
if [ ! -d ~/.vim/bundle/vundle/ ]; then
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# backup existing ~/.vimrc file
cp ~/.vimrc ~/.vimrc.orig

# overwrite vimrc
cat > ~/.vimrc << "EOF"
if filereadable(expand("/home/ilias/.dotfiles/vim/vimrc"))
    source /home/ilias/.dotfiles/vim/vimrc
endif
EOF
