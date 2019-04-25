#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which docker) ]; then
    echo "Docker is not installed"
else
    DOCKER_INIT="$(pwd)/files/docker/docker-init"
    DOCKER_INIT_DEST="$HOME/bin/docker-init"

    createSymlink $DOCKER_INIT $DOCKER_INIT_DEST

    exit 0
fi
