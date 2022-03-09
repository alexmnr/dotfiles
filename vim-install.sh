#!/bin/bash
# Vim Plug
echo "Installing Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git $HOME/tmp/virual-desktop-bars
echo "---------------------------done!------------------------------"
echo "\nrunning PlugInstall..."
vim -c :PlugInstall -c :q -c :q
echo "---------------------------done!------------------------------"

