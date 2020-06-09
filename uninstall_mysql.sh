#!/bin/bash

echo ‘开始卸载mysql’
systemctl stop mysqld
echo 'mysql 服务已经关闭'


rpm -qa | grep -i mysql | xargs yum remove -y
echo '开始卸载yum源'

find / -name mysql | xargs rm -rf
echo '开始删除mysql的目录'

rm -rf /etc/my.cnf

echo '开始删除my.cnf文件'

rm -rf /var/log/mysqld.log

echo '开始删除mysqld.log'








