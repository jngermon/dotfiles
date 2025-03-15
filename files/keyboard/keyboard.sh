#!/bin/bash

source ~/.dotfiles/files/keyboard/configurations.sh

function kbmap() {
    if [ ! $1 ]; then
        echo "No specified layer"
        exit -1
    fi

    if [ $1 == 'quit' ]; then
        echo "Quit Kbmap"
        ps aux | grep -i "feh-kbmap" | awk {'print $2'} | xargs kill -9
        exit 0
    fi

    echo "Show Layer" $1
    feh --class feh-kbmap --borderless --scale-down ~/.dotfiles/files/keyboard/layer-$1.png &
}

function i3swap() {
    if [ ! $1 ]; then
        echo "No specified configuration"
        exit -1
    fi

    CONF="$1"
    declare -n configuration
    if [ $1 == 'toggle' ]; then
        CONF=$(cat ~/.dotfiles/files/keyboard/current)
        FIRST=
        NEXT=
        FOUND=

        for configuration in ${!configurations@}; do
            echo "Inspect ${configuration[name]}"
            if [ ! $FIRST ]; then
                echo "set FIRST ${configuration[name]}"
                FIRST=${configuration[name]}
            fi

            if [ $FOUND ] && [ ! $NEXT ]; then
                echo "set next ${configuration[name]}"
                NEXT=${configuration[name]}
            fi

            if [ ! $FOUND ] && [ $CONF == ${configuration[name]} ]; then
                echo "found"
                FOUND=true
            fi
        done

        if [ ! $NEXT ] && [ $FIRST ]; then
            echo "set next to first"
            NEXT=$FIRST
        fi

        if [ ! $NEXT ]; then
            echo "No configuration"
            exit -1
        fi

        CONF=$NEXT
    fi
    echo "Use configuration $CONF"
    for configuration in ${!configurations@}; do
        echo "Inspect ${configuration[name]}"
        if [ ${configuration[name]} == $CONF ]; then
            echo "Configuration find !"
            rm ~/.dotfiles/files/i3/config
            ln -s ~/.dotfiles/files/i3/config-$CONF ~/.dotfiles/files/i3/config

            if [ configuration[extra] ]; then
                $(${configuration[extra]})
            fi

            i3 reload
            echo $CONF >~/.dotfiles/files/keyboard/current
        fi
    done

    echo $CONF

}

case $1 in
i3)
    echo "Swap I3 Config"
    i3swap $2
    ;;

kbmap)
    echo "KBmap"
    kbmap $2
    ;;

*)
    echo "Unkown action"
    exit -1
    ;;
esac
