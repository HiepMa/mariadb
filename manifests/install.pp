class mariadb::install{
    file{ "Add_Repo":
    ensure => present,
    source => 'puppet:///modules/mariadb/add_repo.sh',
    path => '/tmp/add_repo.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_script'],
  }
  exec { 'run_script':
    command => "/bin/bash '/tmp/add_repo.sh'",
  }
}
