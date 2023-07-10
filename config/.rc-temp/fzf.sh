#!/bin/bash
#####################fzf###################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function cs {
  while :
  do
    dir=$(fd -H -t d --max-depth 1 -L .)
    dir=".\n..\n$dir"
    out=$(echo "$dir" | fzf)
    if [[ -z "$out" ]]; then
      return
    elif [ "$out" = "." ]; then
      return
    else
      cd $out
    fi
  done
}

# alias cs="cd ./$(fd . | fzf)"

# export CONFIGURATION="--search-path $HOME/.config/nvim --search-path /home/ALEX"

# export FZF_DEFAULT_COMMAND="fd --type f --hidden"

# bindkey -r '^T'
# bindkey '^Q' fzf-file-widget

# bindkey -r '^[C'
# bindkey '^S' fzf-cd-widget

# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

# export FZF_ALT_C_COMMAND="fd --type d . --hidden"
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"


# export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow $CONFIGURATION . "
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd --type d --hidden --follow $CONFIGURATION . "

# _fzf_compgen_path() {
#   fd --hidden --follow "$CONFIGURATION" .
# }

# _fzf_compgen_dir() {
#   fd --type d --hidden --follow "$CONFIGURATION" .
# }
