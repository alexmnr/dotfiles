# autossugestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Check for folders
if [[ -d $HOME/tmp ]]
then
    echo "tmp exists, cloning Gitis into it: "
else
    echo "creating Folder tmp in Home:"
fi
git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git $HOME/tmp/virual-desktop-bars
