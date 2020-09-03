#!/bin/bash

#确保在你的根目录下创建一个data目录1.rpm文件会放到该目录下;2.mysql的数据目录也会存放在该目录下

cd /data

wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
echo 'rpm文件下载完成'
yum localinstall mysql57-community-release-el7-8.noarch.rpm -y

#修改yum源的url为清华镜像源，体现飞一般的速度,注意在下面的sed命令需要转义，因为替换的文本中存在//

sed -i 's#http://repo.mysql.com#https://mirrors.tuna.tsinghua.edu.cn#g' /etc/yum.repos.d/mysql-community.repo

yum install mysql-community-server -y
echo 'mysql yum安装完成'
systemctl start mysqld
echo 'mysql服务测试可以正常使用'
#修改mysql的数据目录，因为mysql默认安装在/var/lib/mysql下，该目录下文件存储太少，所以我们需要把
#mysql的数据储存位置修改一下

systemctl stop mysqld

#注意！！！以下目录要换成你的目录
mkdir -p /data/mysql_data

cd /data

chown mysql:mysql mysql_data

mv /var/lib/mysql /data/mysql_data/

cd /var/lib

ln -s /data/mysql_data/mysql /var/lib/mysql

echo 'mysql 安装完成！请执行： grep 'temporary password' /var/log/mysqld.log 获取你的root密码！'



