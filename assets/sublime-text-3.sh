#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which subl) ]; then
    echo "Sublime Text is not installed"
else

    SUBLIME="$(pwd)/files/sublime-text-3/"
    SUBLIME_DEST="$HOME/.config/sublime-text-3/Packages/User"

    createSymlink $SUBLIME $SUBLIME_DEST

    exit 0
fi
