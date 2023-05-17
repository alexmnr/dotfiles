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

