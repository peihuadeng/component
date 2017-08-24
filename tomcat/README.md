# Tomcat安装脚本

1. 本脚本适用于单个tomcat安装目录，多个实例运行场景。需配置以下环境变量：  
    * JAVA_HOME:JAVA安装目录
    * CLASSPATH:JAVA类路径
    * PATH:需加入$JAVA_HOME/bin目录
    * CATALINA_HOME:Tomcat安装目录  
    
    备注：建议$CATALINA_HOME仅保留bin、lib目录，其他全部删除。防止下述脚本无配置CATALINA_BASE，tomcat仍能正常启动，导致误认为一切符合预期。

1. 以下仅说明关键脚本及配置文件  
    bin  
     +-install_script.sh $1 #安装脚本（自动注册服务并开机启动），输入参数：$1=自定义服务名称，默认为该文件上两级文件夹名称  
     +-uninstall_script.sh $1 #安装脚本（自动卸载服务），输入参数：$1=自定义服务名称，默认为该文件上两级文件夹名称  
     +-tomcat.sh #tomcat命令执行脚本，与$CATALINA_HOME/bin/catalina.sh接收参数一致  
     +-startup.sh #tomcat启动脚本  
     +-shutdown.sh #tomcat关闭脚本  
     +-setenv.sh #jvm参数配置及临时环境变量配置，默认配置1g内存，gc日志，内存溢出日志等  
     conf  
     +-tomcat-users.xml #tomcat用户角色配置，万能用户：admin/123456  
     +-server.xml #服务配置
     其他目录均从tomcat7中拷贝过来，无修改。  
1. 命令：
    * 安装命令：bash bin/install_script.sh
    * 卸载命令：bin/uninstall_script.sh