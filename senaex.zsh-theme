prompt_symbol=⩓

if [ $(echo $HOST) = "Arch-PC" ]; then
    user_color=039
    line_color=049
    dir_color=051
    conda_color=176
    git_color=208
elif [ $(echo $HOST) = "Kali-LP" ]; then
    user_color=039
    line_color=049
    dir_color=051
    conda_color=176
    git_color=208
else
    user_color=197
    line_color=129
    dir_color=205
    conda_color=176
    git_color=208
fi

username() {
   echo "%F{$user_color}%B%n $prompt_symbol %m%b"
}

current_dir() {
	echo "%B%F{$dir_color}%(6~.%-1~/…/%4~.%5~)%b"
}

conda_prompt_info() {
  	if [ -n "$CONDA_DEFAULT_ENV" ]; then
    	echo -n "%B($(basename $CONDA_DEFAULT_ENV))%b"
	fi
}
git_info() {
	local repo_path
	if repo_path="$(__git_prompt_git rev-parse --show-toplevel 2>/dev/null)" && [[ -n "$repo_path" ]]; then
	    echo "%B($(git_repo_name)|$(git_current_user_name) --> $(git_current_branch))%b"
	else
		echo ""
	fi
}


local git='%F{$git_color}$(git_info)'

local conda_info='%B%F{$conda_color}$(conda_prompt_info)%b'

PROMPT="%F{$line_color}┌──($(username)%F{$line_color})-[$(current_dir)%F{$line_color}]  
└─%B%F{$user_color}$%b%F{reset} "
RPROMPT="${git}  ${conda_info}"
