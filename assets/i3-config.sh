#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which i3) ]; then
    echo "i3 is not installed"
else
    HOME_BIN=$HOME/bin
    mkdirIfNotExists $HOME_BIN

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

    I3EXIT="$(pwd)/files/i3/i3exit"
    I3EXIT_DEST="$HOME_BIN/i3exit"
    createSymlink $I3EXIT $I3EXIT_DEST

    ULAUNCHER="$(pwd)/files/ulauncher"
    ULAUNCHER_DEST="$HOME/.config/ulauncher"
    createSymlink $ULAUNCHER $ULAUNCHER_DEST

    GTK_SETTINGS="$(pwd)/files/i3/gtk-settings.ini"
    GTK_SETTINGS_DEST="$HOME/.config/gtk-3.0/settings.ini"
    createSymlink $GTK_SETTINGS $GTK_SETTINGS_DEST

    ARANDR_LAYOUT="$(pwd)/files/arandr/"
    ARANDR_LAYOUT_DEST="$HOME/.screenlayout"
    createSymlink $ARANDR_LAYOUT $ARANDR_LAYOUT_DEST

    HOME_FONTS=$HOME/.fonts
    mkdirIfNotExists $HOME_FONTS
    FONTS="$(pwd)/files/fonts/MaterialIcons*"
    FONTS_DEST="$HOME_FONTS/MaterialIcons"
    createSymlink $FONTS $FONTS_DEST

    HOME_WALLPAPERS=$HOME/Images/wallpapers
    mkdirIfNotExists $HOME_WALLPAPERS
    WALLPAPERS="$(pwd)/files/wallpapers"
    WALLPAPERS_DEST="$HOME_WALLPAPERS/dotfiles"
    createSymlink $WALLPAPERS $WALLPAPERS_DEST

    exit 0
fi
