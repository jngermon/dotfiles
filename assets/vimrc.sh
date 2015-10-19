#!/bin/bash

if [ ! $(which vim) ]; then
    echo "Vim is not installed"
else
    VIMRC="$(pwd)/files/vim/.vimrc"

    if [ ! -f ~/.vimrc ] || [ ! -h ~/.vimrc ]; then
        echo "Create symbolik link form ~/.vimrc to $VIMRC"

        ln --symbolic --force $VIMRC ~/.vimrc
    else
        echo ~/.vimrc already exists and is a symbolic link
    fi

    VIM="$(pwd)/files/vim/"

    if [ ! -d ~/.vim ] || [ ! -h ~/.vim ]; then
        echo "Create symbolik link form ~/.vim to $VIM"

        if [ -d ~/.vim ]; then
            mv ~/.vim ~/.vim.bkp
        fi

        ln --symbolic --force $VIM ~/.vim
    else
        echo ~/.vim already exists and is a symbolic link
    fi
fi
