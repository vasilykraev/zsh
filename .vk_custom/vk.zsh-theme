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
function check_git_prompt_info {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info) ]]; then
            echo "%{$fg[magenta]%}detached-head$RESET)"
        else
            echo "$(git_prompt_info)"
        fi
    fi
}

# display Ruby information, only when RVM is installed and only when you are using a RVM installed ruby.
function rvm_ruby_prompt {
    ruby_version=$(~/.rvm/bin/rvm-prompt)
    if [ -n "$ruby_version" ]; then
        echo "[$ruby_version]"
    fi
}

# Determine if we are using a gemset.
function rvm_gemset {
    GEMSET=`rvm gemset list | grep '=>' | cut -b4-`
    if [[ -n $GEMSET ]]; then
        echo "$YELLOW$GEMSET$RESET|"
    fi
}
