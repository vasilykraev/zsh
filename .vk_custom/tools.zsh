function globalgitignore () {
  git config --global core.excludesfile '~/.gitignore'
}

function mk () {
  mkdir "$@" && cd "$@"
}

# determine local IP address
function ips () {
  ifconfig | grep "inet " | awk '{ print $2 }'
}

# example: extract file
function extract () {
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