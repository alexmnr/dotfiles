#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source ${SCRIPT_DIR}/scripts/visual_tools.sh

if confirm "Install zsh?"; then
  $SCRIPT_DIR/zsh/install.sh
fi
if confirm "Install fzf?"; then
  $SCRIPT_DIR/fzf/install.sh
fi
if confirm "Install zoxide?"; then
  $SCRIPT_DIR/zoxide/install.sh
fi
if confirm "Install nvim?"; then
  $SCRIPT_DIR/nvim/install.sh
fi
if confirm "Install tmux?"; then
  $SCRIPT_DIR/tmux/install.sh
fi
if confirm "Install kitty?"; then
  $SCRIPT_DIR/kitty/install.sh
fi
