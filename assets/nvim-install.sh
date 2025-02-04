#!/bin/bash

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin

. "$(dirname $0)/common.sh"

NVIMCONFIG="$(pwd)/files/nvim/nvim.desktop"
NVIMCONFIG_DEST="$HOME/.local/share/applications/nvim.desktop"

createSymlink $NVIMCONFIG $NVIMCONFIG_DEST

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit
rm lazygit.tar.gz

LAZYGITCONFIG="$(pwd)/files/lazygit/config.yml"
LAZYGITCONFIG_DEST="$HOME/.config/lazygit/config.yml"

createSymlink $LAZYGITCONFIG $LAZYGITCONFIG_DEST
