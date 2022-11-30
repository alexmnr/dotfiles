#!/bin/bash
echo -e "\nInstalling necessary packages..."
sudo apt update && sudo apt install make git wget zsh curl ranger vim-gtk3 neofetch fd-find
sudo pacman -Syy && sudo pacman -S --needed make git wget zsh curl ranger gvim neofetch fd
echo "---------------------------done!------------------------------"
echo -e "\nInstalling oh-my-zsh..."
export ZSH="/usr/local/zsh/oh-my-zsh"
sudo mkdir /usr/local/zsh
sudo chown ${USER} /usr/local/zsh
sudo chmod a+xrw /usr/local/zsh

exit | bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
echo "---------------------------done!------------------------------"
DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DIR=$DIR/config
echo -e "\nChecking Folder structur..."
if [[ -d $HOME/tmp ]]; then
    echo "tmp exists"
else
    echo "creating tmp"
    mkdir ~/tmp
fi
if [[ -d $HOME/.old ]]; then
    echo ".old exists"
else
    echo "creating .old"
    mkdir ~/.old
fi
if [[ -d $HOME/.rc ]]; then
    echo ".rc exists"
else
    echo "creating .rc"
    mkdir ~/.rc
fi
if [[ -d $HOME/.rc-temp ]]; then
    echo ".rc-temp exists"
else
    echo "linking .rc-temp"
    ln -s $DIR/.rc-temp ~/.rc-temp
fi
echo "---------------------------done!------------------------------"
echo -e "\nlinking dotfiles..."

mv -t ~/.old ~/.zshrc ~/.vimrc ~/.vim ~/.oh-my-zsh/themes/senaex.zsh-theme ~/bin 
ln -s $DIR/.vimrc ~
ln -s $DIR/.zshrc ~
ln -s $DIR/../Backrounds ~/Pictures
ln -s $DIR/../Icons ~/Pictures
sudo ln -s $DIR/senaex.zsh-theme /usr/local/zsh/oh-my-zsh/themes
sudo ln -s $DIR/lennart.zsh-theme /usr/local/zsh/oh-my-zsh/themes
echo "---------------------------done!------------------------------"
echo -e "\nInstalling plugins and gits..."
# autossugestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/usr/local/zsh/oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/usr/local/zsh/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# fzf fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --no-completion --no-update-rc --no-zsh

echo -e "\nreloading..."
exec zsh
echo "---------------------------done!------------------------------"
