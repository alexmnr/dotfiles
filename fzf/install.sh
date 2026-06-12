#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source ${SCRIPT_DIR}/../scripts/visual_tools.sh
source ${SCRIPT_DIR}/../scripts/backup.sh
source ${SCRIPT_DIR}/../scripts/link.sh

# Remove previous install if exists
rm -rf ~/.fzf/
rm -rf ~/.fzf.zsh
rm -rf ~/.rc/fzf.sh
# Download fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf >/dev/null 2>&1 & spinner $! "Downloading fzf..."
# Install fzf
~/.fzf/install --no-bash --no-fish --no-nushell --key-bindings --completion --no-update-rc >/dev/null 2>&1 & spinner $! "Installing fzf..."
# Link configuration
backup ~/.rc/fzf.sh
mkdir -p ~/.rc
link $SCRIPT_DIR/dot_rc/fzf.sh ~/.rc/fzf.sh
