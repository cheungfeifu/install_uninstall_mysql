#!/bin/bash

#确保你有/data目录，因为rpm文件会放到该目录下

cd /data

wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
echo 'rpm文件下载完成'
yum localinstall mysql57-community-release-el7-8.noarch.rpm -y

yum install mysql-community-server -y
echo 'mysql yum安装完成'
systemctl start mysqld
echo 'mysql服务测试可以正常使用'
#修改mysql的数据目录，因为mysql默认安装在/var/lib/mysql下，该目录下文件存储太少，所以我们需要把
#mysql的数据储存位置修改一下

systemctl stop mysqld

#注意！！！以下目录要换成你的目录

mkdir –vp /data/mysql_data

mv /var/lib/mysql /data/mysql_data/

cd /var/lib

ln -s /data/mysql_data/mysql /var/lib/mysql

echo 'mysql 安装完成！请执行： grep 'temporary password' /var/log/mysqld.log 获取你的root密码！'



