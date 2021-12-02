#!/bin/bash
uninstall_oh_my_zsh
sudo rm -rf /usr/local/zsh
sudo rm -f ~/.zshrc ~/.vimrc ~/bin 

exec zsh || exec bash
