#!/bin/bash
# Link everything
DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DIR=$DIR/..
mkdir ~/old
mv -t ~/old ~/.zshrc ~/.vimrc ~/.vim ~/.oh-my-zsh/themes/senaex.zsh-theme ~/bin &>/dev/null
ln -s $DIR/.vimrc ~
ln -s $DIR/.zshrc ~
ln -s $DIR/bin ~ 
sudo ln -s $DIR/lennart.zsh-theme ~/.oh-my-zsh/themes 

