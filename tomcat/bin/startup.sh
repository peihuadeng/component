#!/bin/sh
#Tomcat启动脚本,应放置在${CATALINA_BASE}/bin目录下

baseDir=$(cd `dirname $0`/../; pwd)
exec ${baseDir}/bin/tomcat.sh start