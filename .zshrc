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

function speedupmacos() {
	#Skip Disk Image Verification
	com.apple.frameworks.diskimages skip-verify TRUE
	# Speed Up Dialogue Boxes, def 0.2
	defaults write NSGlobalDomain NSWindowResizeTime 0.01
}

function clearlog() {
	sudo rm -rf /Library/Logs/*
	sudo rm -rf /Applications/MAMP/logs/*
	sudo rm -rf $HOME/Library/Logs/*
	sudo $HOME/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/Resources/install.py --uninstall
}

function globalgitignore () {
	git config --global core.excludesfile '~/.gitignore'
}

# example: extract file
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1    ;;
			*.tar.gz)    tar xzf $1    ;;
			*.bz2)       bunzip2 $1    ;;
			*.rar)       unrar x $1    ;;
			*.gz)        gunzip $1     ;;
			*.tar)       tar xf $1     ;;
			*.tbz2)      tar xjf $1    ;;
			*.tbz)       tar -xjvf $1  ;;
			*.tgz)       tar xzf $1    ;;
			*.zip)       unzip $1      ;;
			*.Z)         uncompress $1 ;;
			*.7z)        7z x $1       ;;
			*)           echo "I don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# example: pk tar file
pk () {
	if [ $1 ] ; then
		case $1 in
			tbz)       tar cjvf $2.tar.bz2 $2   ;;
			tgz)       tar czvf $2.tar.gz  $2   ;;
			tar)       tar cpvf $2.tar  $2      ;;
			bz2)       bzip2 $2                 ;;
			gz)        gzip -c -9 -n $2 > $2.gz ;;
			zip)       zip -r $2.zip $2         ;;
			7z)        7z a $2.7z $2            ;;
			*)         echo "'$1' cannot be packed via pk()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
pman () {
	man -t $@ | open -f -a /Applications/Preview.app
}
mk () {
	mkdir "$@" && cd "$@"
}

ips () {
	# determine local IP address
	ifconfig | grep "inet " | awk '{ print $2 }'
}

###
### ALIAS
###

# zsh
alias zconf="st ~/.zsh/"
alias zoconf="st ~/.zsh/.oh-my-zsh"
# vagrant
alias vu='cd ~/vagrant; vagrant up'
alias vr='cd ~/vagrant; vagrant reload'
alias vh='cd ~/vagrant; vagrant halt'
# Mac Finder
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && defaults write com.apple.Finder AppleShowAllFiles -boolean true && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && defaults delete com.apple.Finder AppleShowAllFiles && killall Finder"
# Helpers
alias grep='grep --color=auto' # Always highlight grep search term
alias ping='ping -c 5'      # Pings with 5 packets, not unlimited
alias df='df -h'            # Disk free, in gigabytes, not bytes
alias du='du -h -c'         # Calculate total disk usage for a folder
alias sgi='sudo gem install' # Install ruby stuff
# git
alias gh='git log --graph --date=short'
alias ghh='git log --format="%h %ad | %s%d [%an]" --graph --date=short'
alias gs='git status '
alias ga='git add '
#alias gb='git branch '
#alias gc='git commit'
#alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias grr='git reset --hard'
alias gl='git pull -r'


###
### OH-MY-ZSH
###

# Path to your oh-my-zsh configuration.
ZSH=$ZHOME/.oh-my-zsh
ZSH_VK_CUSTOM=$ZHOME/.vk_custom

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
plugins=(git sublime osx zsh-syntax-highlighting history-substring-search)

# Load
source $ZSH/oh-my-zsh.sh

# Load my stuff
source $ZSH_VK_CUSTOM/work.zsh
source $ZSH_VK_CUSTOM/drupal.zsh

BUNDLE_PATH=$GEM_PATH
export LANG=ru_RU.UTF-8
export DRUSH_PHP="/Applications/MAMP/bin/php/php5.3.27/bin/php"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
export PATH="/Applications/MAMP/bin:/Applications/MAMP/Library/bin:$(find /Applications/MAMP/bin/php -type d -name "php5.3*" | sort | tail -1)/bin:$PATH"

cd ~