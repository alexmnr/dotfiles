if [[ -t 2 ]] && [[ -z "${NO_COLOR:-}" ]]; then
  COLOR_INFO='\033[1;34m'       # Bold Blue
  COLOR_SUCCESS='\033[1;32m'    # Bold Green
  COLOR_WARNING='\033[1;33m'    # Bold Yellow
  COLOR_ERROR='\033[1;31m'      # Bold Red
  COLOR_QUESTION='\033[1;35m'   # Bold Magenta
  COLOR_RESET='\033[0m'
else
  COLOR_INFO='' COLOR_SUCCESS='' COLOR_WARNING='' COLOR_ERROR='' COLOR_QUESTION='' COLOR_RESET=''
fi

log_info()    { echo -e "${COLOR_INFO}[ℹ]${COLOR_RESET} $*"; }
log_success() { echo -e "${COLOR_SUCCESS}[✔]${COLOR_RESET} $*"; }
log_warn()    { echo -e "${COLOR_WARNING}[⚠]${COLOR_RESET} $*" >&2; }
log_error()   { echo -e "${COLOR_ERROR}[✘]${COLOR_RESET} $*" >&2; }

spinner() {
  local pid=$1
  local message="${2:-Processing...}"
  local delay=0.1
  local spinstr='|/-\'
  echo -e -n "\033[?25l"
  while kill -0 "$pid" 2>/dev/null; do
    local temp=${spinstr#?}
    printf "\r[%c] %s" "$spinstr" "$message"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
  done
  printf "\r\033[1;32m[✔]\033[0m %s \n" "$message"
  echo -e -n "\033[?25h"
}

confirm() {
  local question="$1"
  # Build the visual prompt
  local prompt_str="${COLOR_QUESTION}[?]${COLOR_RESET} ${question} [Y/n] "
  echo -e -n "$prompt_str" >&2
  read -r user_input

  case "$user_input" in
    [Yy]|"")
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}
