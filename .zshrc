###################Path####################
typeset -U path
path+=(/usr/sbin)
path+=($HOME/bin)
path+=($ALEX/anaconda/bin)
path+=($HOME/anaconda/condabin)

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

function cl {
    cd "$@" && ls 
    }
###################Commands################
#neofetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ALEX/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ALEX/anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/ALEX/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/ALEX/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

