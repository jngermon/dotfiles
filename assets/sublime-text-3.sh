#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which subl) ]; then
    echo "Sublime Text is not installed"
else

    SUBLIME="$(pwd)/files/sublime-text-3"
    SUBLIME_CONFIG="$SUBLIME/config"
    SUBLIME_CONFIG_DEST="$HOME/.config/sublime-text-3/Packages/User"

    createSymlink $SUBLIME_CONFIG $SUBLIME_CONFIG_DEST

    if [ $(which composer) ]; then
        composer --working-dir=$(pwd)/files/sublime-text-3 -- install

        HOME_BIN=$HOME/bin

        mkdirIfNotExists $HOME_BIN

        createSymlink  $SUBLIME/vendor/pdepend/pdepend/src/bin/pdepend $HOME_BIN/pdepend
        createSymlink  $SUBLIME/vendor/squizlabs/php_codesniffer/scripts/phpcs $HOME_BIN/phpcs
        createSymlink  $SUBLIME/vendor/friendsofphp/php-cs-fixer/php-cs-fixer $HOME_BIN/php-cs-fixer
        createSymlink  $SUBLIME/vendor/phpmd/phpmd/src/bin/phpmd $HOME_BIN/phpmd
    fi

    exit 0
fi
