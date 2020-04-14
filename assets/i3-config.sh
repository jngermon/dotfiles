#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which i3) ]; then
    echo "i3 is not installed"
else
    I3CONFIG="$(pwd)/files/i3/config"
    I3CONFIG_DEST="$HOME/.config/i3/config"

    createSymlink $I3CONFIG $I3CONFIG_DEST

    I3STATUS="$(pwd)/files/i3/status.conf"
    I3STATUS_DEST="$HOME/.config/i3/status.conf"

    createSymlink $I3STATUS $I3STATUS_DEST

    I3GETWINDOWCRITERIA="$(pwd)/files/i3/i3-get-window-criteria"
    I3GETWINDWOCRITERIA_DEST="$HOME/bin/i3-get-window-criteria"

    createSymlink $I3GETWINDOWCRITERIA $I3GETWINDWOCRITERIA_DEST

    if [ $? = 0 ]; then
        i3 reload
    fi

    HOME_BIN=$HOME/bin
    mkdirIfNotExists $HOME_BIN

    I3EXIT="$(pwd)/files/i3/i3exit"
    I3EXIT_DEST="$HOME_BIN/i3exit"
    createSymlink $I3EXIT $I3EXIT_DEST

    exit 0
fi
