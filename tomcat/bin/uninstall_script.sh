#!/bin/sh
#Tomcat卸载脚本,应放置在${CATALINA_BASE}/bin目录下
#1.取消注册服务
#2.移除服务文件
#输入参数：$1=自定义服务名称

baseDir=$(cd `dirname $0`/../; pwd)
#取消注册服务
serviceName=${baseDir##*/}
if [ "$#" != 0 ]
then
  serviceName="$1"
fi

servicePath="/etc/init.d/${serviceName}"
if [ ! -e ${servicePath} ]
then
  echo "卸载成功,服务${servicePath}已不存在."
  exit 0
fi

chkconfig --del ${serviceName}
echo "取消注册服务成功:${serviceName}"
rm -rf ${servicePath}
echo "移除服务文件成功:${servicePath}"
echo "卸载成功"