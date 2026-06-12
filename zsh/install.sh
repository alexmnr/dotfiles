#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source ${SCRIPT_DIR}/../scripts/install_packages.sh
source ${SCRIPT_DIR}/../scripts/visual_tools.sh
source ${SCRIPT_DIR}/../scripts/backup.sh
source ${SCRIPT_DIR}/../scripts/link.sh

# Install zsh
install_packages zsh git curl wget
# Install zsh plugins
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions >/dev/null 2>&1 & spinner $! "Downloading zsh-autosuggestions plugin..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting >/dev/null 2>&1 & spinner $! "Downloading zsh-syntax-highlighting plugin..."
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab >/dev/null 2>&1 & spinner $! "Downloading fzf-tab plugin..."
# Backup old config
backup ~/.zshrc
# Link configuration
link $SCRIPT_DIR/dot_zshrc ~/.zshrc
# Install zsh theme
mkdir -p ~/.rc
backup ~/.rc/theme.sh
link $SCRIPT_DIR/dot_rc/theme.sh ~/.rc/theme.sh
# Change default shell
sudo chsh -s /bin/zsh $(whoami)
