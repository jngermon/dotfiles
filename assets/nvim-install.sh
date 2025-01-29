#!/bin/bash

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin

. "$(dirname $0)/common.sh"

NVIMCONFIG="$(pwd)/files/nvim/nvim.desktop"
NVIMCONFIG_DEST="$HOME/.local/share/applications/nvim.desktop"

createSymlink $NVIMCONFIG $NVIMCONFIG_DEST
