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