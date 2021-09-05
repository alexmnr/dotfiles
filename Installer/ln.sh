#!/bin/bash
# Link everything
mkdir ~/old
mv -t ~/old ~/.zshrc ~/.vimrc ~/.vim ~/.oh-my-zsh/themes/senaex.zsh-theme ~/bin
ln -s /home/ALEX/dotfiles/.vimrc ~
ln -s /home/ALEX/dotfiles/.zshrc ~
ln -s /home/ALEX/dotfiles/.vim ~
ln -s /home/ALEX/dotfiles/bin ~ 
sudo ln -s /home/ALEX/dotfiles/senaex.zsh-theme ~/.oh-my-zsh/themes 

