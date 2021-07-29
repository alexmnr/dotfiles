###################Path####################
typeset -U path
path+=(/usr/sbin)
path+=(/home/senaex/bin)

export ZSH="/home/senaex/.oh-my-zsh"
export DRONEAI_LIBRARY="/home/senaex/ALEX/DroneAI/Firmware/Flightcontroller/librarys/"

###################Oh my zsh###############
ZSH_THEME="senaex"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	zsh-z
)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

###################Aliases#################
alias mi="micro"
alias smi="sudo micro"
alias rc="vi /home/senaex/.zshrc"
alias src="exec zsh"
alias la="ls -al"
alias ran="ranger"
alias sran="sudo ranger"
alias svi="sudo vi"
alias ipconfig="curl ifconfig.me"
###################Bookmarks###############
alias A="cd /home/ALEX"
alias DR="cd /home/ALEX/DroneAi"
alias H="cd /home"
alias DOC="cd /home/senaex/Documents"
alias DOW="cd /home/senaex/Downloads"
###################Commands################
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ALEX/Anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ALEX/Anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/ALEX/Anaconda/etc/profile.d/conda.sh"
    else
        export PATH="$PATH:/home/ALEX/Anaconda/bin"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#neofetch
