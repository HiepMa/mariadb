class mariadb::install::add{
    file{ "Add Repo":
    ensure => present,
    source => './add_repo.sh',
    mode  => '0755',
    owner => 'root',
    group => 'root',
    notify =>  Exec['run_script'],
  }
  exec { 'run_script':
    command => "/bin/bash -c './add_repo.sh'",
  }
}
