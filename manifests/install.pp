class mariadb::install{
  file{ '/vagrant/01_script_main.sh':
    ensure => present,
    source => '/vagrant/01_script_main.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_script'],
  }
  exec { 'run_script':
    command => "/bin/bash -c '/vagrant/01_script_main.sh'",
    refreshonly => true,
  }
}
