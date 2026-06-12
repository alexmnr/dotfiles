### fzf
- [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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
