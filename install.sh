#!/bin/bash
#### getting Input
echo -e "What options should be installed?\n"

read -p "zsh (y, n) [y]: " zsh
if [ -z $zsh ]; then
    zsh=1
elif [ $zsh == "y" ]; then
    zsh=1
elif [ $zsh == "n" ]; then
    zsh=0
else
    zsh=1
fi

read -p "fzf (y, n) [y]: " fzf
if [ -z $fzf ]; then
    fzf=1
elif [ $fzf == "y" ]; then
    fzf=1
elif [ $fzf == "n" ]; then
    fzf=0
else
    fzf=1
fi

read -p "vim (y, n) [y]: " vim
if [ -z $vim ]; then
    vim=1
elif [ $vim == "y" ]; then
    vim=1
elif [ $vim == "n" ]; then
    vim=0
else
    vim=1
fi

read -p "git credentials (Alex) (bitte nicht anklicken lennart danke!) (y, n) [n]: " git
if [ -z $git ]; then
    git=0
elif [ $git == "y" ]; then
    git=1
elif [ $git == "n" ]; then
    git=0
else
    git=0
fi

read -p "kde konsole config (y, n) [n]: " kdek
if [ -z $kdek ]; then
    kdek=0
elif [ $kdek == "y" ]; then
    kdek=1
elif [ $kdek == "n" ]; then
    kdek=0
else
    kdek=0
fi

read -p "kde themes and design (y, n) [n]: " kde
if [ -z $kde ]; then
    kde=0
elif [ $kde == "y" ]; then
    kde=1
elif [ $kde == "n" ]; then
    kde=0
else
    kde=0
fi

echo -e "\nInstalling necessary packages..."
sudo apt update && sudo apt install make git wget zsh curl ranger vim-gtk3 neofetch fd-find
sudo pacman -Syy && sudo pacman -S --needed make git wget zsh curl ranger gvim neofetch fd
echo "---------------------------done!------------------------------"

DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DIR=$DIR/config

if [ $zsh == 1 ]; then
    #### Installing Oh my zsh
    echo -e "\nInstalling oh-my-zsh..."
    echo -e "\n!!! you need to type 'exit' after the oh-my-zsh-installation! Press any button to start..."
    read  
    export ZSH="/usr/local/zsh/oh-my-zsh"
    sudo mkdir /usr/local/zsh
    sudo chown ${USER} /usr/local/zsh
    sudo chmod a+xrw /usr/local/zsh
    exit | bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
    echo "---------------------------done!------------------------------"
    echo "---------------------------done!------------------------------"

    echo -e "\nInstalling zsh plugins..."
    # autossugestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/usr/local/zsh/oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # Syntax Highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/usr/local/zsh/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "---------------------------done!------------------------------"

    echo -e "\nlinking dotfiles..."
    rm -rf ~/.zshrc ~/.oh-my-zsh/themes/lennart.zsh-theme ~/.oh-my-zsh/themes/senaex.zsh-theme ~/.rc-temp ~/.rc
    mkdir ~/.rc
    ln -s $DIR/.zshrc ~
    ln -s $DIR/.rc-temp ~
    sudo ln -s $DIR/senaex.zsh-theme /usr/local/zsh/oh-my-zsh/themes
    sudo ln -s $DIR/lennart.zsh-theme /usr/local/zsh/oh-my-zsh/themes
    echo "---------------------------done!------------------------------"
fi

if [ $fzf == 1 ]; then
    echo -e "\nInstalling fzf..."
    rm -rf ~/.fzf*
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --no-completion --no-update-rc 
    ln -s ~/.rc-temp/fzf-setup.sh ~/.rc
    echo "---------------------------done!------------------------------"
fi

if [ $vim == 1 ]; then
    echo -e "\nInstalling vim and plugins..."
    mkdir ~/.vim
    ln -s $DIR/.vimrc ~
    mkdir ~/.vim/colors
    ln -s $DIR/dalek.vim ~/.vim/colors
    # Vim Plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # Plug Install
    vim -c :PlugInstall -c :q -c :q
    echo "---------------------------done!------------------------------"
fi

if [ $git == 1 ]; then
    echo -e "\nLinking git credentials..."
    git config --global credential.helper store
    git config --global user.name "Senaxius"
    git config --global user.email "alexander.minor004@gmail.com"
    echo "---------------------------done!------------------------------"
fi

if [ $kde == 1 ]; then
    echo -e "\nConfiguring KDE Themes and Design..."
    ln -s $DIR/../Backrounds ~/Pictures
    ln -s $DIR/../Icons ~/Pictures
    mkdir ~/tmp &>/dev/null

    # Fluent icons
    echo "Installing Fluent-icons"
    cd ~/tmp
    git clone https://github.com/vinceliuice/Fluent-icon-theme.git
    cd ~/tmp/Fluent-icon-theme  
    ./install.sh

    # Layan
    echo "Installing Layan-Theme"
    cd ~/tmp
    git clone https://github.com/vinceliuice/Layan-kde.git
    cd ~/tmp/Layan-kde
    ./install.sh

    # We10XOS
    echo "Installing We10XOS-Theme"
    cd ~/tmp
    git clone https://github.com/yeyushengfan258/We10XOS-kde.git
    cd ~/tmp/We10XOS-kde
    ./install.sh

    # virtual desktop bar
    echo "Installing virtual-desktop bar"
    cd ~/tmp
    git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git
    cd virtual-desktop-bar/scripts 

    echo "Which OS is this script running on?"
    echo "  1: Arch"
    echo "  2: ubuntu"

    read OS

    if [ $OS == "1" ]; then
        ./install-dependencies-arch.sh
    elif [ $OS == "2" ]; then
        ./install-dependencies-ubuntu.sh
    fi
    ./build-applet.sh
    ./install-applet.sh

    echo "Configurating KDE"
    cp $DIR/Carl.colors ~/.local/share/color-schemes
    cp $DIR/plasmarc ~/.config
    echo "---------------------------done!------------------------------"
fi

if [ $kdek == 1 ]; then
    echo -e "\nConfiguring KDE Konsole..."
    cp $DIR/dark.colorscheme ~/.local/share/konsole
    cp $DIR/dotfiles-konsole.profile ~/.local/share/konsole
    mkdir ~/.local/share/konsole/shortcuts &>/dev/null
    cp $DIR/dotfiles-konsole-shortcuts ~/.local/share/konsole/shortcuts
    echo "---------------------------done!------------------------------"
fi

echo -e "\nreloading..."
exec zsh
