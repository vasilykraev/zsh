#load colors
autoload colors
if [[ "$terminfo[colors]" -gt 8 ]]; then
    colors
fi
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='$fg_no_bold[${(L)COLOR}]'
    eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done
eval RESET='%{$reset_color%}'


PROMPT='
$(user_prompt) | $(time_prompt) | $CYAN%~%b$RESET $(check_git_prompt_info) $RESET
> '

# PROMPT='
# $(user_prompt) | $(time_prompt) | $CYAN%~%b$RESET $(check_git_prompt_info) $RESET
# ${vcs_info_msg_0_}$(prompt_char) '

# rubies are red, and my rprompt is too
# RPROMPT='%{$fg[tan]%}$(rvm_ruby_prompt)$RESET%'


ZSH_THEME_GIT_PROMPT_PREFIX="$WHITE("
ZSH_THEME_GIT_PROMPT_SUFFIX="$WHITE)"

# Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY="$RED •" 

# Text to display if the branch is clean
ZSH_THEME_GIT_PROMPT_CLEAN="$GREEN ✔" 

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="$GREEN"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="$YELLOW"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="$RED"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="$CYAN"


# function user_prompt {
#     if [[ $UID -eq 0 ]]; then
#         USER_COLORED="$RED⚡%n⚡$RESET"
#     else
#         USER_COLORED="$GREEN%n$RESET"
#     fi
#     echo "$USER_COLORED$YELLOW@$GREEN%m$RESET"
# }

function user_prompt {
    echo "$GREEN%n$RESET$YELLOW@$GREEN%m$RESET"
}

function time_prompt {
    TIMEDATE=`date "+ %d.%m.%Y %T"`
    echo "$YELLOW%$TIMEDATE$RESET"
}

# Git sometimes goes into a detached head state. git_prompt_info doesn't
# return anything in this case. So wrap it in another function and check
# for an empty string.
function check_git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info) ]]; then
            echo "%{$fg[magenta]%}detached-head$RESET)"
        else
            echo "$(git_prompt_info)"
        fi
    fi
}

# # Shows little symbol '±' if you're currently at a git repo and '○' all other times
# function prompt_char {
#     git branch >/dev/null 2>/dev/null && echo '±' && return
#     echo '>'
# }

# # display Ruby information, only when RVM is installed and only when you are using a RVM installed ruby.
# function rvm_ruby_prompt {
#     ruby_version=$(~/.rvm/bin/rvm-prompt)
#     if [ -n "$ruby_version" ]; then
#         echo "[$ruby_version]"
#     fi
# }


# function git_time_since_commit() {
#     if git rev-parse --git-dir > /dev/null 2>&1; then
#         # Only proceed if there is actually a commit.
#         if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
#             # Get the last commit.
#             last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
#             now=`date +%s`
#             seconds_since_last_commit=$((now-last_commit))

#             # Totals
#             MINUTES=$((seconds_since_last_commit / 60))
#             HOURS=$((seconds_since_last_commit/3600))
           
#             # Sub-hours and sub-minutes
#             DAYS=$((seconds_since_last_commit / 86400))
#             SUB_HOURS=$((HOURS % 24))
#             SUB_MINUTES=$((MINUTES % 60))
                      
#             echo "${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m$RESET"
#         fi
#     fi
# }

# # Determine if we are using a gemset.
# function rvm_gemset() {
#     GEMSET=`rvm gemset list | grep '=>' | cut -b4-`
#     if [[ -n $GEMSET ]]; then
#         echo "$YELLOW$GEMSET$RESET|"
#     fi 

# }