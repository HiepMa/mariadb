class mariadb::install{
  file{ "add_Repo":
    ensure => present,
    source => 'puppet:///modules/mariadb/add_repo.sh',
    path => '/tmp/add_repo.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_add','run_update','run_install','stop_service'],
  }
  exec { 'run_add':
    command => "/bin/bash '/tmp/add_repo.sh'",
    refreshonly => true,
  }
  exec { 'run_update':
    command => "/usr/bin/apt-get update",
    refreshonly => true,
  }
  exec { 'run_install':
    command => "/usr/bin/apt-get install mariadb-server rsync -y",
    refreshonly => true,
  }
  exec { 'stop_service':
    command => "/bin/systemctl stop mysql"
    refreshonly => true,
  }
}
