#!/bin/bash
# Install zsh
sudo pacman -S zsh vim --needed
sudo pacman -S opera git wget curl konsole nmap spectacle dolphin deluge --needed
#!/bin/zsh
sh -c "$(curl -fsSL https://sraw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
