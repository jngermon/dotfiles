#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which kitty) ]; then
    echo "kitty is not installed"
else
    PICOMCONFIG="$(pwd)/files/picom/picom.conf"
    PICOMCONFIG_DEST="$HOME/.config/picom.conf"

    createSymlink $PICOMCONFIG $PICOMCONFIG_DEST

    KITTYCONFIG="$(pwd)/files/kitty/kitty.conf"
    KITTYCONFIG_DEST="$HOME/.config/kitty/kitty.conf"

    createSymlink $KITTYCONFIG $KITTYCONFIG_DEST

    exit 0
fi
