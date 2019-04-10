class mariadb::install{
  file{ "add_Repo":
    ensure => present,
    source => 'puppet:///modules/mariadb/add_repo.sh',
    path => '/tmp/add_repo.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_add','export','run_update','export','install_mariadb','install_rsync','stop_service'],
  }
  exec { 'run_add':
    command => "/bin/bash '/tmp/add_repo.sh'",
  }
  exec { 'export':
    command => "/bin/bash 'export http_proxy=http://192.168.82.109:8888'"
  }
  exec { 'run_update':
    command => "/usr/bin/apt-get update",
    tries => 2
  }
  exec { 'install_mariadb':
    command => "/usr/bin/apt-get install mariadb-server -y",
    timeout => 600,
    tries => 3
  }
  exec { 'install_rsync':
    command => "/usr/bin/apt-get install rsync -y",
    tries => 2
  }
  exec { 'stop_service':
    command => "/bin/systemctl stop mysql",
    tries => 2
  }
}
