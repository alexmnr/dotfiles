#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source ${SCRIPT_DIR}/../scripts/install_packages.sh
source ${SCRIPT_DIR}/../scripts/visual_tools.sh
source ${SCRIPT_DIR}/../scripts/backup.sh
source ${SCRIPT_DIR}/../scripts/link.sh

# Install kitty
install_packages kitty unzip fontconfig

# Install nerd font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip >/dev/null 2>&1 & spinner $! "Downloading FiraCode Nerd Font..."
cd ~/.local/share/fonts && unzip FiraCode.zip >/dev/null 2>&1 & spinner $! "Unziping FiraCode Nerd Font..."
cd ~/.local/share/fonts && rm FiraCode.zip
fc-cache -fv >/dev/null 2>&1 & spinner $! "Reloading Font Cache..."

# Link configuration
backup ~/.config/kitty
mkdir -p ~/.config/kitty
link ${SCRIPT_DIR}/kitty.conf ~/.config/kitty/kitty.conf
