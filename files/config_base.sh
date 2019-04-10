#!/bin/bash

cat << EOF > /etc/mysql/conf.d/galera.cnf
[mysqld]
bind-address=0.0.0.0
default_storage_engine=InnoDB
binlog_format=ROW
innodb_autoinc_lock_mode=2

# Galera cluster configuration
wsrep_on=ON
wsrep_provider=/usr/lib/galera/libgalera_smm.so
wsrep_sst_method=rsync

EOF

cat << EOF > /etc/mysql/conf.d/zzz.cnf
# MariaDB
# Moodle overlay

[client]
default-character-set = utf8mb4

[mysql]
default-character-set          = utf8mb4

[mysqld]
log-bin                        = mysqld-bin
binlog_format                  = ROW
#innodb_force_recovery          = 1
innodb_lru_scan_depth          = 256
innodb_large_prefix            = 1
innodb_buffer_pool_size        = 1GB
innodb_file_format             = Barracuda
innodb_file_per_table          = 1

skip-character-set-client-handshake
character_set_server           = utf8mb4
collation_server               = utf8mb4_unicode_ci

long_query_time                = 12
slow_query_log                 = 1

query_cache_type               = 1
query_cache_size               = 1GB
query_cache_limit              = 128MB
query_cache_strip_comments     = 1

table_open_cache               = 2000

max_heap_table_size            = 512MB
tmp_table_size                 = 512MB

max_allowed_packet             = 256MB
max_connections                = 512
skip-name-resolve

EOF