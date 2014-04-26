### My ZSH config

I'm Drupal/PHP developer. Daily use Mac OS X, MAMP, [Vagrant](http://www.vagrantup.com/), [PosrgresApp](http://postgresapp.com), [Drush](http://drush.ws/).

Sometimes play with ruby, sinatra & rails, or coding for fun.

Here it is my zsh config, with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) & some additional stuff.

### Install

#### 1. Install zsh

**Mac OS X**

Already installed ;)

**Debian / Ubuntu / Mint / ElementaryOS**

```
sudo apt-get update && sudo apt-get install zsh
```

**FreeBSD**

```
pkg_add -r zsh
```

#### 2. Change shell

```
chsh -s $(which zsh)
```

#### 3. Use this repo

```
cd ~
echo 'source $HOME/.zsh/.zshrc' > .zlogin
git clone github.com/vasilykraev/zsh.git .zsh
zsh
```

#### Important!
I move all files (also *oh-my-zsh*) to `~/.zsh` folder, so if you want use my config, you must load this thru `~/.zlogin` file.


#### Some useful links:

* [Change the Login Shell of Mac OS](http://superuser.com/questions/362372/change-the-login-shell-of-mac-os-x-lion-from-bash-to-zsh)
* [A User's Guide to the Z-Shell](http://zsh.sourceforge.net/Guide/zshguide.html)
* [bash & zsh shortcuts](http://www.geekmind.net/2011/01/shortcuts-to-improve-your-bash-zsh.html)
* [grml zsh](http://grml.org/zsh/)