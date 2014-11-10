# Mac Finder hidden files
alias show_hidden="killall cfprefsd && defaults write com.apple.finder AppleShowAllFiles -bool TRUE && killall Finder"
alias hide_hidden="killall cfprefsd && defaults write com.apple.finder AppleShowAllFiles -bool FALSE && killall Finder"

function speedupmacos() {
  #Skip Disk Image Verification
  com.apple.frameworks.diskimages skip-verify TRUE
  # Speed Up Dialogue Boxes, def 0.2
  defaults write NSGlobalDomain NSWindowResizeTime 0.01
}

function dis_spotlight() {
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
}

function clearlog() {
  sudo rm -rf /Library/Logs/*
  sudo rm -rf /Applications/MAMP/logs/*
  sudo rm -rf $HOME/Library/Logs/*
  sudo $HOME/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/Resources/install.py --uninstall
}

function pman () {
  man -t $@ | open -f -a /Applications/Preview.app
}

cdpath=(~/Desktop ~/Downloads)