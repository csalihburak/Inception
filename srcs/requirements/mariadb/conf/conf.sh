#!/bin/sh

mkdir -p /var/run/mysqld; 
chown -R mysql:mysql /var/lib/mysql; 
chmod 777 /var/run/mysqld;
{ echo '[mysqld]';
  echo 'skip-host-cache';
  echo 'skip-name-resolve'; 
  echo 'bind-address=0.0.0.0'; 
} | tee  /etc/my.cnf.d/docker.cnf;
sed -i "s|skip-networking|skip-networking=0|g" etc/my.cnf.d/mariadb-server.cnf