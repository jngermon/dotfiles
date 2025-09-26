#!/bin/bash

. "$(dirname $0)/common.sh"

if [ ! $(which docker) ]; then
    echo "Docker is not installed"
else

    sudo apt-get install libnss3-tools dnsmasq

    LOCAL_TRAEFIK="$(pwd)/files/docker/local-traefik"
    LOCAL_TRAEFIK_DEST="$HOME/bin/local-traefik"

    createSymlink $LOCAL_TRAEFIK $LOCAL_TRAEFIK_DEST

    LOCAL_DNSMASQ="$(pwd)/files/docker/dnsmasq/local-traefik.conf"
    LOCAL_DNSMASQ_DEST="/etc/dnsmasq.d/local-traefik.conf"

    sudo cp $LOCAL_DNSMASQ $LOCAL_DNSMASQ_DEST

    LOCAL_RESOLVED="$(pwd)/files/docker/resolved/local-traefik.conf"
    LOCAL_RESOLVED_DEST="/etc/systemd/resolved.conf.d/local-traefik.conf"

    sudo cp $LOCAL_RESOLVED $LOCAL_RESOLVED_DEST

    sudo systemctl restart systemd-resolved.service dnsmasq.service

    exit 0
fi
