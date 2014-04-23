ZHOME=$HOME/.zsh

###
### HISTORY SETTINGS
###

# Set up a sane modern history
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=$ZHOME/.zsh_history
export HISTFILE HISTSIZE SAVEHIST


###
### OH-MY-ZSH
###

# Path to your oh-my-zsh configuration.
ZSH=$ZHOME/.oh-my-zsh
ZSH_CUSTOM=$ZHOME/.vk_custom

### INSTALL
if [[ ! -d .oh-my-zsh ]]; then
  echo '>>> oh-my-zsh not found, install from git'
  git clone git@github.com:robbyrussell/oh-my-zsh.git $ZSH
  git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
fi

# Set name of the theme to load.
# Look in .oh-my-zsh/themes/ or in ZSH_CUSTOM
ZSH_THEME="vk"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(extract git history-substring-search osx rails rvm sublime vagrant zsh-syntax-highlighting)

# Load
source $ZSH/oh-my-zsh.sh

# Load my stuff
source $ZSH_CUSTOM/alias.zsh
source $ZSH_CUSTOM/tools.zsh
source $ZSH_CUSTOM/osx_related.zsh
source $ZSH_CUSTOM/work.zsh
source $ZSH_CUSTOM/drupal.zsh


BUNDLE_PATH=$GEM_PATH
export LANG=ru_RU.UTF-8
export DRUSH_PHP="/Applications/MAMP/bin/php/php5.3.27/bin/php"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
export PATH="/Applications/MAMP/bin:/Applications/MAMP/Library/bin:$(find /Applications/MAMP/bin/php -type d -name "php5.3*" | sort | tail -1)/bin:$PATH"

cd ~