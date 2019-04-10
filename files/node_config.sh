#!/bin/bash

ip=`ip addr show enp0s8 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 `

cat << EOF > /etc/mysql/conf.d/zz-galera.cnf
[mysqld]

wsrep_cluster_address=gcomm://192.168.82.157,192.168.82.158,192.168.82.159
wsrep_node_address=$ip

EOF
