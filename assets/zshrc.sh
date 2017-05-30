#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which zsh) ]; then
    echo "Zsh is not installed"
else
    ZSHRC="$(pwd)/files/zsh/.zshrc"
    ZSHRC_DEST="$HOME/.zshrc"

    createSymlink $ZSHRC $ZSHRC_DEST

    if [ $? = 0 ]; then
        echo "You have to restart your console"
    fi

    exit 0
fi
