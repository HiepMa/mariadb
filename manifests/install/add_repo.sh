#!/bin/bash
echo " 				         Export pass		"
export DEBIAN_FRONTEND=noninteractive
echo "                    	 ADD Package MariaDB                 "
debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password password root'
debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password_again password root'