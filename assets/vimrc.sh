#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which vim) ]; then
    echo "Vim is not installed"
else
    VIMRC="$(pwd)/files/vim/.vimrc"
    VIMRC_DEST="$HOME/.vimrc"

    createSymlink $VIMRC $VIMRC_DEST

    VIM="$(pwd)/files/vim/"
    VIM_DEST="$HOME/.vim"

    createSymlink $VIM $VIM_DEST

    exit 0
fi
