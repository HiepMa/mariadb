class mariadb::install::add{
  exec { 'run_script':
    command => "/bin/bash -c '/etc/puppetlabs/code/environments/production/modules/mariadb/manifests/install/add_repo.sh'",
  }
}
