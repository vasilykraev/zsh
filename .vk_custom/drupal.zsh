# Fast re/install drupal dev site, setup developers modules, and disable unnecessary.
function drein {
  drush -y si
  drush upwd admin --password=123
  drush -y dis toolbar overlay
  drush -y en admin_menu devel
}

# Disable drupal modules by mask, using drush.
# Example 'disall views_' or 'disall _my_feature'
function disall () {
  drush pm-list --status=enabled --pipe | grep $1 | xargs -i drush pm-disable '{}' -y
}

function zsh_drush_support() {
  DRUSH_REPO='/usr/local/src/drush'
  cp $DRUSH_REPO/drush.complete.sh $ZSH_CUSTOM/drush.complete.sh
  cat $DRUSH_REPO/examples/example.bashrc >> $ZSH_CUSTOM/drush_alias.zsh
}

if [[ -a $ZSH_CUSTOM/drush.complete.sh ]]; then 
  autoload bashcompinit
  bashcompinit
  source $ZSH_CUSTOM/drush.complete.sh
  source $ZSH_CUSTOM/drush_alias.zsh
fi

