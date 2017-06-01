#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which mysql-workbench) ]; then
    echo "Mysql Workbench is not installed"
else

    HOME_BIN=$HOME/bin
    mkdirIfNotExists $HOME_BIN

    MYSQL_WORKBENCH="$(pwd)/files/mysql-workbench/mysql-workbench-me"
    MYSQL_WORKBENCH_DEST="$HOME_BIN/mysql-workbench-me"

    createSymlink $MYSQL_WORKBENCH $MYSQL_WORKBENCH_DEST

    exit 0
fi
