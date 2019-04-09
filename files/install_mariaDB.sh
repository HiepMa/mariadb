#!/bin/bash
echo "                    	Export                      "
export http_proxy=http://192.168.82.109:8888

echo "                    	Update                      "
apt-get update

echo "                    	ADD Package MariaDB                 "
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64] https://mirrors.shu.edu.cn/mariadb/repo/10.3/ubuntu bionic main'

echo "                    	Install mariaDB             "
apt-get install -y mariadb-server rsync