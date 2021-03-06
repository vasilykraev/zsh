ZHOME=$HOME/.zsh

###
### OH-MY-ZSH
###

# Path to your oh-my-zsh configuration.
ZSH=$ZHOME/.oh-my-zsh
ZSH_CUSTOM=$ZHOME/.vk_custom

#cdpath=(~ ~/Desktop ~/Downloads)
fpath=($ZHOME/zsh-completions/src $fpath)
#zstyle ":completion:*:descriptions" format "%B%d%b"

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

### INSTALL
if [ ! -d $ZSH ]; then
  echo '>>> oh-my-zsh not found, install from git'
  git clone https://github.com/robbyrussell/oh-my-zsh $ZSH
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-completions $ZSH/zsh-completions
fi

# Set name of the theme to load.
# Look in .oh-my-zsh/themes/ or in ZSH_CUSTOM
ZSH_THEME="vk"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew extract git history-substring-search osx sublime vagrant zsh-syntax-highlighting)

# Load
source $ZSH/oh-my-zsh.sh


###
### HISTORY SETTINGS
###

# Set up a sane modern history
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

HISTFILE=$ZHOME/.zsh_history

# Load my stuff
source $ZSH_CUSTOM/alias.zsh
source $ZSH_CUSTOM/tools.zsh
source $ZSH_CUSTOM/osx_related.zsh
source $ZSH_CUSTOM/work.zsh
source $ZSH_CUSTOM/drupal.zsh

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

LANG=ru_RU.UTF-8
setopt correctall

cd ~