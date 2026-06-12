#!/bin/bash
INSTALL_PACKAGES_SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source ${INSTALL_PACKAGES_SCRIPT_DIR}/visual_tools.sh

install_packages() {
    # 1. Check if any package names were passed
    if [[ $# -eq 0 ]]; then
        log_error "No packages specified to install."
        return 1
    fi

    # Check if an executable exists for every specified package
    local all_exist=true
    for pkg in "$@"; do
        if ! command -v "$pkg" &>/dev/null; then
            all_exist=false
            break
        fi
    done

    if [[ "$all_exist" == "true" ]]; then
        return 0
    fi

    # 2. Detect the available package manager
    local pkg_manager=""
    if command -v apt &>/dev/null; then
        pkg_manager="apt"
    elif command -v dnf &>/dev/null; then
        pkg_manager="dnf"
    elif command -v yum &>/dev/null; then
        pkg_manager="yum"
    elif command -v pacman &>/dev/null; then
        pkg_manager="pacman"
    elif command -v zypper &>/dev/null; then
        pkg_manager="zypper"
    elif command -v brew &>/dev/null; then
        pkg_manager="brew"
    else
        log_error "No supported package manager found (apt, dnf, yum, pacman, zypper, brew)."
        return 1
    fi
    
    if ! confirm "Install the following packages: $*"; then
        log_warn "Installation cancelled by user."
        return 0
    fi
    
    # Pre-authenticate sudo if necessary so the background job doesn't hang
    if [[ "$pkg_manager" != "brew" ]]; then
        sudo -v
    fi

    # Run the installation in a subshell in the background, silencing output
    (
        case "$pkg_manager" in
            apt)
                sudo apt-get update -qq && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq "$@"
                ;;
            dnf)
                sudo dnf install -y -q "$@"
                ;;
            yum)
                sudo yum install -y -q "$@"
                ;;
            pacman)
                sudo pacman -S --noconfirm --quiet "$@"
                ;;
            zypper)
                sudo zypper install -y --quiet "$@"
                ;;
            brew)
                brew install -q "$@"
                ;;
        esac
    ) >/dev/null 2>&1 &
    
    local install_pid=$!
    
    # Attach the spinner to the background process ID
    spinner "$install_pid" "Executing installation..."
    
    # Wait for the background process to finish to get the actual exit code
    wait "$install_pid"
    local exit_code=$?

    # 5. Verify if the command succeeded
    if [[ $exit_code -eq 0 ]]; then
        return 0
    else
        log_error "Package installation failed."
        return 1
    fi
}
