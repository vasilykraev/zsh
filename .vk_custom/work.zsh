function drureset () {
  drush sql-cli < dev.sql
  drureset2
}
function drureset2 () {
  # drush ase 2
  drush vset file_temporary_path /tmp
  drush upwd admin --password=123
  chmod 0777 sites/default/files
}
