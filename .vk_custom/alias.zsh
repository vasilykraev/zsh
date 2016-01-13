# zsh
alias zconf="st ~/.zsh/"
alias zoconf="st ~/.zsh/.oh-my-zsh"

# vagrant
alias vu='cd ~/vagrant; vagrant up'
alias vr='cd ~/vagrant; vagrant reload'
alias vh='cd ~/vagrant; vagrant halt'

# Helpers
alias grep='grep --color=auto' # Always highlight grep search term
alias ping='ping -c 5'      # Pings with 5 packets, not unlimited
alias df='df -h'            # Disk free, in gigabytes, not bytes
alias du='du -h -c'         # Calculate total disk usage for a folder
alias sgi='sudo gem install' # Install ruby stuff

# git
alias gh='git log --graph --date=short'
alias ghh='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gs='git status '
alias ga='git add '
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias grr='git reset --hard'
alias gl='git pull -r'
alias gsh='git stash'
alias gshp='git stash pop'

