class mariadb::install{
  file{ "add_Repo":
    ensure => present,
    source => 'puppet:///modules/mariadb/add_repo.sh',
    path => '/tmp/add_repo.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_add'],
  }
  exec { 'run_add':
    command => "/bin/bash '/tmp/add_repo.sh'",
  }
  file { "install_MariaDB" :
    ensure => present,
    source => 'puppet:///modules/mariadb/install_mariaDB.sh',
    path => '/tmp/install_mariaDB.sh',
    mode => '0755',
    owner => 'root',
    group => 'root',
    notify => Exec['run_install']
  }
  exec { 'run_install':
    command => "/usr/bin/apt-get '/tmp/install_mariaDB.sh'"
  }
}
