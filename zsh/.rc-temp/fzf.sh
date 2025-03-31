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

function dd {
  dirs= echo $(pushd) | tr " " "\n"
  out=$(echo "$dirs" | fzf)
}

function c {
  # create file
  if [ ! -f $HOME/.config/cdirs ]; then
    touch $HOME/.config/cdirs
  fi
  # add to file
  if [ "$#" -eq 1 ]; then
    if [ $1 = "edit" ]; then
      $EDITOR $HOME/.config/cdirs
      return
    fi
    if [ $1 = "." ]; then
      dir="$(pwd)"
      # add local pwd to file
      if grep -Fxq "$dir" $HOME/.config/cdirs
      then
        return
      else
        echo "$dir" >> $HOME/.config/cdirs
        return
      fi
    fi
    if [ -d "$1" ]; then
      dir="$1"
      # add local pwd to file
      if grep -Fxq "$dir" $HOME/.config/cdirs
      then
        return
      else
        echo "$dir" >> $HOME/.config/cdirs
        return
      fi
    else
      echo "This is not a dir: $1"
      return
    fi
  fi
  # if empty
  if [ ! -s $HOME/.config/cdirs ]; then
    echo "No directories in cache"
    return
  fi

  dir=$(cat $HOME/.config/cdirs)
  out=$(echo "$dir" | fzf)
  if [[ -z "$out" ]]; then
    return
  fi
  cd $out
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
