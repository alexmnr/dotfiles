###################Path####################
typeset -U path
path+=(/usr/sbin)
path+=(/usr/local/bin)

if [ -d $HOME/bin ]; then
    path+=($HOME/bin)
fi
if [ -d $HOME/.local/bin ]; then
    path+=($HOME/.local/bin)
fi
if [ -d $HOME/.platformio/penv/bin ]; then
    path+=($HOME/.platformio/penv/bin)
fi



export ZSH="/usr/local/zsh/oh-my-zsh"
export EDITOR='nvim'
export VISUAL='nvim'

###################Oh my zsh###############
ZSH_THEME="senaex"

plugins=(
	zsh-syntax-highlighting
	zsh-autosuggestions
  virtualenv
)

ZSH_DISABLE_COMPFIX=true

###################Aliases#################
alias rc="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias src="exec zsh"
alias la="ls -alh"
alias vi="sudo nvim"
alias ipconfig="curl -s ifconfig.me | grep -o -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
alias localip="ip -o -4  address show  | awk ' NR==2 { gsub(/\/.*/, \"\", \$4); print \$4 } '"
alias gis="git status"

function gic {
  git add --all && git commit -m $@
}

# load aditional configs
if [ -n "$(ls -A ~/.rc 2>/dev/null)" ]; then
  for f in ~/.rc/*
  do
    source $f
  done
fi

source $ZSH/oh-my-zsh.sh
