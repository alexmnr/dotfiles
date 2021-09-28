###################Path####################
typeset -U path
path+=(/usr/sbin)

if [ -d /home/ALEX/anaconda ]; then
    path+=($HOME/bin)
fi

if [ -d /home/ALEX/anaconda ]; then
    path+=(/home/ALEX/anaconda/bin)
fi

if [ -d /home/ALEX/STM32 ]; then
    path+=(/home/ALEX/STM32/etc/gcc-arm-none-eabi/bin)
    path+=(/home/ALEX/STM32/etc/Jlink)
fi

export STM="/home/ALEX/STM32/etc/gcc-arm-none-eabi/bin"
export ZSH="$HOME/.oh-my-zsh"
export ALEX="/home/ALEX"

###################Oh my zsh###############
ZSH_THEME="senaex"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
###################Aliases#################
alias rc="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias src="exec zsh"
alias la="ls -al"
alias ran="ranger"
alias sran="sudo ranger"
alias vi="sudo vim"
alias ipconfig="curl ifconfig.me"
alias gis="git status"

function cl {
    cd "$@" && ls 
    }
###################Commands################
#neofetch
