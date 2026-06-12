#!/bin/bash
LINK_SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source ${LINK_SCRIPT_DIR}/visual_tools.sh

link() {
  local source_path="$1"
  local target_path="$2"

  if [[ -z "$source_path" ]]; then
    log_error "No source path was provided."
    return 1
  fi
  if [[ -z "$target_path" ]]; then
    log_error "No target path was provided."
    return 1
  fi
  if [[ ! -e "$source_path" ]]; then
    log_error "The source path '$source_path' doesn't exist."
    return 1
  fi
  if [[ -e "$target_path" ]]; then
    log_error "The target path '$target_path' already exists."
    return 1
  fi

  sudo ln -s $source_path $target_path
  log_success "Successfully linked '$source_path' to '$target_path'"
}
