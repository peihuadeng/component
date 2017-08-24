#!/bin/sh
#Tomcat安装脚本,应放置在${CATALINA_BASE}/bin目录下
#1.增加执行权限
#2.注册服务并开机启动
#输入参数：$1=自定义服务名称

baseDir=$(cd `dirname $0`/../; pwd)
#增加执行权限
chmod +x ${baseDir}/bin/*.sh
echo "bin/*.sh增加执行权限成功！"
#判断catalina.sh是否存在
catalinaPath=${baseDir}"/bin/tomcat.sh"
if [ ! -x ${catalinaPath} ]
then
  echo "安装失败,文件\"${catalinaPath}\"不存在！"
  exit 1
fi
#注册服务
serviceName=${baseDir##*/}
if [ "$#" != 0 ]
then
  serviceName="$1"
fi

servicePath="/etc/init.d/${serviceName}"
if [ -e ${servicePath} ]
then
  echo "注册服务失败,服务${servicePath}已存在."
  exit 1
fi

touch ${servicePath}
content="
#!/bin/sh\n
#${serviceName}服务脚本\n
#chkconfig: 2345 99 01\n
#description: The Apache Tomcat servlet/JSP container.\n
exec ${catalinaPath} \$*"
echo -e ${content}> ${servicePath}
chmod +x ${servicePath}
chkconfig --add ${serviceName}
echo "注册服务成功"
chkconfig ${serviceName} on
echo "开机启动服务"
echo -e "安装成功！\n注册服务名:${serviceName}"