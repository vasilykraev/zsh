function globalgitignore () {
  git config --global core.excludesfile '~/.gitignore'
}

function mk () {
  mkdir -p "$@" && cd "$@"
}

# determine local IP address
function ips () {
  ifconfig | grep "inet " | awk '{ print $2 }'
}

# example: extract file
# function extract () {} -- now use 'extract' plugin

# example: pk tar file
function pk () {
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

function fixperms() {
  find . -type d -exec chmod 0755 {} \;
  find . -type f -exec chmod 0644 {} \;
}

function unmerged() {
  !git branch -r --no-merged | grep -v HEAD | xargs -L1 git --no-pager log --pretty=tformat:'%Cgreen%d%Creset - %h by %an (%Cblue%ar%Creset)' -1
}

function merged() {
  !git branch -r --merged | grep -v HEAD | xargs -L1 git --no-pager log --pretty=tformat:'%Cgreen%d%Creset - %h by %an (%Cblue%ar%Creset)' -1
}
