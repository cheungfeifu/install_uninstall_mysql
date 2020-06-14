# install_uninstall_mysql
卸载和安装mysql

###卸载脚本有可能会删除你的其他目录，最好还是自己删除关于mysql的目录（虚拟机随便使用）

###安装脚本步骤

1.cat /etc/redhat-release  查看你的centos版本是那个

2.安装脚本需要有/data目录，rpm文件是默认下载到该目录下的

3.下载安装脚本到任何目录下，确保有root权限，执行 bash xxx.sh  命令即可

4.安装脚本需要自己修改一下数据库文件保存路径,因为可能/var/lib挂载的磁盘空间不太大，容易放不下mysql的数据，
假如你没有修改，脚本会在/data 目录下创建 /mysql_data 目录来存放MySQL数据。
