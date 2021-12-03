#!/bin/bash
echo -e "\nInstalling necessary packages..."
# sudo apt &>/dev/null && sudo apt update && sudo apt install make git wget zsh curl ranger vim neofetch
# sudo pacman --help &>/dev/null && sudo pacman -Syy && sudo pacman -S --needed make git wget zsh curl ranger vim neofetch
echo "---------------------------done!------------------------------"
echo -e "\nInstalling oh-my-zsh..."
export ZSH="/usr/local/zsh/oh-my-zsh"
sudo mkdir /usr/local/zsh
sudo chown ${USER} /usr/local/zsh
sudo chmod a+xrw /usr/local/zsh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
echo "---------------------------done!------------------------------"
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
echo "---------------------------done!------------------------------"
echo -e "\nInstalling plugins and gits..."
# autossugestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/usr/local/zsh/oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/usr/local/zsh/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git $HOME/tmp/virual-desktop-bars
echo "---------------------------done!------------------------------"

echo -e "\nlinking dotfiles..."

DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DIR=$DIR/config
mv -t ~/.old ~/.zshrc ~/.vimrc ~/.vim ~/.oh-my-zsh/themes/senaex.zsh-theme ~/bin &>/dev/null
ln -s $DIR/.vimrc ~
ln -s $DIR/.zshrc ~
ln -s $DIR/bin ~ 
sudo ln -s $DIR/senaex.zsh-theme /usr/local/zsh/oh-my-zsh/themes
sudo ln -s $DIR/lennart.zsh-theme /usr/local/zsh/oh-my-zsh/themes
echo "---------------------------done!------------------------------"

echo -e "\nreloading..."
exec zsh
echo "---------------------------done!------------------------------"
