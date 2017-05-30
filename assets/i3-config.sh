#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which i3) ]; then
    echo "i3 is not installed"
else
    I3CONFIG="$(pwd)/files/i3/config"
    I3CONFIG_DEST="$HOME/.config/i3/config"

    createSymlink $I3CONFIG $I3CONFIG_DEST

    if [ $? = 0 ]; then
        i3 reload
    fi

    I3EXIT="$(pwd)/files/i3/i3exit"
    I3EXIT_DEST="$HOME/bin/i3exit"
    createSymlink $I3EXIT $I3EXIT_DEST

    exit 0
fi
