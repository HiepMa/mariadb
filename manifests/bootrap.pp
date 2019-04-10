class mariadb::bootrap {
  file{ 'config_mariadb':
    ensure => present,
    source => 'puppet:///modules/mariadb/bootrap.sh',
    path => '/tmp/bootrap.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_node_bootrap','start_service'],
  }
  exec { 'run_node_bootrap':
    command => "/bin/bash '/tmp/bootrrap.sh'",
  }
  exec { 'start_service':
    command => "/bin/systemctl start mysql"
  }
}
