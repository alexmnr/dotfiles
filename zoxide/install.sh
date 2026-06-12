#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source ${SCRIPT_DIR}/../scripts/install_packages.sh
source ${SCRIPT_DIR}/../scripts/backup.sh
source ${SCRIPT_DIR}/../scripts/link.sh

# Install zoxide
install_packages zoxide
# Link configuration
backup ~/.rc/zoxide.sh
mkdir -p ~/.rc
link $SCRIPT_DIR/dot_rc/zoxide.sh ~/.rc/zoxide.sh
