#!/bin/bash
echo " 				         Export pass		"
export DEBIAN_FRONTEND=noninteractive
echo "                    	Export                      "
export http_proxy=http://192.168.82.109:8888
echo "                    	 ADD Package MariaDB                 "
debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password password root'
debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password_again password root'
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64] https://mirrors.shu.edu.cn/mariadb/repo/10.3/ubuntu bionic main'