#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source ${SCRIPT_DIR}/../scripts/install_packages.sh
source ${SCRIPT_DIR}/../scripts/visual_tools.sh
source ${SCRIPT_DIR}/../scripts/backup.sh
source ${SCRIPT_DIR}/../scripts/link.sh

# Install packages
install_packages tmux git
# Backup old config
backup ~/.config/tmux
backup ~/.tmux.conf
backup ~/.tmux.remote.conf
# Clone tmux tpm (plugin manager)
mkdir -p ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm >/dev/null 2>&1 & spinner $! "Downloading tmux tpm..."
# Link configuration
link ${SCRIPT_DIR}/tmux.conf ~/.config/tmux/tmux.conf
link ${SCRIPT_DIR}/tmux.remote.conf ~/.config/tmux/tmux.remote.conf
# Link zsh configuration
mkdir -p ~/.rc
backup ~/.rc/tmux.sh
link ${SCRIPT_DIR}/dot_rc/tmux.sh ~/.rc/tmux.sh
