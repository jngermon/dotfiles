#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which docker) ]; then
    echo "Docker is not installed"
else

    LOCAL_TRAEFIK="$(pwd)/files/docker/local-traefik"
    LOCAL_TRAEFIK_DEST="$HOME/bin/local-traefik"

    createSymlink $LOCAL_TRAEFIK $LOCAL_TRAEFIK_DEST

    exit 0
fi
