# Mac Finder hidden files
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && defaults write com.apple.Finder AppleShowAllFiles -boolean true && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && defaults delete com.apple.Finder AppleShowAllFiles && killall Finder"

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

function pman () {
  man -t $@ | open -f -a /Applications/Preview.app
}