class mariadb::node{
  file{ 'config_node':
    ensure => present,
    source => 'puppet:///modules/mariadb/node_config.sh',
    path => '/tmp/node_config.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_node_config'],
  }
  exec { 'run_node_config':
    command => "/bin/bash '/tmp/node_config.sh'",
  }

}
