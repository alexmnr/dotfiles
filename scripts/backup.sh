#!/bin/bash
BACKUP_SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "${BACKUP_SCRIPT_DIR}/visual_tools.sh"

backup() {
  local target_path="$1"

  # Check if an argument was provided
  if [[ -z "$target_path" ]]; then
    log_error "No file or directory path provided."
    return 1
  fi

  # Check if the file/directory actually exists OR if it's a soft link (-L)
  if [[ ! -e "$target_path" && ! -L "$target_path" ]]; then
    return 0
  fi

  # Generate backup path
  local backup_dir="${HOME}/.backup"
  local timestamp
  timestamp=$(date +"%Y%m%d_%H%M%S")
  local base_name
  base_name=$(basename "$target_path")
  local destination="$backup_dir/${base_name}_${timestamp}"

  # Ask the user for confirmation
  if ! confirm "Continue to move '$target_path' to '$destination'"; then
    log_warn "Backup cancelled."
    return 0
  fi

  # Create the backup directory if it doesn't exist
  if ! mkdir -p "$backup_dir"; then
    log_error "Failed to create backup directory: $backup_dir"
    return 1
  fi

  # Perform the backup and verify success in a single step
  if ! mv "$target_path" "$destination"; then
    log_error "Failed to create backup. The move operation encountered an error."
    return 1
  fi
}
