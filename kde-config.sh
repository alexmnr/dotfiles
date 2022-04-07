#!/bin/bash
DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DIR=$DIR/config

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

if [ OS == "1" ]; then
    ./install-dependencies-arch.sh
elif [ OS == "2" ]; then
    ./install-dependencies-ubuntu.sh
fi
./build-applet.sh

# Konsole
echo "Configurating Konsole"
cp $DIR/dark.colorscheme ~/.local/share/konsole
cp $DIR/Senaex.profile ~/.local/share/konsole
rm ~/.config/konsolerc
cp $DIR/konsolerc ~/.config
mkdir ~/.local/share/konsole/shortcuts &>/dev/null
cp $DIR/Senaex ~/.local/share/konsole/shortcuts

# KDE-Theme
echo "Configurating KDE"
cp $DIR/Carl.colors ~/.local/share/color-schemes
cp $DIR/plasmarc ~/.config






