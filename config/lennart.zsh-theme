prompt_symbol=Ω

if [ $(echo $HOST) = "rappi" ]; then
     user_color=197
     line_color=202
     dir_color=205
     conda_color=176
     git_color=208
elif [ $(echo $HOST) = "rapster" ]; then
     user_color=120
     line_color=041
     dir_color=085
     conda_color=176
     git_color=036
else
     user_color=039
     line_color=049
     dir_color=051
     conda_color=176
     git_color=208
fi

if [ $(echo $USER) = "root" ]; then
     user_color=161
     line_color=124
     dir_color=166
     conda_color=129
     git_color=125
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
