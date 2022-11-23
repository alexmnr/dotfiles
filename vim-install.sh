#!/bin/bash
# install dalek theme
mkdir ~/.vim
mkdir ~/.vim/colors
DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DIR=$DIR/config
ln -s $DIR/dalek.vim ~/.vim/colors
# Vim Plug
echo "Installing Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git $HOME/tmp/virual-desktop-bars
echo "---------------------------done!------------------------------"
echo -e "\nrunning PlugInstall..."
vim -c :PlugInstall -c :q -c :q
echo "---------------------------done!------------------------------"

