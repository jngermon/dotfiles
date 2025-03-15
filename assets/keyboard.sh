#!/bin/bash

. "$(dirname $0)/common.sh"

HOME_BIN=$HOME/bin
mkdirIfNotExists $HOME_BIN

KBEXEC="$(pwd)/files/keyboard/keyboard.sh"
KBEXEC_DEST="$HOME_BIN/keyboard"
createSymlink $KBEXEC $KBEXEC_DEST
exit 0
