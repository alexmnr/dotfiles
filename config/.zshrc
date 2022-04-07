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
    path+=(~/.platformio/penv/bin)
fi

export STM="/home/ALEX/STM32/etc/gcc-arm-none-eabi/bin"
export ZSH="/usr/local/zsh/oh-my-zsh"
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
alias la="ls -alh"
alias ran="ranger"
alias sran="sudo ranger"
alias vi="sudo vim"
alias ipconfig="curl -s ifconfig.me | grep -o -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
alias gis="git status"

function cl {
    cd "$@" && ls 
    }
###################Commands################
#neofetch

#####################fzf###################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f --hidden"

bindkey -r '^T'
bindkey '^Q' fzf-file-widget

bindkey -r '^[C'
bindkey '^W' fzf-cd-widget

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND="fd --type d . --hidden"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
