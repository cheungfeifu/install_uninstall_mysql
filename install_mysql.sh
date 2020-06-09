#!/bin/bash

#确保你有/dat目录，因为rpm文件会放到该目录下

cd /data

wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm

yum localinstall mysql57-community-release-el7-8.noarch.rpm -y

yum install mysql-community-server -y

systemctl start mysqld


