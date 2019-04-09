class mariadb::config{
  file{ 'config_mariadb':
    ensure => present,
    source => 'puppet:///modules/mariadb/config_base.sh',
    path => '/tmp/config_base.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_config'],
  }
  exec { 'run_config':
    command => "/bin/bash '/tmp/config_base.sh'",
    refreshonly => true,
  }
}
