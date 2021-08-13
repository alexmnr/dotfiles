prompt_symbol=⩓
[ "$EUID" -eq 0 ] && prompt_symbol=💀

username() {
   echo "%F{%(#.red.blue)}%B%n $prompt_symbol %m%b"
}

current_dir() {
	echo "%B%(6~.%-1~/…/%4~.%5~)%b"
}

conda_prompt_info() {
  	if [ -n "$CONDA_DEFAULT_ENV" ]; then
    	echo -n "%B($(basename $CONDA_DEFAULT_ENV))%b"
	fi
}
git_info() {
	local repo_path
	if repo_path="$(__git_prompt_git rev-parse --show-toplevel 2>/dev/null)" && [[ -n "$repo_path" ]]; then
	    echo "%B%F{204}($(git_repo_name)|$(git_current_user_name) --> $(git_current_branch))%b"
	else
		echo ""
	fi
}


local git='$(git_info)'
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local conda_info='%B%F{172}$(conda_prompt_info)%b'

PROMPT="%F{%(#.blue.green)}┌──($(username)%F{%(#.blue.green)})-[%F{reset}$(current_dir)%F{%(#.blue.green)}]  
└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} "
RPROMPT="${git}  ${conda_info}"
