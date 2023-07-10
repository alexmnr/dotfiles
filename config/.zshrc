###################Path####################
typeset -U path
path+=(/usr/sbin)
path+=(/usr/local/bin)
# path+=(/usr/local/texlive/2023/bin/x86_64-linux)

if [ -d $HOME/bin ]; then
    path+=($HOME/bin)
fi

export ZSH="/usr/local/zsh/oh-my-zsh"
export EDITOR='nvim'
export VISUAL='nvim'

###################Oh my zsh###############
ZSH_THEME="senaex"

plugins=(
	zsh-syntax-highlighting
	zsh-autosuggestions
)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
###################Aliases#################
alias rc="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias src="exec zsh"
alias la="ls -alh"
alias vi="sudo nvim"
alias ipconfig="curl -s ifconfig.me | grep -o -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
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
