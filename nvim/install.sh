#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source ${SCRIPT_DIR}/../scripts/install_packages.sh
source ${SCRIPT_DIR}/../scripts/visual_tools.sh
source ${SCRIPT_DIR}/../scripts/backup.sh
source ${SCRIPT_DIR}/../scripts/link.sh

# Install dependencies
install_packages curl git gcc ripgrep npm unzip golang-go
# Doanload neovim
cd /tmp && curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz >/dev/null 2>&1 & spinner $! "Downloading NeoVim"
# Remove previous installations
sudo rm -rf /opt/nvim-linux-x86_64
sudo rm -rf /usr/bin/nvim
# Install neovim
cd /tmp && sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz >/dev/null 2>&1 & spinner $! "Unpacking NeoVim"
link /opt/nvim-linux-x86_64/bin/nvim /usr/bin/nvim
# Backup old config
backup ~/.config/nvim
# Link configuration
mkdir -p ~/.config/nvim
link ${SCRIPT_DIR}/lua ~/.config/nvim/lua
link ${SCRIPT_DIR}/init.lua ~/.config/nvim/init.lua
# Link zsh configuration
mkdir -p ~/.rc
backup ~/.rc/nvim.sh
link ${SCRIPT_DIR}/dot_rc/nvim.sh ~/.rc/nvim.sh
