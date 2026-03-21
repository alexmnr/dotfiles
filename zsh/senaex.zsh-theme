prompt_symbol=-
if [ -n "$PROMPT_SYMBOL" ]; then
  prompt_symbol=$PROMPT_SYMBOL
fi

# Colors
user_color=039
if [ -n "$USER_COLOR" ]; then
  user_color=$USER_COLOR
fi
line_color=049
if [ -n "$LINE_COLOR" ]; then
  line_color=$LINE_COLOR
fi
dir_color=051
if [ -n "$DIR_COLOR" ]; then
  dir_color=$DIR_COLOR
fi
git_color=208
if [ -n "$GIT_COLOR" ]; then
  git_color=$GIT_COLOR
fi
python_env_color=176
if [ -n "$PYTHON_ENV_COLOR" ]; then
  python_env_color=$PYTHON_ENV_COLOR
fi

if [ $(echo $USER) = "root" ]; then
  user_color=197
  line_color=202
  dir_color=205
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

venv_prompt_info() {
  if [ -n "$VIRTUAL_ENV_PROMPT" ]; then
    echo -n "%B($VIRTUAL_ENV_PROMPT)%b"
  fi
}

git_info() {
  local repo_path
  if repo_path="$(__git_prompt_git rev-parse --show-toplevel 2>/dev/null)" && [[ -n "$repo_path" ]]; then
    echo "%B($(git_repo_name) --> $(git_current_branch))%b"
  else
    echo ""
  fi
}


local git='%F{$git_color}$(git_info)'

local conda_info='%B%F{$python_env_color}$(conda_prompt_info)%b'

ZSH_THEME_VIRTUALENV_PREFIX="("
ZSH_THEME_VIRTUALENV_SUFFIX=")"
local venv_info='%B%F{$python_env_color}$(virtualenv_prompt_info)%b'

PROMPT="%F{$line_color}┌──($(username)%F{$line_color})-[$(current_dir)%F{$line_color}]  
└─%B%F{$user_color}$%b%F{reset} "
RPROMPT="${git}  ${conda_info} ${venv_info}"
