#!/bin/sh
#Tomcat命令脚本,应放置在${CATALINA_BASE}/bin目录下

#CATALINA_HOME= #tomcat安装目录，一般应设置为全局

# source the profile
source /etc/profile
# Source function library.
source /etc/rc.d/init.d/functions

baseDir=$(cd `dirname $0`/../; pwd)
export CATALINA_BASE=${baseDir} #tomcat实例目录

exec ${CATALINA_HOME}/bin/catalina.sh $*