#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which subl) ]; then
    echo "Sublime Text is not installed"
else

    SUBLIME="$(pwd)/files/sublime-text-3"
    SUBLIME_CONFIG="$SUBLIME/config"
    SUBLIME_CONFIG_DEST="$HOME/.config/sublime-text/Packages/User"

    createSymlink $SUBLIME_CONFIG $SUBLIME_CONFIG_DEST

    if [ $(which composer) ]; then
        composer --working-dir=$(pwd)/files/sublime-text-3 -- install
    fi

    exit 0
fi
