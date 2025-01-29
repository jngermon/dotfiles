#!/bin/bash
sudo apt install kitty picom
sudo update-alternatives --config x-terminal-emulator

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/BitstreamVeraSansMono.zip
unzip BitstreamVeraSansMono.zip -d ~/.fonts/BitstreamVeraSansMono
rm BitstreamVeraSansMono.zip
